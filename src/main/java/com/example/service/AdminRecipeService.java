package com.example.service;

import java.util.List;

import com.example.domain.RecipeVO;

public interface AdminRecipeService {
	
	// 관리자 레시피 불러오기
	List<RecipeVO> getRecipeList(RecipeVO vo);

	// 관리자 레시피 삭제하기
	void recipedelete(String recipeno);
	
	// 관리자 레시피 등록하기
	void insertRecipe(RecipeVO vo);
	
	// 관리자 레시피 수정하기
	void updateRecipe(RecipeVO vo);
}
