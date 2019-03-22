package com.example.zhengai.dao;


import com.example.zhengai.model.YzElementViewKey;

public interface YzElementViewDao {
	
	public Integer deleteByPrimaryKeyEid(Integer id);
	
	public Integer insertSelective(YzElementViewKey key);
}
