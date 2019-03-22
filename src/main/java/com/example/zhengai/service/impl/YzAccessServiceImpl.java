package com.example.zhengai.service.impl;

import com.example.zhengai.dao.YzAccessDao;
import com.example.zhengai.model.YzAccess;
import com.example.zhengai.service.YzAccessService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class YzAccessServiceImpl implements YzAccessService {
	@Autowired
	private YzAccessDao dao;
	@Override
	public int insertSelective(YzAccess yzAccess) {
	
		return dao.insertSelective(yzAccess);
	}
	@Override
	public int deleteByRoleId(Integer id) {
		// TODO Auto-generated method stub
		return dao.deleteByRoleId(id);
	}

}
