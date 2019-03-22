package com.example.zhengai.service.impl;

import java.util.List;

import com.example.zhengai.dao.YzNodeDao;
import com.example.zhengai.model.YzNode;
import com.example.zhengai.service.YzNodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class YzNodeServiceImpl implements YzNodeService {
	@Autowired
	YzNodeDao yzNodeDao;
	
	@Override
	public List<YzNode> selectByPrimary() {
		
		List<YzNode> node= yzNodeDao.selectByPrimary();
		
		return node;
	}

	@Override
	public YzNode selectByPrimaryBy(Integer id) {
		
		return yzNodeDao.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(YzNode yznode) {
		// TODO Auto-generated method stub
		return yzNodeDao.updateByPrimaryKeySelective(yznode);
	}

	@Override
	public int insertSelective(YzNode yznode) {
		// TODO Auto-generated method stub
		return yzNodeDao.insertSelective(yznode);
	}

	@Override
	public void deleteByPrimaryKey(Integer id) {
		yzNodeDao.deleteByPrimaryKey(id);
	}

	@Override
	public List<YzNode> selectRoleIdByPrimary(Integer id) {
		// TODO Auto-generated method stub
		return yzNodeDao.selectRoleIdByPrimary(id);
	}
	
	
}
