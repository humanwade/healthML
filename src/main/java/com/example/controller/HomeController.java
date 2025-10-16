package com.example.controller;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.NewsVO;
import com.example.domain.RecipeVO;
import com.example.domain.UserPhotoVO;
import com.example.domain.UserVO;
import com.example.domain.WorkDiaryVO;
import com.example.domain.WorkcateVO;
import com.example.domain.WorkoutVO;
import com.example.service.NewsService;
import com.example.service.RecipeService;
import com.example.service.UserPhotoService;
import com.example.service.UserService;
import com.example.service.WorkoutService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.servlet.view.RedirectView;

@Controller
public class HomeController {

    @Autowired
    NewsService newsservice;
    @Autowired
    UserService userservice;
    @Autowired
    UserPhotoService userphotoservice;
    @Autowired
    RecipeService recipeservice;
    @Autowired
    WorkoutService workoutservice;

    // 오늘 날짜
    private LocalDate now = LocalDate.now();

    @RequestMapping("/index")
    public String index(Model m, HttpSession sess) {
        // 세션 이메일 확인
        if (sess.getAttribute("user") == null)
            return "redirect:/regist/login";
        System.err.println("유저로그인 : " + sess.getAttribute("user"));
        String email = (String) sess.getAttribute("user");
        UserVO user = userservice.getUser((String) sess.getAttribute("user"));
        m.addAttribute("user", user);

        // 프로필사진
        UserPhotoVO profile = userphotoservice.getUserPhoto(user);
        if (profile == null)
            sess.setAttribute("profile", "sss.jpg");
        else
            sess.setAttribute("profile", profile.getUploadname());

        // 메인페이지 아이템
        List<NewsVO> news = newsservice.getNewsList(0, null);
        m.addAttribute("news", news);

        List<RecipeVO> recipes = recipeservice.mainPageRecipe();
        m.addAttribute("recipes", recipes);

        List<HashMap> recipechart = recipeservice.mainPageChart();
        m.addAttribute("recipechart", recipechart);
        ObjectMapper objectMapper = new ObjectMapper();
        String recipechartJson = null;
        try {
            recipechartJson = objectMapper.writeValueAsString(recipechart);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        m.addAttribute("recipechart", recipechartJson);

        // 운동영상
        List<WorkoutVO> work = workoutservice.mainworkout();
        if (work != null && !work.isEmpty()) {
            m.addAttribute("work", work.get(0).getWorkvideoid());
        } else {
            m.addAttribute("work", null); // 기본값
        }

        // 운동카테고리목록
        List<WorkcateVO> workcate = workoutservice.workcate();
        m.addAttribute("workcates", workcate);

        // 운동칼로리소모량
        HashMap workcal = workoutservice.workcal(email, now.toString());
        m.addAttribute("workcal", workcal);

        // 관리자인지 확인
        if (user.getEmail().equals("admin@admin.com")) {
            m.addAttribute("admin", "true");
        }
        return "index";
    }

    // 운동입력
    @ResponseBody
    @RequestMapping(value = "workinput", method = RequestMethod.POST)
    public Map<String, Object> workinput(HttpSession sess, WorkDiaryVO work) {
        Map<String, Object> result = new HashMap<>();

        Object sessUser = sess.getAttribute("user");
        if (sessUser == null) {
            result.put("message", "세션만료");
            return result;
        }

        try {
            // 1) 세션에서 이메일 채우기
            String email = (String) sessUser;
            work.setEmail(email);

            // 2) 입력값 검증(간단)
            if (work.getWorkcatename() == null || work.getWorkcatename().trim().isEmpty()) {
                result.put("error", "workcatename empty");
                return result;
            }
            if (work.getWorktime() == null || work.getWorktime().trim().isEmpty()) {
                result.put("error", "worktime empty");
                return result;
            }

            // 3) DB에 삽입 (workdiary.workdiarydate는 mapper의 curdate() 사용)
            workoutservice.insertWorkDiary(work);

            // 4) 방금 삽입한 날짜 기준(오늘)으로 집계 조회
            String seldate = java.time.LocalDate.now().toString(); // "YYYY-MM-DD"
            Map<String, Object> workcal = workoutservice.workcal(email, seldate);
            //System.out.println("workcal result: " + workcal);
            //System.out.println("조회된 workcal: " + workcal);
            //System.out.println("workcal 키들: " + workcal.keySet());
            //System.out.println("workcal.get(\"workcal\") = " + workcal.get("workcal"));
            //System.out.println("workcal.get(\"worktime\") = " + workcal.get("worktime"));

            double time = 0;
            double cal = 0;
            if (workcal != null) {
                Object wt = workcal.get("worktime");
                Object wc = workcal.get("workcal");
                if (wt != null) {
                    try { time = Double.parseDouble(wt.toString()); } catch(Exception ignored){}
                }
                if (wc != null) {
                    try { cal = Double.parseDouble(wc.toString()); } catch(Exception ignored){}
                }
            }

            result.put("worktime", time);
            result.put("workcal", cal);
        } catch (Exception e) {
            e.printStackTrace();
            result.put("error", e.getMessage());
        }
        return result;
    }


    // 레시피전환
    @ResponseBody
    @RequestMapping("recipeChange")
    public RecipeVO recipeChange() {
        List<RecipeVO> recipes = recipeservice.mainPageRecipe();
        if (recipes != null && !recipes.isEmpty()) {
            return recipes.get(0);
        } else {
            return null;
        }
    }

    @RequestMapping("/")
    public RedirectView first(HttpSession sess) {
        if (sess.getAttribute("user") == null) {
            //System.out.println("?? 세션 없음 → /regist/start 로 리다이렉트");
            return new RedirectView("/regist/start");
        } else {
            //System.out.println("?? 로그인 상태 → /index 로 리다이렉트");
            return new RedirectView("/index");
        }
    }

    // 유튜브영상 자동재생 id값 받아오기
    @ResponseBody
    @RequestMapping("getVideoId")
    public String getVideoId() {
        List<WorkoutVO> work = workoutservice.mainworkout();
        if (work != null && !work.isEmpty()) {
            return work.get(0).getWorkvideoid();
        } else {
            return "";
        }
    }

    // 유튜브 재생 실패시 id 삭제 및 새로운 영상 로드
    @ResponseBody
    @RequestMapping("getNewVideoId")
    public String getNewVideoId(String videoid, String errcode) {
        List<WorkoutVO> work = workoutservice.mainworkout();
        if (work != null && !work.isEmpty()) {
            return work.get(0).getWorkvideoid();
        } else {
            return "";
        }
    }
}
