package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.domain.RecipeVO;
import com.example.service.RecipeService;

@Controller
@RequestMapping("/recipe")
public class RecipeContoller {
	
	@Autowired
	private RecipeService recipeservice;
	
	
	// 레시피페이지 메인화면
	@RequestMapping
	public String home(Model m, @RequestParam(defaultValue="1") String page
			, String category, String search) {
		int ipage = Integer.parseInt(page);
		int start = (ipage-1)*9;
		List<RecipeVO> list = recipeservice.getRecipeList(start, category, search);
		m.addAttribute("recipes", list);
		int totalPage = recipeservice.getTotalPage(category, search);
		int endPage = (((ipage-1)/5)+1)*5;
		if(totalPage < endPage) 
		    endPage = totalPage;
		int startPage = ((ipage-1)/5) * 5 + 1;
		m.addAttribute("startPage", startPage);
		m.addAttribute("endPage", endPage);
		m.addAttribute("totalPage", totalPage);
		m.addAttribute("page", page);
		return "/recipe/recipe";
	}
	
	// 레시피 상세페이지화면
	@RequestMapping("/detail")
	public String detail(Model m, String recipeno) {
		RecipeVO result = recipeservice.getRecipe(recipeno);
		String[] ways = result.getCooking().split("&");
		m.addAttribute("result", result);
		m.addAttribute("ways", ways);
		return "/recipe/detail_recipe";
	}
}
