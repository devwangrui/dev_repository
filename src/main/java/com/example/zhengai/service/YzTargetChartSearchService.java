package com.example.zhengai.service;


import com.example.zhengai.model.YzTargetChartSearch;

public interface YzTargetChartSearchService {
	public Integer insertSelective(YzTargetChartSearch sea);
	
	public Integer updateByPrimaryKey(YzTargetChartSearch sea);
	
	public YzTargetChartSearch selectByTcId(Integer id);
}
