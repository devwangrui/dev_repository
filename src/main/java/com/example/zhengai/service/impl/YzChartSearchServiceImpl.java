package com.example.zhengai.service.impl;

import java.util.List;

import com.example.zhengai.dao.YzChartSearchDao;
import com.example.zhengai.model.YzChartSearch;
import com.example.zhengai.service.YzChartSearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class YzChartSearchServiceImpl implements YzChartSearchService {
	@Autowired
	private YzChartSearchDao dao;
	@Override
	public List<YzChartSearch> selectAllChart() {
		// TODO Auto-generated method stub
		return dao.selectAllChart();
	}
	@Override
	public List<YzChartSearch> selectAllSearch() {
		// TODO Auto-generated method stub
		return dao.selectAllSearch();
	}

}
