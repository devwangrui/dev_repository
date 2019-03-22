package com.example.zhengai.dao;

import com.example.zhengai.model.YzElementTargetsort;

public interface YzElementTargetsortDao {
	
	public void deleteByElementId(Integer elementId);
	
	public void savaElementTarget(YzElementTargetsort yzElementTargetsort);

}
