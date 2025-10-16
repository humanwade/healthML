package com.example.controller;

import java.io.File;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.example.domain.PhotosVO;
import com.example.domain.UserVO;
import com.example.service.UserPhotoService;
import com.example.service.UserService;
import com.example.service.WeightService;
import com.example.util.MD5Generator;
import java.util.Arrays;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/mypage")
public class MypageController {

    @Autowired
    UserService userservice;
    @Autowired
    UserPhotoService userphotoservice;
    @Autowired
    WeightService weightservice;

    @GetMapping("/test")
    public String testPage(Model m, HttpSession sess) {
        //System.out.println("테스트 진입 성공");
        return "mypage/mypage";
    }

    @GetMapping("")
    public String home(Model m, HttpSession sess) {
        Object sessUser = sess.getAttribute("user");
        //System.out.println("sess user: " + sessUser);

        if (sessUser == null) {
            //System.out.println("세션 없음: 로그인 필요");
            return "redirect:/regist/login";
        }

        UserVO vo = new UserVO();
        vo.setEmail((String) sessUser);

        try {
            UserVO user = userservice.getUser_curWeight(vo);
            m.addAttribute("user", user);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "mypage/mypage";
    }

    //프로필 사진 변경
    @Transactional
    @ResponseBody
    @RequestMapping("/changeProfile")
    public String changeProfile(@RequestParam("file") MultipartFile files, HttpSession sess) {
        if (sess.getAttribute("user") == null) return null;
        UserVO user = userservice.getUser((String) sess.getAttribute("user"));

        try {
            String originFilename = files.getOriginalFilename();
            if (originFilename == null || originFilename.isEmpty()) return "fail";

            // 허용 확장자 검사
            String[] accept = {".jpg", ".jpeg", ".png"};
            String extension = originFilename.substring(originFilename.lastIndexOf("."));
            boolean valid = Arrays.stream(accept).anyMatch(a -> a.equalsIgnoreCase(extension));
            if (!valid) return "fail";

            // 📁 프로젝트 루트 기준으로 저장 경로 설정
            String saveDir = new File("user-uploads/userphotos").getAbsolutePath();
            File uploadDir = new File(saveDir);
            if (!uploadDir.exists()) uploadDir.mkdirs();

            // 저장할 파일명 생성 (MD5 + 확장자)
            String filename = new MD5Generator(originFilename).toString() + extension;
            File targetFile = new File(uploadDir, filename);
            files.transferTo(targetFile);  // 저장

            // DB에 저장
            PhotosVO fileVO = new PhotosVO();
            fileVO.setOriginFilename(originFilename);
            fileVO.setFilename(filename);
            fileVO.setFilepath(targetFile.getAbsolutePath());

            if (user.getPhotoid() == null) {
                userphotoservice.insertUserPhoto(fileVO);
                user.setPhotoid(fileVO.getFileid());
                userservice.updateProfile(user);
            } else {
                fileVO.setFileid(user.getPhotoid());
                userphotoservice.updateUserPhoto(fileVO);
            }

            sess.setAttribute("profile", fileVO.getFilename());
            return fileVO.getFilename();

        } catch (Exception ex) {
            ex.printStackTrace();
            return "fail";
        }
    }



    // 회원정보 수정 페이지
    @RequestMapping("/info")
    public String info(Model m, HttpSession sess) {
        UserVO vo = new UserVO();
        vo.setEmail((String) sess.getAttribute("user"));
        UserVO user = userservice.getUser_curWeight(vo);
        m.addAttribute("user", user);
        return "/mypage/info_change";
    }

    // 회원정보 수정
    @RequestMapping("/changeInfo")
    public String changeInfo(HttpSession sess, UserVO user) {
        if (sess.getAttribute("user") == null)
            return "redirect:/regist/login";
        user.setEmail((String) sess.getAttribute("user"));
        userservice.updateUserInfo(user);
        return "redirect:/mypage";
    }

    @RequestMapping("/change")
    public String change(HttpSession sess) {
        if (sess.getAttribute("user") == null)
            return "redirect:/regist/login";
        return "/mypage/pass_change";
    }

    @RequestMapping("/change2")
    public String change2(HttpSession sess) {
        if (sess.getAttribute("user") == null)
            return "redirect:/regist/login";
        return "/mypage/pass_change2";
    }
}
