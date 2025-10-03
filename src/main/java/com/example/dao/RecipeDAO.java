package com.example.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.RecipeVO;

@Mapper
public interface RecipeDAO {
	public List<RecipeVO> getRecipeList(int start, String category, String search) ;
	public List<RecipeVO> mainPageRecipe();
	public RecipeVO getRecipe(String recipeno);
	public int getTotalPage(String category, String search);
	public List<HashMap> mainPageChart();
}
