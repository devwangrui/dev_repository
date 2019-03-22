package com.example.zhengai.dao;
import com.example.zhengai.model.YzChartSearch;

import java.util.List;

public interface YzChartSearchDao {
	public List<YzChartSearch> selectAllChart();
	public List<YzChartSearch> selectAllSearch();
}
