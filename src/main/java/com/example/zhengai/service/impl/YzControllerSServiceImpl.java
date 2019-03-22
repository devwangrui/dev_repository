package com.example.zhengai.service.impl;

import java.util.List;

import com.example.zhengai.dao.YzControllerSDao;
import com.example.zhengai.model.YzControllerS;
import com.example.zhengai.service.YzControllerSService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class YzControllerSServiceImpl implements YzControllerSService {
	@Autowired
	private YzControllerSDao dao;

	@Override
	public List<YzControllerS> selectALLControllers() {
		
		return dao.selectALLControllers();
	}

	@Override
	public int updateByPrimaryKeySelective(YzControllerS s) {
		
		return dao.updateByPrimaryKeySelective(s);
	}

	@Override
	public int insertSelective(YzControllerS s) {
		
		return dao.insertSelective(s);
	}

	@Override
	public void deleteByPrimaryKey(Integer id) {
		dao.deleteByPrimaryKey(id);
		
	}

	@Override
	public YzControllerS selectByPrimaryKey(Integer id) {
		
		return dao.selectByPrimaryKey(id);
	}

	@Override
	public List<YzControllerS> selectAll() {
		// TODO Auto-generated method stub
		return dao.selectAll();
	}
	
}
