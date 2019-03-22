package com.example.zhengai.service.impl;

import java.util.List;

import com.example.zhengai.dao.YzLayerDao;
import com.example.zhengai.model.YzLayer;
import com.example.zhengai.service.YzLayerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class YzLayerServiceImpl implements YzLayerService {
    
	@Autowired
	private YzLayerDao yzLayerDao;
	@Override
	public List<YzLayer> selectAllLayer() {
		List<YzLayer> list = yzLayerDao.selectAllLayer();
		return list;
	}
	@Override
	public void sava(YzLayer yzLayer) {
		yzLayerDao.sava(yzLayer);
	}

	public YzLayer selectByPrimaryKey(Integer id){
		return yzLayerDao.selectByPrimaryKey(id);
	}

}
