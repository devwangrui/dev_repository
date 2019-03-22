package com.example.zhengai.service.impl;

import java.util.List;

import com.example.zhengai.dao.YzDicDao;
import com.example.zhengai.model.YzDic;
import com.example.zhengai.service.YzDicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class YzDicServiceImpl implements YzDicService {
	@Autowired
	private YzDicDao dao;
	@Override
	public List<YzDic> selectAllDatas() {
		// TODO Auto-generated method stub
		return dao.selectAllDatas();
	}

	@Override
	public YzDic selectByPrimaryKey(Integer id) {
		return dao.selectByPrimaryKey(id);
	}
}
