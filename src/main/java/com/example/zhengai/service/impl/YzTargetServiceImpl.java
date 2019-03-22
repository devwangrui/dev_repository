package com.example.zhengai.service.impl;

import java.util.List;

import com.example.zhengai.dao.YzTargetDao;
import com.example.zhengai.dao.YzTargetSortDao;
import com.example.zhengai.model.YzDatas;
import com.example.zhengai.model.YzElement;
import com.example.zhengai.model.YzTarget;
import com.example.zhengai.service.YzTargetService;
import com.example.zhengai.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class YzTargetServiceImpl implements YzTargetService {
	
	@Autowired
    private YzTargetDao yzTargetDao;
	
	@Autowired
    private YzTargetSortDao yzTargetSortDao;
	
	
	@Override
	public void deleteTargetByID(Integer id) {
		yzTargetDao.deleteTargetByID(id);

	}

	@Override
	public List<YzTarget> selectTargetJoinTwoLevelTarget() {
		List<YzTarget> target = yzTargetDao.selectTargetJoinTwoLevelTarget();
		return target;
	}

	@Override
	public void updateTarget(YzTarget target) {
		yzTargetDao.updateTarget(target);

	}

	@Override
	public List<YzTarget> selectAllTarget() {
		
		
		return yzTargetDao.selectAllTarget();
	}

	@Override
	public YzTarget selectById(Integer targetId) {
		return yzTargetDao.selectById(targetId);
	}

	@Override
	public void savaTarget(YzTarget target) {
		
		yzTargetDao.savaTarget(target);
	}

	@Override
	public void deleteYzTargetAndYzTargetSort(Integer id) {
		//删除子表
		yzTargetSortDao.deleteByPid(id);
		//再删主表
		yzTargetDao.deleteTargetByID(id);
	}

	
	//select * from table_name limit 0,5
	@Override
	public Page getPage(Integer pageNo) {
		//新建一个分页对象
		Page page = new Page();
		//设置每页显示数
		page.setPageSize(20);
		//设置页码数          1
		page.setPageNo(pageNo);
		
		//根据总记录数可以获得开始行号
		int startNum = page.getStartNum();
		
		//获得总记录数              
		Integer allCount = yzTargetDao.selectAllCount();
		//设置总记录数            2
		page.setTotalCount(allCount);
		
		//设置查询内容集合 3
		page.setList(selectLimit(startNum));
		
		return page;
	}

	@Override
	public List<YzTarget> selectLimit(Integer pageNo) {
		List<YzTarget> list = yzTargetDao.selectLimit(pageNo);
		return list;
	}

	@Override
	public void updateToIsDel(Integer id) {
		yzTargetDao.updateToIsDel(id);		
	}

	@Override
	public List<YzTarget> selectByTitle(String title) {
		return yzTargetDao.selectByTitle(title);
	}

	@Override
	public List<YzTarget> selectTargetList(Integer id) {
		List<YzTarget> list = yzTargetDao.selectTargetList(id);
		
		return list;
	}

	@Override
	public YzDatas selectYzDatasByDataId(Integer dataId) {
		YzDatas yzDatas = yzTargetDao.selectYzDatasByDataId(dataId);
		return yzDatas;
	}

	public YzTarget selectTargetElementByTargetId(Integer targetId){
		return yzTargetDao.selectTargetElementByTargetId(targetId);
	}

	@Override
	public YzTarget selectTargetByViewId(Integer viewId) {
		return yzTargetDao.selectTargetByViewId(viewId);
	}

	@Override
	public YzTarget selectTargetJoinDatasByTargetId(Integer targetId) {
		return yzTargetDao.selectTargetJoinDatasByTargetId(targetId);
	}
}
