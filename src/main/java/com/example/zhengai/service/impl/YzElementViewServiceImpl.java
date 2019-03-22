package com.example.zhengai.service.impl;

import com.example.zhengai.dao.YzElementViewDao;
import com.example.zhengai.model.YzElementViewKey;
import com.example.zhengai.service.YzElementViewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class YzElementViewServiceImpl implements YzElementViewService {
	@Autowired
	private YzElementViewDao dao;
	@Override
	public Integer deleteByPrimaryKeyEid(Integer id) {
		// TODO Auto-generated method stub
		return dao.deleteByPrimaryKeyEid(id);
	}

	@Override
	public Integer insertSelective(YzElementViewKey key) {
		// TODO Auto-generated method stub
		return dao.insertSelective(key);
	}

}
