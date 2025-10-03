package com.example.service;

import java.util.HashMap;
import java.util.List;

import com.example.domain.RecipeVO;

public interface RecipeService {
	List<RecipeVO> getRecipeList(int start, String category, String search);
	RecipeVO getRecipe(String recipeno);
	int getTotalPage(String category, String search);
	public List<RecipeVO> mainPageRecipe();
	public List<HashMap> mainPageChart();
}
