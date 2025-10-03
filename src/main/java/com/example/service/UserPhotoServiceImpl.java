package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.UserPhotoDAO;
import com.example.domain.PhotosVO;
import com.example.domain.UserPhotoVO;
import com.example.domain.UserVO;

@Service
public class UserPhotoServiceImpl implements UserPhotoService {
	
	@Autowired
	private UserPhotoDAO dao;

	@Override
	public void insertUserPhoto(PhotosVO vo) {
		dao.insertUserPhoto(vo);		
	}

	@Override
	public void updateUserPhoto(PhotosVO vo) {
		dao.updateUserPhoto(vo);
	}

	@Override
	public UserPhotoVO getUserPhoto(UserVO user) {
		return dao.getUserPhoto(user);
	}

}
