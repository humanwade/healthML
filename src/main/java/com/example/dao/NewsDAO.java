package com.example.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.NewsVO;

@Mapper
public interface NewsDAO {
	public List<NewsVO> getNewsList(Integer start, String search) ;
}
