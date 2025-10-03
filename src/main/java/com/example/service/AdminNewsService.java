package com.example.service;

import java.util.List;

import com.example.domain.NewsVO;

public interface AdminNewsService {
	
	//관리자 뉴스리스트 불러오기
	List<NewsVO> getNewsList(NewsVO vo);
	
	//관리자 뉴스 삭제하기
	void deleteNews(String newsid);
	
}
