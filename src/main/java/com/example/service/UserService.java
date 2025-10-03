package com.example.service;

import java.util.HashMap;

import com.example.domain.UserVO;

public interface UserService {
	
	public HashMap getUser_curWeight(UserVO login);
	public UserVO getUser(String email);
	public UserVO loginCheck(UserVO user);
	public void updateProfile(UserVO user);
	public void insertUser(UserVO user);
	public void passwordchange(UserVO user);
	public void updateUserInfo(UserVO user);
}
