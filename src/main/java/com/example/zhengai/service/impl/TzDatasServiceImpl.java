package com.example.zhengai.service.impl;
import java.util.List;


import com.example.zhengai.dao.YzDatasDao;
import com.example.zhengai.model.YzDatas;
import com.example.zhengai.service.YzDatasService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class TzDatasServiceImpl implements YzDatasService {
    
	@Autowired
	private YzDatasDao yzDatasDao;
	@Override
	public YzDatas selectByPrimaryKey(Integer id) {
		YzDatas yzDatas = yzDatasDao.selectByPrimaryKey(id);
		return yzDatas;
	}
	@Override
	public void update(YzDatas yzDatas) {
		yzDatasDao.update(yzDatas);
	}
	@Override
	public void sava(YzDatas yzDatas) {
		yzDatasDao.sava(yzDatas);   		
	}
	@Override
	public List<YzDatas> selectDatas(String title) {
		return yzDatasDao.selectDatas(title);
	}
	@Override
	public List<YzDatas> selectByTitle() {
		// TODO Auto-generated method stub
		return yzDatasDao.selectByTitle();
	}

}
