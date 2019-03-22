package com.example.zhengai.service;


import com.example.zhengai.model.YzDic;

import java.util.List;

public interface YzDicService {
	public YzDic selectByPrimaryKey(Integer id);

	public List<YzDic> selectAllDatas();
}
