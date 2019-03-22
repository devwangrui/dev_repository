package com.example.zhengai.dao;

import java.util.List;

import com.example.zhengai.model.YzDatas;
import com.example.zhengai.model.YzTarget;
import org.apache.ibatis.annotations.Select;


public interface YzTargetDao {
	
	public void savaTarget(YzTarget target);
	
	public void deleteTargetByID(Integer id);
	
	public List<YzTarget> selectTargetJoinTwoLevelTarget();
	
	public void updateTarget(YzTarget target);
	
	public List<YzTarget> selectAllTarget();
	
	public YzTarget selectById(Integer targetId);
	
	public Integer selectAllCount();
	
	public List<YzTarget> selectLimit(Integer pageNo);
	
	public void updateDelete(Integer id);
	
	public void updateUp(Integer id);
	
	
	public void updateToIsDel(Integer id);
	
	public List<YzTarget> selectByTitle(String title);
	
	public List<YzTarget> selectTargetList(Integer id);
	
	public YzDatas selectYzDatasByDataId(Integer dataId);
	
	public int savaTarget1(YzTarget target);

	public YzTarget selectTargetElementByTargetId(Integer targetId);

	@Select("SELECT a.* from yz_target a,yz_target_view b,yz_target_view_gl c WHERE a.id =c.t_id AND c.v_id =b.id AND b.id =#{viewId}")
	public YzTarget selectTargetByViewId(Integer viewId);

	public YzTarget selectTargetJoinDatasByTargetId(Integer targetId);
	
	
	
	
	
	

}
