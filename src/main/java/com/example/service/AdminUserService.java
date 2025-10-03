package com.example.service;

import java.util.HashMap;
import java.util.List;

import com.example.domain.UserVO;

public interface AdminUserService {
	
	// 관리자 회원리스트 불러오기	
	List<UserVO> getMemberList(UserVO vo);
	
	// 관리자 회원 삭제하기
	void deleteUsers(String[] email);
	
	// 관리자 차트
	List<UserVO> insertchart(UserVO vo);
	
	//관리자 전월대비 차트
	HashMap<String, Object> monthchart(int year, int month);
	
	//관리자 성별 통계
	List<UserVO> gendercount(UserVO vo);
}
