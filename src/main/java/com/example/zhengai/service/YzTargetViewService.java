package com.example.zhengai.service;


import com.example.zhengai.model.YzTargetView;
import com.example.zhengai.model.YzTargetViewGlKey;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface YzTargetViewService {

	
	public List<YzTargetView> selectAllView();
	
	public YzTargetView selectById(Integer id);
	
	public void updateTargetView(YzTargetView yzTargetView);
	
	public void savaTargetView(YzTargetView yzTargetView);
	
	public List<YzTargetView> selectAllViewCondition(Integer sort);
	
	public List<YzTargetView> selectTargetViewJoinN(Integer id);
	
	public List<YzTargetView> selectAllA(Integer sort);

	public YzTargetView selectWarningDateById(Integer id);


}
