package com.example.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.RecipeDAO;
import com.example.domain.RecipeVO;

@Service
public class RecipeServiceImpl implements RecipeService {
	
	@Autowired
	private RecipeDAO recipeDAO;

	public List<RecipeVO>getRecipeList(int start, String category, String search) {
		return recipeDAO.getRecipeList(start, category, search);
	}

	@Override
	public int getTotalPage(String category, String search) {
		return recipeDAO.getTotalPage(category, search);
	}

	@Override
	public RecipeVO getRecipe(String recipeno) {
		return recipeDAO.getRecipe(recipeno);
	}

	@Override
	public List<RecipeVO> mainPageRecipe() {
		return recipeDAO.mainPageRecipe();
	}

	@Override
	public List<HashMap> mainPageChart() {
		return recipeDAO.mainPageChart();
	}

}
