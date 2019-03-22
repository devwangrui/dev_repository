package com.example.zhengai.service.impl;

import com.example.zhengai.dao.YzTargetViewGlKeyDao;
import com.example.zhengai.model.YzTargetViewGlKey;
import com.example.zhengai.service.YzTargetViewGlKeyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class YzTargetViewGlKeyServiceImpl implements YzTargetViewGlKeyService {

	@Autowired
	private YzTargetViewGlKeyDao yzTargetViewGlKeydao;
	
	@Override
	public void deleteByVid(Integer vId) {
		yzTargetViewGlKeydao.deleteByVid(vId);

	}

	@Override
	public void sava(YzTargetViewGlKey ytvg) {
		yzTargetViewGlKeydao.sava(ytvg);

	}


}
