package com.example.controller;

import java.io.File;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.domain.DiaryVO;
import com.example.domain.PhotosVO;
import com.example.domain.UserVO;
import com.example.domain.WeightVO;
import com.example.domain.WorkDiaryVO;
import com.example.service.DiaryService;
import com.example.service.PhotoService;
import com.example.service.UserService;
import com.example.service.WeightService;
import com.example.service.WorkoutService;
import com.example.util.MD5Generator;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/diary")
public class DiaryController {

	@Autowired
	PhotoService photoservice;
	@Autowired
	UserService userservice;
	@Autowired
	DiaryService diaryservice;
	@Autowired
	WeightService weightservice;
	@Autowired
	WorkoutService workoutservice;
	
	@RequestMapping
	public String home(Model m, HttpSession sess, String seldate) {
		//세션 로그인 검사
		if(sess.getAttribute("user")==null)
			return"redirect:/regist/login";
		UserVO user = userservice.getUser((String)sess.getAttribute("user"));
        UserVO  userinfo = userservice.getUser_curWeight(user);
		String email = (String)sess.getAttribute("user");
		
		//seldate가 null이면 오늘날짜입력
		LocalDate now = LocalDate.now();
		if(seldate==null) {
			m.addAttribute("seldate",now.toString());
			seldate = now.toString();
		}
			else m.addAttribute("seldate", seldate);
		
		//다이어리 리스트 가져오기
        System.out.println("📩 email = " + email);
        System.out.println("📅 seldate = " + seldate);

        if (email == null || seldate == null) {
            System.out.println("⚠️ email 또는 seldate가 null입니다.");
            return "redirect:/login";
        }

		List<HashMap> diarylist = diaryservice.getDiary(email, seldate);
		List[] result= new List[4];
		for(int i=0; i<result.length; i++) {
			result[i] = new ArrayList();
		}
		for(HashMap vo : diarylist) {
            String history = (String) vo.get("HISTORY");
            if (history == null) continue; // ⚠️ null이면 스킵 (또는 기본값 지정)
			switch(history) {

			case "아침" : result[0].add(vo); break;
			case "점심" : result[1].add(vo); break;
			case "저녁" : result[2].add(vo); break;
			case "간식" : result[3].add(vo); break;
			}
		}
		m.addAttribute("result", result);
		m.addAttribute("foodinfo", diaryservice.getFoodInfo());
		m.addAttribute("userinfo",userinfo);
		List<WeightVO> weights = weightservice.getWeights(email, seldate);
		m.addAttribute("weights", weights);
		List<HashMap> hm = diaryservice.getDiaryChartSum(email, seldate);
		m.addAttribute("chartdatas", diaryservice.getDiaryChartSum(email, seldate));
		
		//운동칼로리소모량
		HashMap workcal = workoutservice.workcal(email, seldate);
		m.addAttribute("workcal", workcal);
		
		return "/diary/diary1";
	}
	
	//리포트페이지
	@RequestMapping("report")
	public String report(
			Model m,
			String seldate,
			HttpSession sess) {
		//diaryservice.getReportChart(year, month);
		String email;
		if(sess.getAttribute("user")==null)
			return "redirect:/regist/login";
		else 
			email = (String)sess.getAttribute("user");
		if(seldate==null)
			seldate = LocalDate.now().toString();
		// 날짜 년, 월 분리
		String[] year_month = seldate.split("-");
		// 차트 데이터 DB에서 가져오기
		List<HashMap> reports = 
				diaryservice.getReportChart(
						email ,year_month[0], year_month[1]
				);
		
		// 다이어리 데이터(사진) DB에서 가져오기
		List<HashMap> diary = diaryservice.getDiary(email, seldate);
		m.addAttribute("reports", reports);
		m.addAttribute("seldate", seldate);
		m.addAttribute("diaries", diary);
		return "/diary/report";
	}
	
	// 리포트페이지 사진 삭제
	@Transactional
	@RequestMapping("deleteDiary")
	public String deleteDiary(String datano, String seldate) {
		DiaryVO diary = diaryservice.getDeleteDiary(datano);
		System.out.println(diary);
		diaryservice.deleteDiary(diary);
		diaryservice.deletePhoto(diary);
		
		//seldate가 null이면 오늘날짜입력
		LocalDate now = LocalDate.now();
		if(seldate==null || seldate.equals("")) {
			seldate = now.toString();
		}
		return "redirect:/diary/report?seldate="+seldate;
	}
	
	// 사진저장
    // Flask 분석 결과를 받아 diary에 저장
    @ResponseBody
    @RequestMapping("savePhotoDiary")
    public String savePhotoDiary(
            @RequestParam("photoid") int photoid,
            @RequestParam("foodname") String foodname,
            @RequestParam("history") String history,
            @RequestParam("diarydate") String diarydate,
            HttpSession sess) {

        // 세션 유효성 검사
        if (sess.getAttribute("user") == null) {
            return "session_expired";
        }

        // 현재 로그인된 유저 이메일
        String email = (String) sess.getAttribute("user");

        // 다이어리 정보 세팅
        DiaryVO diary = new DiaryVO();
        diary.setDiarydate(diarydate);
        diary.setHistory(history);
        diary.setPhotoid(photoid);
        diary.setEmail(email);
        diary.setFoodname(foodname);

        // DB 입력
        diaryservice.insertDiary(diary);

        System.out.println("✅ Diary Saved: " + diary);
        return "success";
    }


    //다이어리 메뉴얼 입력
	@ResponseBody
	@RequestMapping("saveManualDiary")
	public String saveMenualDiary(DiaryVO diary, HttpSession sess) {
		if(sess.getAttribute("user") == null) return "세션만료";
		System.out.println("호출");
		System.out.println(diary);
		diary.setEmail((String)sess.getAttribute("user"));
		diaryservice.insertDiary(diary);
		return "finish";
	}
	
	
	@ResponseBody
	@RequestMapping("saveWeight")
	public String saveWeight(
			HttpSession sess,
			WeightVO weight) {
		if(sess.getAttribute("user")==null) {
			return "fail";
		}
		String email = (String)sess.getAttribute("user");
		weight.setEmail(email);
		WeightVO seldayweight = weightservice.seldayWeight(weight);
		if(seldayweight!=null) {
			weightservice.updateWeight(weight);
		}else {
			weight.setEmail((String)sess.getAttribute("user"));
			weightservice.insertWeight(weight);
		}
		return "DB입력성공";
	}
	
	@RequestMapping("photo")
	public String photo() {
		return "/diary/detail_photo";
	}

}
