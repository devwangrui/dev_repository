package com.example.zhengai.dao;
import java.util.List;
import java.util.Map;
import com.example.zhengai.model.YzElement;
import com.example.zhengai.query.YzTargetSortTitleAndId;

public interface YzElementDao {
	
	public void updateYzElement(YzElement yzElement);
	
	public void deleteYzElementById(Integer id);
	
	public void savaYzElementById(Integer id);
	
	public YzElement selectYzElementById(Integer id);
	
	public List<YzElement> selectAll();
	
	public List<YzElement> selectCondition(Map<String,Object> map);
	
	
	public List<YzElement> selectAllByPid(Integer pid);
	
	public List<YzElement> selectChildren(Integer id);
	
	public void sava(YzElement yzElement);
	
	public YzElement selectById(Integer id);
	
	public List<YzElement> selectAllJoin();
	
	public List<YzElement> selectAllJoin1();
	
	public List<YzTargetSortTitleAndId> getTitleAndId();
	
	public YzElement selectOneJoin(Integer id);
	
	public YzElement selectLevelTwoJoin(Integer id);
	
	public Integer selectCount(Integer sort);
	
	public List<YzElement> selectLimit(Map<String,Integer> map);
	
	public Integer selectCountCondition(Map<String,Object> map);
	
	public YzElement selectAllView(Integer id);

	public YzElement selectElementJoinTargetById(Integer elementId);

	public YzElement selectElementJoinAllTargetById(Integer elementId);

	public YzElement selectElementJoinUserByElementId(Integer elementId);


}
