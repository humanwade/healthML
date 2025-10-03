package com.example.service;

import java.util.List;

import com.example.domain.WorkoutVO;

public interface AdminExerciseService {
	
	public void insertexercise(WorkoutVO vo);
	public List<WorkoutVO> getWorkoutList(WorkoutVO vo);
	public void deleteExercise(String workid);
	public void exerciseupdate(WorkoutVO vo);

}
