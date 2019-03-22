package com.example.zhengai.service;


import com.example.zhengai.model.YzElementViewKey;

public interface YzElementViewService {
	public Integer deleteByPrimaryKeyEid(Integer id);
	
	public Integer insertSelective(YzElementViewKey key);
}
