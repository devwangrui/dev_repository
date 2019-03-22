package com.example.zhengai.service;


import com.example.zhengai.model.YzAccess;

public interface YzAccessService {
	public int insertSelective(YzAccess yzAccess);
	
	public int deleteByRoleId(Integer id);
}
