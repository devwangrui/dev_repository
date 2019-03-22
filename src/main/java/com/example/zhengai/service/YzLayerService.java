package com.example.zhengai.service;


import com.example.zhengai.model.YzLayer;

import java.util.List;

public interface YzLayerService {
	
	public List<YzLayer> selectAllLayer();
	
	public void sava(YzLayer yzLayer);

	public YzLayer selectByPrimaryKey(Integer id);

}
