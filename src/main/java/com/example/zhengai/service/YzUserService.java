package com.example.zhengai.service;


import com.example.zhengai.model.YzUser;
import com.example.zhengai.utils.Page;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public interface YzUserService {
	
	public List<YzUser> selectAll();
	
	public Integer selectAllCount();

	public List<YzUser> selectLimit(Integer starNo);
	
	public List<YzUser> selectAllStudent(Integer starNo);
	
	public Page creatTeacherPage(Integer pageNo);
	
	public Page creatStudentPage(Integer pageNo);
	
	public YzUser selectById(Integer id);
	
	public void updateUser(Integer id);
	
	public YzUser selectUserByRoleId(Integer id);
	
	public YzUser selectElementByUserId(Integer UserId);
	
	public YzUser selectElementByUserIdLeftJoin(Integer UserId);
	
	public Integer selectAllStudentCount();
	
	public YzUser selectAllName(String name);

	public List<YzUser> selectZhengai(Map<String,Object> map);

	public List<YzUser> selectUserJoinElement(Integer elementId);

	public YzUser selectUserByUserName(String userName);

	public YzUser selectUserJoinElementByUserId(Integer userId);

	public List<YzUser> selectUserJoinTransform(Map<String,Object> map);

	public YzUser selectUserJoinElementByUId(Integer userId);
}
