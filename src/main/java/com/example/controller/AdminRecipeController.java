package com.example.controller;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.domain.RecipeVO;
import com.example.service.AdminRecipeService;

@CrossOrigin(origins="http://localhost:3000")
@RestController
public class AdminRecipeController {
	
	@Autowired
	private AdminRecipeService recipeService;
	
	// 레시피 등록하기
	@PostMapping("/insertrecipe")
    public String insertRecipe(@RequestBody RecipeVO vo) {
        recipeService.insertRecipe(vo);
        return "레시피 등록 성공";
    }
	
	// 레시피 수정하기
	@PutMapping("/updaterecipe")
	public ResponseEntity<String> updaterecipe(@RequestBody RecipeVO vo) {
		recipeService.updateRecipe(vo);
		return ResponseEntity.ok("레시피 수정성공");
	}
	
	
	// 레시피 리스트 불러오기
	@GetMapping("diet-management")
	public List<RecipeVO> getRecipeList(){
		RecipeVO vo = new RecipeVO();
		List<RecipeVO> result = recipeService.getRecipeList(vo);
		return result;
	}
	
	// 레시피 삭제하기
	@ResponseBody
	@DeleteMapping("/recipedelete")
	public String recipedelete(String recipeno) {
		recipeService.recipedelete(recipeno);
		return recipeno + "번 식단 삭제"; 
	}
	
}
