package com.example.zhengai.dao;

import java.util.List;

import com.example.zhengai.model.YzTargetChart;

public interface YzTargetChartDao {
		public List<YzTargetChart> selectAllChart();
		
		public List<YzTargetChart> selectAll(String title);
		
		public List<YzTargetChart> selectAllByTid(Integer id);
		
		public Integer insertSelective(YzTargetChart chart);
		
		public Integer updateByPrimaryKeySelective(YzTargetChart chart);
		
		public YzTargetChart  selectByPrimaryKey(Integer id);
}
