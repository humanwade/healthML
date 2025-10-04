package com.example.controller;

import java.io.File;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.domain.PhotosVO;
import com.example.domain.UserVO;
import com.example.service.UserPhotoService;
import com.example.service.UserService;
import com.example.service.WeightService;
import com.example.util.MD5Generator;

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
        System.out.println("🔥 테스트 진입 성공");
        return "mypage/mypage";
    }

    // ✅ 수정된 버전 (확실히 작동함)
    @GetMapping("")
    public String home(Model m, HttpSession sess) {
        Object sessUser = sess.getAttribute("user");
        System.out.println("🟢 sess user: " + sessUser); // 무조건 찍혀야 함!!

        if (sessUser == null) {
            System.out.println("❌ 세션 없음: 로그인 필요");
            return "redirect:/regist/login";
        }

        UserVO vo = new UserVO();
        vo.setEmail((String) sessUser);

        try {
            UserVO user = userservice.getUser_curWeight(vo);
            System.out.println("🟢 getUser_curWeight() result: " + user);
            m.addAttribute("user", user);
        } catch (Exception e) {
            System.out.println("❌ 예외 발생: " + e.getMessage());
            e.printStackTrace();
        }

        return "mypage/mypage";
    }




    // 프로필 사진 변경
	@Transactional
	@ResponseBody
	@RequestMapping("/changeProfile")
	public String changeProfile(
		@RequestParam("file") MultipartFile files,
		HttpSession sess) {
		
		if(sess.getAttribute("user")==null) {
			return null;
		} 
		UserVO user = userservice.getUser((String)sess.getAttribute("user"));
		
		try {
			// 파일의 원래이름
			String originFilename = files.getOriginalFilename();
			System.out.println("원래파일명 :" + originFilename);
			// 파일첨부를 한 경우라면
			if( originFilename != null && !originFilename.equals("")) {
				String[] accept = {".jpg", ".jpeg", ".png"};
				String extension = originFilename.substring(originFilename.lastIndexOf("."));
				boolean valid=false;
				for(String apt : accept) {
					if(apt.equals(extension)) valid=true;
				}
				if(!valid) return "fail";
				String filename= new MD5Generator(originFilename).toString()+extension;

				String savepath = System.getProperty("user.dir") 
						+ "\\src\\main\\resources\\static\\userphotos";
			
				if( ! new File(savepath).exists()) {
					new File(savepath).mkdir();
				}
				
				String filepath = savepath + "\\" + filename;
				files.transferTo(new File(filepath));
				
				// 디비저장
				PhotosVO fileVO = new PhotosVO();
				fileVO.setOriginFilename(originFilename);
				fileVO.setFilename(filename);
				fileVO.setFilepath(filepath);	
				System.out.println("파일첨부 저장 완료");
				
				//DB - 유저가 프로필이 있으면 수정, 없으면 입력
				if(user.getPhotoid() == null) {
					// DB 유저포토테이블 사진 추가
					userphotoservice.insertUserPhoto(fileVO);
					user.setPhotoid(fileVO.getFileid());
					// DB 유저프로필사진 변경
					userservice.updateProfile(user);
					
				}else {
					fileVO.setFileid(user.getPhotoid());
					userphotoservice.updateUserPhoto(fileVO);
				}
				sess.setAttribute("profile", fileVO.getFilename());
					
			} // end of if
			else {
				// 파일을 첨부하지 않은 경우
				System.out.println("파일첨부 없음");
				return "fail";
			}
				
		}catch(Exception ex) {
			ex.getMessage();
		}

		return "success";
	}
	
	//회원정보 수정 페이지
	@RequestMapping("/info")
	public String info(Model m, HttpSession sess) {
		UserVO vo = new UserVO();
		vo.setEmail((String)sess.getAttribute("user"));
        UserVO  user = userservice.getUser_curWeight(vo);
		m.addAttribute("user", user);
		return "/mypage/info_change";
	}
	
	//회원정보 수정
	@RequestMapping("/changeInfo")
	public String changeInfo(HttpSession sess, UserVO user) {
		if(sess.getAttribute("user") == null) return "redirect:/regist/login";
		user.setEmail((String)sess.getAttribute("user"));
		userservice.updateUserInfo(user);
		return "redirect:/mypage";
	}
	
	@RequestMapping("/change")
	public String change(HttpSession sess) {
		if(sess.getAttribute("user")==null)
			return "redirect:/regist/login";
		return "/mypage/pass_change";
	}
	
	@RequestMapping("/change2")
	public String change2(HttpSession sess) {
		if(sess.getAttribute("user")==null)
			return "redirect:/regist/login";
		return "/mypage/pass_change2";
	}
	
}
