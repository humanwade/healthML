package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.NewsVO;
import com.example.service.NewsService;

@Controller
@RequestMapping("/news")
public class NewsController {

	@Autowired
	private NewsService service;
	
	// 뉴스페이지 메인화면
	@RequestMapping
	public String home(Model m, String search) {
		List<NewsVO> list = service.getNewsList(0, search);
		for(NewsVO vo : list) {
			System.out.println(vo.toString());
		}
		m.addAttribute("result",list);
		return "/news/news";
	}
	
	@ResponseBody
	@RequestMapping("/addNews")
	public List<NewsVO> getNewsList(Model m, String page, String search) {
		Integer start = 0;
		if(page!=null) start = Integer.parseInt(page)*9;
		List<NewsVO> list = service.getNewsList(start, search);
		m.addAttribute("result",list);
		return list;
	}
}
