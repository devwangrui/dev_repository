package com.example.zhengai.service.impl;

import com.example.zhengai.dao.YzChartDao;
import com.example.zhengai.model.YzChart;
import com.example.zhengai.service.YzChartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class YzChartServiceImpl implements YzChartService {
	@Autowired
	private YzChartDao dao;
	@Override
	public YzChart selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return dao.selectByPrimaryKey(id);
	}

}
