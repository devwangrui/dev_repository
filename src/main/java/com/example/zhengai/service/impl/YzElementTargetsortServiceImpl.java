package com.example.zhengai.service.impl;

import com.example.zhengai.dao.YzElementTargetsortDao;
import com.example.zhengai.model.YzElementTargetsort;
import com.example.zhengai.service.YzElementTargetsortService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class YzElementTargetsortServiceImpl implements YzElementTargetsortService {

	@Autowired
	private YzElementTargetsortDao yzElementTargetsortDao;
	
	@Override
	public void deleteByElementId(Integer elementId) {
		yzElementTargetsortDao.deleteByElementId(elementId);
	}

	@Override
	public void savaElementTarget(YzElementTargetsort yzElementTargetsort) {
		yzElementTargetsortDao.savaElementTarget(yzElementTargetsort);

	}

}
