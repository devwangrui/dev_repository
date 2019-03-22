package com.example.zhengai.dao;


import com.example.zhengai.model.YzTargetChartSearch;

public interface YzTargetChartSearchDao {
	public Integer insertSelective(YzTargetChartSearch sea);
	
	public Integer updateByPrimaryKey(YzTargetChartSearch sea);
	
	public YzTargetChartSearch selectByTcId(Integer id);
}
