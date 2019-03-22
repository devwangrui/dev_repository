package com.example.zhengai.service.impl;

import java.util.List;
import java.util.Map;

import com.example.zhengai.dao.YzNoticeDao;
import com.example.zhengai.model.YzNotice;
import com.example.zhengai.service.YzNoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class YzNoticeServiceImpl implements YzNoticeService {
	
	@Autowired
	private YzNoticeDao yzNoticeDao;

	@Override
	public List<YzNotice> selectJoinTarget(Map<String, Object> map) {
		
		return yzNoticeDao.selectJoinTarget(map);
	}

	@Override
	public YzNotice selectById(Integer id) {
		
		return yzNoticeDao.selectById(id);
	}

	@Override
	public void updataNotice(YzNotice yzNotice) {
		yzNoticeDao.updataNotice(yzNotice);
		
	}

	@Override
	public void deleteNoticeById(Integer id) {
		yzNoticeDao.deleteNoticeById(id);
		
	}

	@Override
	public void savaNotice(YzNotice yzNotice) {
		yzNoticeDao.savaNotice(yzNotice);
		
	}

}
