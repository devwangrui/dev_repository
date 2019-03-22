package com.example.zhengai.service;


import com.example.zhengai.model.YzRole;

import java.util.List;

public interface YzRoleService {

	
	public List<YzRole> selectAllRole();
	
	public YzRole selectRoleByUserId(Integer id);
	
	public List<YzRole> selectAllRoleJoinUser();
	
	public YzRole selectRoleById(Integer id);
	
	public int updateByPrimaryKeySelective(YzRole yzRole);
	
	public int insertSelective(YzRole yzRole);
	
	public int deleteByPrimaryKey(Integer id);
}
