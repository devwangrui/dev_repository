package com.example.zhengai.dao;

import com.example.zhengai.model.YzNotice;

import java.util.List;
import java.util.Map;


public interface YzNoticeDao {
	
	
	public List<YzNotice> selectJoinTarget(Map<String,Object> map);
	
	public YzNotice selectById(Integer id);
	
	public void updataNotice(YzNotice yzNotice);
	
	public void deleteNoticeById(Integer id);
	
	public void savaNotice(YzNotice yzNotice);
	
	

}
