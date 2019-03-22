package com.example.zhengai.service;

import java.util.List;

import com.example.zhengai.model.YzDatas;
import com.example.zhengai.model.YzElement;
import com.example.zhengai.model.YzTarget;
import com.example.zhengai.utils.Page;

public interface YzTargetService {
	
	public void savaTarget(YzTarget target);
	
    public void deleteTargetByID(Integer id);
	
	public List<YzTarget> selectTargetJoinTwoLevelTarget();
	
	public void updateTarget(YzTarget target);
	
	public List<YzTarget> selectAllTarget();
	
	public YzTarget selectById(Integer targetId);
	
	public void deleteYzTargetAndYzTargetSort(Integer id);
	
	public Page getPage(Integer PageNo);
	
	public List<YzTarget> selectLimit(Integer pageNo);
	
	public void updateToIsDel(Integer id);
	
	public List<YzTarget> selectByTitle(String title);
	
	public List<YzTarget> selectTargetList(Integer id);
	
	public YzDatas selectYzDatasByDataId(Integer dataId);

	public YzTarget selectTargetElementByTargetId(Integer targetId);

	public YzTarget selectTargetByViewId(Integer viewId);

	public YzTarget selectTargetJoinDatasByTargetId(Integer targetId);



}
