package com.example.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.UserDAO;
import com.example.domain.UserVO;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAO dao;

	@Override
	public HashMap getUser_curWeight(UserVO login) {
		return dao.getUser_curWeight(login);
	}

	@Override
	public UserVO getUser(String email) {
		return dao.getUser(email);
	}

	@Override
	public void updateProfile(UserVO user) {
		dao.updateProfile(user);
	}

	@Override
	public void insertUser(UserVO user) {
		dao.insertUser(user);
		
	}

	@Override
	public UserVO loginCheck(UserVO user) {
		return dao.loginCheck(user);
	}

	@Override
	public void passwordchange(UserVO user) {
		dao.passwordchange(user);
	}

	@Override
	public void updateUserInfo(UserVO user) {
		dao.updateUserInfo(user);
	}
	
	

}
