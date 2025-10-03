package com.example.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.domain.WeightVO;

@Mapper
public interface WeightDAO {
	public void insertWeight(WeightVO weight);
	public WeightVO seldayWeight(WeightVO weight);
	public void updateWeight(WeightVO todayweight);
	public List<WeightVO> getWeights(String email, String seldate);
}
