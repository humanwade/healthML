package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.PhotoDAO;
import com.example.domain.PhotosVO;

@Service
public class PhotoServiceImpl implements PhotoService {
	
	@Autowired
	private PhotoDAO dao;

	@Override
	public void insertPhoto(PhotosVO vo) {
		dao.insertPhoto(vo);
	}

}
