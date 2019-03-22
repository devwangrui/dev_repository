package com.example.zhengai.service.impl;

import com.example.zhengai.dao.YzTargetChartSearchDao;
import com.example.zhengai.model.YzTargetChartSearch;
import com.example.zhengai.service.YzTargetChartSearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class YzTargetChartSearchServiceImpl implements
		YzTargetChartSearchService {
@Autowired
	private YzTargetChartSearchDao dao;
	@Override
	public Integer insertSelective(YzTargetChartSearch sea) {
		// TODO Auto-generated method stub
		return dao.insertSelective(sea);
	}
	@Override
	public Integer updateByPrimaryKey(YzTargetChartSearch sea) {
		// TODO Auto-generated method stub
		return dao.updateByPrimaryKey(sea);
	}
	@Override
	public YzTargetChartSearch selectByTcId(Integer id) {
		// TODO Auto-generated method stub
		return dao.selectByTcId(id);
	}

}
