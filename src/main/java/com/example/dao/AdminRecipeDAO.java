package com.example.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.RecipeVO;

@Mapper
public interface AdminRecipeDAO {
	
	// 식단 리스트 불러오기
	public List<RecipeVO> getRecipeList(RecipeVO vo);
	
	// 식단 리스트 수정하기
	public void updateRecipe(RecipeVO vo);
	
	// 식단 리스트 삭제하기
	public void recipedelete(String recipeno);
	
	// 식단 리스트 입력하기
	public void insertRecipe(RecipeVO vo);
	
}
