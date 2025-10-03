package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.domain.NewsVO;
import com.example.service.AdminNewsService;

@CrossOrigin(origins="http://localhost:3000")
@RestController
public class AdminNewsController {
	
	@Autowired
	private AdminNewsService newsService;

	// 관리자 뉴스리스트 불러오기
	@GetMapping("/news-management")
	public List<NewsVO> getNewsList(){
		NewsVO vo = new NewsVO();
		List<NewsVO> result = newsService.getNewsList(vo);
		return result;
	}

	
	//관리자 뉴스 삭제 하기
	@ResponseBody
	@DeleteMapping("/newsdelete")
	public String newsdelete(String newsid) {
		newsService.deleteNews(newsid);
		return newsid+"번 게시글 삭제";
	}
	
}
