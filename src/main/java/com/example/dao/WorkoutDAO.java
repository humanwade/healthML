package com.example.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.domain.WorkDiaryVO;
import com.example.domain.WorkcateVO;
import com.example.domain.WorkoutVO;

@Mapper
public interface WorkoutDAO {
	public List<WorkoutVO> getWorkoutList(Integer start, String search) ;
	public List<WorkoutVO> mainworkout();
	public void workVideoDelete(String videoid);
	public List<WorkcateVO> workcate();
	public void insertWorkDiary(WorkDiaryVO work);
	public HashMap workcal(String email, String seldate);
	public WorkoutVO getWorkout(String exerciseno);
}
