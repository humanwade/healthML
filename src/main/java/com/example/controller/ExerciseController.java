package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.domain.WorkoutVO;
import com.example.service.WorkoutService;

@Controller
@RequestMapping("/exercise")
public class ExerciseController {

	@Autowired
	WorkoutService workoutservice;
	
	@RequestMapping
	public String home(Model m, String search) {
		List<WorkoutVO> list = workoutservice.getWorkoutList(0, search);
		m.addAttribute("list", list);
		return "/exercise/exercise";
	}
	
	@RequestMapping("/detail")
	public String detail(String exerciseno, Model m) {
		WorkoutVO work = workoutservice.getWorkout(exerciseno);
		m.addAttribute("work", work);
		return "/exercise/detail_exercise";
	}
}
