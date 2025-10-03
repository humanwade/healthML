package com.example.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.domain.UserVO;
import com.example.service.AdminUserService;

@CrossOrigin(origins="http://localhost:3000")
@RestController // @Controller + @ResponseBody
public class AdminUserController {
	
	@Autowired
	private AdminUserService userService;
	
	// 관리자 회원리스트 불러오기	
	@GetMapping("/member-management")
	public List<UserVO> getMemberList() {
		UserVO vo = new UserVO();
		List<UserVO> result = userService.getMemberList(vo);
		return result;
	}
	
	// 관리자 회원 통계
	@GetMapping("/managerchart")
	public List<UserVO> insertchart(@RequestParam int year) {
		UserVO vo = new UserVO();
		vo.setYear(year);
		return userService.insertchart(vo);
	}	
	
	// 관리자 회원 통계 전월대비 증가
	@GetMapping("/monthjoinuser")
	public ResponseEntity<Map<String,Object>> monthchart(
		@RequestParam("year") int year,
		@RequestParam("month") int month) {
		HashMap<String,Object> response = userService.monthchart(year, month);
		return new ResponseEntity<>(response, HttpStatus.OK);
	}
	
	// 관리자 성별 통계
	@GetMapping("/genderdata")
	public List<UserVO> gendercount(UserVO vo) {
		List<UserVO> result = userService.gendercount(vo);
		return result;
	}
	
	// 관리자 회원 삭제하기
	@ResponseBody
	@DeleteMapping("/usersdelete")
	public String usersdelete(String email) {
		String[] a = email.split(",");
		userService.deleteUsers(a);
		return email+"의 회원 삭제";
	}
	
}
