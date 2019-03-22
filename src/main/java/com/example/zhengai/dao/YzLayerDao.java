package com.example.zhengai.dao;

import com.example.zhengai.model.YzLayer;

import java.util.List;



public interface YzLayerDao {
	
	public List<YzLayer> selectAllLayer();

	public void sava(YzLayer yzLayer);

	public YzLayer selectByPrimaryKey(Integer id);

}
