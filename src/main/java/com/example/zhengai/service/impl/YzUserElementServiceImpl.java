package com.example.zhengai.service.impl;

import java.util.List;

import com.example.zhengai.dao.YzUserElementDao;
import com.example.zhengai.model.YzTargetView;
import com.example.zhengai.model.YzUserElement;
import com.example.zhengai.service.YzUserElementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class YzUserElementServiceImpl implements YzUserElementService {
   @Autowired
   private YzUserElementDao yzUserElementDao;
	@Override
	public List<YzUserElement> selectById(Integer id) {
		List<YzUserElement> list = yzUserElementDao.selectById(id);
		return list;
	}

	@Override
	public void deleteById(Integer id) {
		yzUserElementDao.deleteById(id);
	}

	@Override
	public void sava(YzUserElement yzUserElement) {
		yzUserElementDao.sava(yzUserElement);

	}

	@Override
	public void update(YzUserElement yzUserElement) {
		yzUserElementDao.update(yzUserElement);

	}



}
