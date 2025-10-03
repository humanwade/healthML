package com.example.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.NewsVO;

@Mapper
public interface AdminNewsDAO {
	
	//관리자 뉴스리스트 불러오기
	public List<NewsVO> getNewsList(NewsVO vo);
	
	//관리자 뉴스리스트 삭제하기
	public void deleteNews(String newsid);


}
