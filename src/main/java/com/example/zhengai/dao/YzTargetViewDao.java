package com.example.zhengai.dao;

import com.example.zhengai.model.YzTargetView;
import org.apache.ibatis.annotations.Select;

import java.util.List;



public interface YzTargetViewDao {
	
	public List<YzTargetView> selectAllView();
	
	public List<YzTargetView> selectAllViewCondition(Integer sort);
	
	public YzTargetView selectById(Integer id);
	
	public void updateTargetView(YzTargetView yzTargetView);
	
	public void savaTargetView(YzTargetView yzTargetView);
	
	public List<YzTargetView> selectTargetViewJoinN(Integer id);
	
	public List<YzTargetView> selectAllA(Integer sort);

	public YzTargetView selectWarningDateById(Integer id);



}
