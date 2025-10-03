package com.example.service;

import java.util.List;

import com.example.domain.NewsVO;

public interface NewsService {
	List<NewsVO> getNewsList(Integer start, String search);
}
