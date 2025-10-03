package com.example.dao;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.PhotosVO;
import com.example.domain.UserPhotoVO;
import com.example.domain.UserVO;

@Mapper
public interface PhotoDAO {
	public void insertPhoto(PhotosVO vo);
}
