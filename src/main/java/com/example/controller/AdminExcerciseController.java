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

import com.example.domain.WorkoutVO;
import com.example.service.AdminExerciseService;

@CrossOrigin(origins="http://localhost:3000")
@RestController
public class AdminExcerciseController {
	
	@Autowired
	private AdminExerciseService exerciseService;
	
	// 운동 리스트 불러오기
	@GetMapping("/exercise-management")
	public List<WorkoutVO> getWorkoutList(){
		WorkoutVO vo = new WorkoutVO();
		List<WorkoutVO> result = exerciseService.getWorkoutList(vo);
		return result;
	}
	
	// 운동 등록하기
	@PostMapping("/insertexercise")
	public String insertexercise(@RequestBody WorkoutVO vo) {
		exerciseService.insertexercise(vo);
		return "운동 등록 성공";
	}
	
	// 운동 삭세하기
	@ResponseBody
	@DeleteMapping("/exercisedelete")
	public String exercisedelete(String workid) {
		exerciseService.deleteExercise(workid);
		return workid+"번 게시글 삭제";
	}
	
	// 운동 수정하기
	@PutMapping("/exerciseupdate")
	public ResponseEntity<String> exerciseupdate(@RequestBody WorkoutVO vo){
		exerciseService.exerciseupdate(vo);
		return ResponseEntity.ok("운동 수정성공");
	}
	
}
