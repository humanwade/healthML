package com.example.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.AdminUserDAO;
import com.example.domain.UserVO;

@Service
public class AdminUserServiceImpl implements AdminUserService {
	
	@Autowired
	private AdminUserDAO dao;
	
	// 관리자 회원리스트 불러오기	
	public List<UserVO> getMemberList(UserVO vo){
		return dao.getMemberList(vo);
	}
	
	// 관리자 회원 삭제하기
	public void deleteUsers(String[] email) {
		dao.deleteUsers(email);
	}
	
	// 관리자 차트
	public List<UserVO> insertchart(UserVO vo) {
		return dao.insertchart(vo);
	}
	
	// 관리자 전월대비 차트
	@Override
	public HashMap<String, Object> monthchart(int year, int month) {	        
        HashMap<String, Object> response = dao.monthchart(year, month);
        return response;
	}
	
	// 관리자 성별 통계
	public List<UserVO> gendercount(UserVO vo){
		return dao.gendercount(vo);
	}
	
	
}
