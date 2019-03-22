package com.example.zhengai.service.impl;

import java.util.List;

import com.example.zhengai.dao.YzChartSDao;
import com.example.zhengai.model.YzChartS;
import com.example.zhengai.service.YzChartSService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class YzChartSServiceImpl implements YzChartSService {
	@Autowired
	private YzChartSDao dao;
	@Override
	public List<YzChartS> selectByPidAndSort() {
		// TODO Auto-generated method stub
		return dao.selectByPidAndSort();
	}
	@Override
	public YzChartS selectByChartId(Integer id) {
		// TODO Auto-generated method stub
		return dao.selectByChartId(id);
	}

}
