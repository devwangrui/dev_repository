package com.example.zhengai.dao;

import java.util.List;

import com.example.zhengai.model.YzRole;

public interface YzRoleDao {
	
	
	public List<YzRole> selectAllRole();
	
	public YzRole selectRoleByUserId(Integer id);
	
	public List<YzRole> selectAllRoleJoinUser();
	
	public YzRole selectRoleById(Integer id);
	
	public int updateByPrimaryKeySelective(YzRole yzRole);
	
	public int insertSelective(YzRole yzRole);
	
	public int deleteByPrimaryKey(Integer id);
	

}
