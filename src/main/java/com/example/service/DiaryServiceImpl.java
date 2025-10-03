package com.example.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.DiaryDAO;
import com.example.domain.DiaryVO;
import com.example.domain.FoodInfoVO;
import com.example.domain.UserVO;

@Service
public class DiaryServiceImpl implements DiaryService {

	@Autowired
	private DiaryDAO dao;

	@Override
	public void insertDiary(DiaryVO diary) {
		dao.insertDiary(diary);
	}

	@Override
	public List<HashMap> getDiary(String email, String seldate) {
		return dao.getDiary(email, seldate);
	}

	@Override
	public List<FoodInfoVO> getFoodInfo() {
		return dao.getFoodInfo();
	}

	@Override
	public List<HashMap> getDiaryChartSum(String email, String seldate) {
		return dao.getDiaryChartSum(email, seldate);
	}

	@Override
	public List<HashMap> getReportChart(String email, String year, String month) {
		return dao.getReportChart(email, year, month);
	}

	@Override
	public DiaryVO getDeleteDiary(String datano) {
		return dao.getDeleteDiary(datano);
	}

	@Override
	public void deleteDiary(DiaryVO diary) {
		dao.deleteDiary(diary);
	}

	@Override
	public void deletePhoto(DiaryVO diary) {
		dao.deletePhoto(diary);
	}
}
