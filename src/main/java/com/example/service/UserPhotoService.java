package com.example.service;

import com.example.domain.PhotosVO;
import com.example.domain.UserPhotoVO;
import com.example.domain.UserVO;

public interface UserPhotoService {
	
	public void insertUserPhoto(PhotosVO vo);
	public void updateUserPhoto(PhotosVO vo);
	public UserPhotoVO getUserPhoto(UserVO user);
}
