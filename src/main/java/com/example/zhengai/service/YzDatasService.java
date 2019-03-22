package com.example.zhengai.service;


import com.example.zhengai.model.YzDatas;

import java.util.List;

public interface YzDatasService {
	
	public YzDatas selectByPrimaryKey(Integer id);
	
	public void update(YzDatas yzDatas);
	
	public void sava(YzDatas yzDatas);
	
	public List<YzDatas> selectDatas(String title);

	public List<YzDatas> selectByTitle();
}
