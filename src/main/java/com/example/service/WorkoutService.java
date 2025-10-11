package com.example.service;

import java.util.HashMap;
import java.util.List;

import com.example.domain.WorkDiaryVO;
import com.example.domain.WorkcateVO;
import com.example.domain.WorkoutVO;

public interface WorkoutService {
	List<WorkoutVO> getWorkoutList(Integer start, Integer limit, String search);
    public int getTotalCount(String search);
	public List<WorkoutVO> mainworkout();
	public void workVideoDelete(String videoid);
	public List<WorkcateVO> workcate();
	public void insertWorkDiary(WorkDiaryVO work);
	public HashMap workcal(String email, String seldate);
	public WorkoutVO getWorkout(String exerciseno);


}
