package com.example.zhengai.service.impl;

import java.util.List;

import com.example.zhengai.dao.YzTargetViewDao;
import com.example.zhengai.model.YzTargetView;
import com.example.zhengai.service.YzTargetViewService;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class YzTargetViewServiceImpl implements YzTargetViewService {

	@Autowired
	private YzTargetViewDao yzTargetViewDao;
	
	@Override
	public List<YzTargetView> selectAllView() {
		
		List<YzTargetView> list = yzTargetViewDao.selectAllView();
		return list;
	}

	@Override
	public YzTargetView selectById(Integer id) {
		YzTargetView selectById = yzTargetViewDao.selectById(id);
		return selectById;
	}

	@Override
	public void updateTargetView(YzTargetView yzTargetView) {
		yzTargetViewDao.updateTargetView(yzTargetView);
	}

	@Override
	public void savaTargetView(YzTargetView yzTargetView) {
		
		yzTargetViewDao.savaTargetView(yzTargetView);
		
	}

	@Override
	public List<YzTargetView> selectAllViewCondition(Integer sort) {
		List<YzTargetView> list = yzTargetViewDao.selectAllViewCondition(sort);
		return list;
	}

	@Override
	public List<YzTargetView> selectTargetViewJoinN(Integer id) {
		
		List<YzTargetView> list = yzTargetViewDao.selectTargetViewJoinN(id);
		return list;
	}

	@Override
	public List<YzTargetView> selectAllA(Integer sort) {
		// TODO Auto-generated method stub
		return yzTargetViewDao.selectAllA(sort);
	}

	@Override
	public YzTargetView selectWarningDateById(Integer id) {
		return yzTargetViewDao.selectWarningDateById(id);
	}
}
