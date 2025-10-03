package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.AdminNewsDAO;
import com.example.domain.NewsVO;

@Service
public class AdminNewsServiceImpl implements AdminNewsService {
	
	@Autowired
	private AdminNewsDAO dao;
	
	// 관리자 뉴스리스트 불러오기
	public List<NewsVO> getNewsList(NewsVO vo){
		return dao.getNewsList(vo);
	}
	
	//관리자 뉴스리스트 삭제하기
	public void deleteNews(String newsid) {
		dao.deleteNews(newsid);
	}
	
}
