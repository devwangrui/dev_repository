package com.example.zhengai.service.impl;

import java.util.List;
import java.util.Map;

import com.example.zhengai.dao.YzUserDao;
import com.example.zhengai.model.YzUser;
import com.example.zhengai.service.YzUserService;
import com.example.zhengai.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;




@Service
public class YzUserServiceImpl implements YzUserService {
 
	@Autowired
	private YzUserDao yzUserDao;
	
	@Override
	public List<YzUser> selectAll() {
		
		List<YzUser> list = yzUserDao.selectAll();
		return list;
	}
	
	public Page creatTeacherPage(Integer pageNo){
		Page page = new Page();
		
		        //设置每页显示数
				page.setPageSize(15);
				//设置页码数          1
				page.setPageNo(pageNo);
				Integer allCount = yzUserDao.selectAllCount();
				page.setTotalCount(allCount);
				int startNum = page.getStartNum();
				List<YzUser> list = yzUserDao.selectLimit(startNum);
				page.setList(list);
				
		
		return page ;
	}

	@Override
	public Integer selectAllCount() {
		return yzUserDao.selectAllCount();
	}

	@Override
	public List<YzUser> selectLimit(Integer starNo) {
		List<YzUser> list = yzUserDao.selectLimit(starNo);
		return list;
	}

	@Override
	public YzUser selectById(Integer id) {
		
		YzUser yzUser = yzUserDao.selectById(id);
		return yzUser;
	}

	@Override
	public YzUser selectUserByRoleId(Integer id) {
		YzUser yzUser = yzUserDao.selectUserByRoleId(id);
		return yzUser;
	}

	@Override
	public void updateUser(Integer id) {
		
		yzUserDao.updateUser(id);
		
	}

	@Override
	public YzUser selectElementByUserId(Integer UserId) {
		return yzUserDao.selectElementByUserId(UserId);
	}

	@Override
	public YzUser selectElementByUserIdLeftJoin(Integer UserId) {
		YzUser yzUser = yzUserDao.selectElementByUserIdLeftJoin(UserId);
		return yzUser;
	}

	@Override
	public List<YzUser> selectAllStudent(Integer starNo) {
		
		return yzUserDao.selectAllStudent(starNo);
	}
	
	public Page creatStudentPage(Integer pageNo){
		Page page = new Page();
		
		        //设置每页显示数
				page.setPageSize(15);
				//设置页码数          1
				page.setPageNo(pageNo);
				Integer allCount = yzUserDao.selectAllStudentCount();
				page.setTotalCount(allCount);
				int startNum = page.getStartNum();
				List<YzUser> list = yzUserDao.selectAllStudent(startNum);
				page.setList(list);
				
		
		return page ;
	}

	@Override
	public Integer selectAllStudentCount() {
		
		return yzUserDao.selectAllStudentCount();
	}

	@Override
	public YzUser selectAllName(String name) {
		// TODO Auto-generated method stub
		return yzUserDao.selectAllName(name);
	}

	public List<YzUser> selectZhengai(Map<String,Object> map){
		return yzUserDao.selectZhengai(map);
	}

	public List<YzUser> selectUserJoinElement(Integer elementId){
		return yzUserDao.selectUserJoinElement(elementId);
	}

	@Override
	public YzUser selectUserByUserName(String userName) {
		return yzUserDao.selectUserByUserName(userName);
	}

	@Override
	public YzUser selectUserJoinElementByUserId(Integer userId) {
		return yzUserDao.selectUserJoinElementByUserId(userId);
	}

	@Override
	public List<YzUser> selectUserJoinTransform(Map<String, Object> map) {
		return yzUserDao.selectUserJoinTransform(map);
	}

	@Override
	public YzUser selectUserJoinElementByUId(Integer userId) {
		return yzUserDao.selectUserJoinElementByUId(userId);
	}
}
