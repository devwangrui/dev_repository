package com.example.zhengai.dao;



import java.util.List;

import com.example.zhengai.model.YzNode;

public interface YzNodeDao {
	public List<YzNode> selectByPrimary();
	
	public YzNode selectByPrimaryKey(Integer id);
	
	public int updateByPrimaryKeySelective(YzNode yznode);
	
	public int insertSelective(YzNode yznode);
	
	public void deleteByPrimaryKey(Integer id);
	
	public List<YzNode> selectRoleIdByPrimary(Integer id);
	
}
