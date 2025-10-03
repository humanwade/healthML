package com.example.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.domain.UserVO;

@Mapper
public interface AdminUserDAO {
	
	// 관리자 회원리스트 불러오기	
	public List<UserVO> getMemberList(UserVO vo);
	
	// 관리자 회원 삭제하기
	public void deleteUsers(String[] email);
	
	// 관리자 차트
	public List<UserVO> insertchart(UserVO vo);
	
	// 관리자 전월 대비 차트
	HashMap<String, Object> monthchart(int year, int month);
	
	//관리자 성별 통계
	public List<UserVO> gendercount(UserVO vo);
	
}

