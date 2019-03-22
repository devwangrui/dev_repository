package com.example.zhengai.dao;

import com.example.zhengai.model.YzChartS;

import java.util.List;


public interface YzChartSDao {
	
	public List<YzChartS> selectByPidAndSort();
	
	public YzChartS selectByChartId(Integer id);
	
}
