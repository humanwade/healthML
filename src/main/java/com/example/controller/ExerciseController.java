package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.domain.WorkoutVO;
import com.example.service.WorkoutService;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/exercise")
public class ExerciseController {

	@Autowired
	WorkoutService workoutservice;

    @RequestMapping
    public String home(Model m, @RequestParam(defaultValue = "1") int page, String search) {
        final int itemsPerPage = 8;
        int offset = Math.max(0, (page - 1) * itemsPerPage);

        List<WorkoutVO> list = workoutservice.getWorkoutList(offset, itemsPerPage, search);

        int totalItems = workoutservice.getTotalCount(search); // 실제 total count
        int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage); // 페이지 수
        int startPage = (page - 1) / 5 * 5 + 1;
        int endPage = Math.min(startPage + 4, totalPages);

        m.addAttribute("list", list);
        m.addAttribute("page", page);
        m.addAttribute("startPage", startPage);
        m.addAttribute("endPage", endPage);
        m.addAttribute("search", search);
        m.addAttribute("totalPages", totalPages);
        return "/exercise/exercise";
    }
	
	@RequestMapping("/detail")
	public String detail(String exerciseno, Model m) {
		WorkoutVO work = workoutservice.getWorkout(exerciseno);
		m.addAttribute("work", work);
		return "/exercise/detail_exercise";
	}


}
