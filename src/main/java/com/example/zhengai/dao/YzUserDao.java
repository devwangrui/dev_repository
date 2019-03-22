package com.example.zhengai.dao;

import com.example.zhengai.model.YzUser;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


public interface YzUserDao {

	public List<YzUser> selectAll();

	public Integer selectAllCount();
	
	public Integer selectAllStudentCount();
	
	public List<YzUser> selectLimit(Integer starNo);
	
	public List<YzUser> selectAllStudent(Integer starNo);


	public YzUser selectById(Integer id);
	
	public YzUser selectUserByRoleId(Integer id);
	
	public void updateUser(Integer id);
	
	public YzUser selectElementByUserId(Integer UserId);
	
	public YzUser selectElementByUserIdLeftJoin(Integer UserId);
	
	public List<YzUser> selectZhengai(Map<String,Object> map);

	public YzUser selectAllName(String name);

	public List<YzUser> selectUserJoinElement(Integer elementId);

	@Select("select * from yz_user where username = '${_parameter}'")
	public YzUser selectUserByUserName(String username);

	public YzUser selectUserJoinElementByUserId(Integer userId);

	public List<YzUser> selectUserJoinTransform(Map<String,Object> map);

	public YzUser selectUserJoinElementByUId(Integer userId);

}
