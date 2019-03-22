package com.example.zhengai.service;


import com.example.zhengai.model.YzNode;

import java.util.List;

public interface YzNodeService {
	public List<YzNode> selectByPrimary();
	
	public YzNode selectByPrimaryBy(Integer id);

	public int updateByPrimaryKeySelective(YzNode yznode);
	
	public int insertSelective(YzNode yznode);
	
	public void deleteByPrimaryKey(Integer id);
	
	public List<YzNode> selectRoleIdByPrimary(Integer id);
}
