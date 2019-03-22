package com.example.zhengai.service.impl;

import java.util.List;

import com.example.zhengai.dao.YzControllerDao;
import com.example.zhengai.model.YzController;
import com.example.zhengai.service.YzControllerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class YzControllerServiceImpl implements YzControllerService {
	@Autowired
	private YzControllerDao dao;
	
	@Override
	public List<YzController> selectByAddUidPrimaryKey(Integer addUid) {
		
		return dao.selectByAddUidPrimaryKey(addUid);
	}
	@Override
	public YzController selectPrimaryKey(Integer id) {
		
		return dao.selectPrimaryKey(id);
	}
	
	@Override
	public int updateByPrimaryKeySelective(YzController controller) {
		
		return dao.updateByPrimaryKeySelective(controller);
	}
	@Override
	public int insertSelective(YzController controller) {
		// TODO Auto-generated method stub
		return dao.insertSelective(controller);
	}
	@Override
	public YzController selectAllChartTid(Integer id) {
		// TODO Auto-generated method stub
		return dao.selectAllChartTid(id);
	}

}
