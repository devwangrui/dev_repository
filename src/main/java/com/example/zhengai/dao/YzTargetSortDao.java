package com.example.zhengai.dao;

import java.util.List;
import java.util.Map;

import com.example.zhengai.model.YzTarget;
import com.example.zhengai.model.YzTargetSort;
import com.example.zhengai.query.TargerSortQuery;
import com.example.zhengai.query.YzTargetSortTitleAndId;


public interface YzTargetSortDao {
	
   public void deleteTargetByID(Integer id);
	

	public void updateTarget(YzTargetSort target);
	

	public YzTargetSort selectById(Integer id);
	
	public void savaYzTargetSort(YzTargetSort yzTargetSort);
	
	public List<YzTargetSort> selectByPid(Integer pId);
	
	public void deleteByPid(Integer id);
	
	public List<String> selectTitle();
	
	public void updateToIsDel(Integer id);
	
	public List<YzTargetSort> selectAllPY(Integer sort);
	
	public List<YzTargetSort> selectAllPY1();
	
	public List<TargerSortQuery> selectChildren(Integer id);
	
	public List<String> selectPTitel();
	
	public List<String> selectCTitel();
	
	public List<YzTarget> selectBysOne(Integer id);
	
	public YzTargetSort selectAllJoin(Map<String,Object> map);
	
	public YzTargetSort selectAllJoin1(Integer id);
	
	public List<YzTargetSort> selectAllJoinAll();
	
	public YzTargetSort selectP(Integer id);
	
	public List<YzTargetSort> selectCh(Integer id);
	
	public List<YzTargetSortTitleAndId> selectTitleAndIdP(Integer sort);
	
	public List<YzTargetSortTitleAndId> selectTitleAndIdCh();
	
	public List<YzTargetSortTitleAndId> selectTitleAndIdLevelTwo(Integer id);
	
	public int savaYzTargetSort1(YzTargetSort yzTargetSort);
	
	public List<YzTargetSort> selectLevels(Integer sort);
	
	public List<YzTargetSort> selectTargetViewJoinN(Map<String,Object> map);
	
	public TargerSortQuery selectTwoLevel(Integer id);
	
	public YzTargetSort selectallOne(Integer id);
	
	public YzTargetSort selectByLevel3(Integer id);
	
	public YzTargetSort selectByLevel3N(Integer id);
	
	public List<YzTargetSort> selectJoinElement(Map<String,Object> map);
	
	public List<YzTargetSort> selectThree();
	
	
	public List<YzTargetSort> selectAllPY2(Integer sort);
	
   public List<YzTargetSort> selectHomePageDates();

   public List<YzTargetSort> selectMyHomePageDates();

   public List<YzTargetSort> selectHomePageDatesByTargetId(Integer targetId);




}
