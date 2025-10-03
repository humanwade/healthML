package com.example.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.AdminExerciseDAO;
import com.example.domain.WorkoutVO;

@Service
public class AdminExerciseServiceImpl implements AdminExerciseService{
	
	@Autowired
	private AdminExerciseDAO dao;
	
	public void insertexercise(WorkoutVO vo) {
		dao.insertexercise(vo);
	}

	public List<WorkoutVO> getWorkoutList(WorkoutVO vo){
		return dao.getWorkoutList(vo);
	}
	
	public void deleteExercise(String workid) {
		dao.deleteExercise(workid);
	}
	
	public void exerciseupdate(WorkoutVO vo) {
		dao.exerciseupdate(vo);
	}

	
}
