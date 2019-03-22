package com.example.zhengai.service.impl;
import java.util.List;

import com.example.zhengai.dao.YzRoleDao;
import com.example.zhengai.model.YzRole;
import com.example.zhengai.service.YzRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class YzRoleServiceImpl implements YzRoleService {

	
	@Autowired
	private YzRoleDao yzRoleDao;
	
	@Override
	public List<YzRole> selectAllRole() {
		return yzRoleDao.selectAllRole();
	}

	@Override
	public YzRole selectRoleByUserId(Integer id) {
		return yzRoleDao.selectRoleByUserId(id);
	}

	@Override
	public List<YzRole> selectAllRoleJoinUser() {
		
		List<YzRole> list = yzRoleDao.selectAllRoleJoinUser();
		return list;
	}

	@Override
	public YzRole selectRoleById(Integer id) {
		YzRole yzRole = yzRoleDao.selectRoleById(id);
		return yzRole;
	}
	@Override
	public int updateByPrimaryKeySelective(YzRole yzRole) {
		int result=yzRoleDao.updateByPrimaryKeySelective(yzRole);
		return result;
	}

	@Override
	public int insertSelective(YzRole yzRole) {
		int result=yzRoleDao.insertSelective(yzRole);
		return result;
	}

	@Override
	public int deleteByPrimaryKey(Integer id) {
		int res=yzRoleDao.deleteByPrimaryKey(id);
		return res;
	}

}
