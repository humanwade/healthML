package com.example.dao;

import java.util.HashMap;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Mapper;
import com.example.domain.UserVO;

@Mapper
public interface UserDAO {
	
	public UserVO  getUser_curWeight(UserVO login);
	public UserVO getUser(@Param("email") String email);
	public UserVO loginCheck(UserVO user);
	public void updateProfile(UserVO user);
	public void insertUser(UserVO user);
	public void passwordchange(UserVO user);
	public void updateUserInfo(UserVO user);
}
