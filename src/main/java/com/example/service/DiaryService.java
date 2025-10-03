package com.example.service;

import java.util.HashMap;
import java.util.List;

import com.example.domain.DiaryVO;
import com.example.domain.FoodInfoVO;
import com.example.domain.UserVO;

public interface DiaryService {
	public void insertDiary(DiaryVO diary);
	public List<HashMap> getDiary(String email, String seldate);
	public List<FoodInfoVO> getFoodInfo();
	public List<HashMap> getDiaryChartSum(String email, String seldate);
	public List<HashMap >getReportChart(String email, String year, String month);
	public DiaryVO getDeleteDiary(String datano);
	public void deleteDiary(DiaryVO diary);
	public void deletePhoto(DiaryVO diary);
}
