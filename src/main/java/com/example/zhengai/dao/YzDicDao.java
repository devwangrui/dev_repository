package com.example.zhengai.dao;

import com.example.zhengai.model.YzDic;

import java.util.List;


public interface YzDicDao {
	public YzDic selectByPrimaryKey(Integer id);

	public List<YzDic> selectAllDatas();
}
