package com.example.service;

import com.example.domain.UserVO;

public interface UserService {
    public UserVO getUser_curWeight(UserVO login); // ✅ HashMap → UserVO 변경
    public UserVO getUser(String email);
    public UserVO loginCheck(UserVO user);
    public void updateProfile(UserVO user);
    public void insertUser(UserVO user);
    public void passwordchange(UserVO user);
    public void updateUserInfo(UserVO user);
}
