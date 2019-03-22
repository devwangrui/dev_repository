package com.example.zhengai.service.impl;

import java.util.List;

import com.example.zhengai.dao.YzTargetChartDao;
import com.example.zhengai.model.YzTargetChart;
import com.example.zhengai.service.YzTargetChartSevice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class YzTargetChartServiceImpl implements YzTargetChartSevice {
	@Autowired
	private YzTargetChartDao chartDao;
	@Override
	public List<YzTargetChart> selectAllChart() {
		return chartDao.selectAllChart();

	}
	@Override
	public List<YzTargetChart> selectAll(String title) {
		// TODO Auto-generated method stub
		return chartDao.selectAll(title);
	}
	@Override
	public List<YzTargetChart> selectAllByTid(Integer id) {
		// TODO Auto-generated method stub
		return chartDao.selectAllByTid(id);
	}
	@Override
	public Integer insertSelective(YzTargetChart chart) {
		// TODO Auto-generated method stub
		return chartDao.insertSelective(chart);
	}
	@Override
	public Integer updateByPrimaryKeySelective(YzTargetChart chart) {
		// TODO Auto-generated method stub
		return chartDao.updateByPrimaryKeySelective(chart);
	}
	@Override
	public YzTargetChart selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return chartDao.selectByPrimaryKey(id);
	}

}
