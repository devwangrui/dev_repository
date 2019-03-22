package com.example.zhengai.service.impl;
import java.util.List;

import com.example.zhengai.dao.YzControllerChartDao;
import com.example.zhengai.model.YzControllerChart;
import com.example.zhengai.service.YzControllerChartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class YzControllerChartServiceImpl implements YzControllerChartService {
	@Autowired
	private YzControllerChartDao dao;
	@Override
	public List<YzControllerChart> selectYzTargetChart(Integer id) {
		
		return dao.selectYzTargetChart(id);
	}
	@Override
	public List<YzControllerChart> selectByCidPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return dao.selectByCidPrimaryKey(id);
	}
	@Override
	public int deleteByPrimaryKey(Integer pId) {
		// TODO Auto-generated method stub
		return dao.deleteByPrimaryKey(pId);
	}
	@Override
	public int insertSelective(YzControllerChart chart) {
		// TODO Auto-generated method stub
		return dao.insertSelective(chart);
	}

}
