package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.NewsDAO;
import com.example.domain.NewsVO;

@Service
public class NewsServiceImpl implements NewsService {
	
	@Autowired
	private NewsDAO dao;

	@Override
	public List<NewsVO> getNewsList(Integer start, String search) {
		return dao.getNewsList(start, search);
	}
}
