package com.example.zhengai.service.impl;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.example.zhengai.dao.YzElementDao;
import com.example.zhengai.model.YzElement;
import com.example.zhengai.query.YzTargetSortTitleAndId;
import com.example.zhengai.service.YzElementService;
import com.example.zhengai.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class YzElementServiceImpl implements YzElementService {
     @Autowired
	private YzElementDao yzElenmentDao;
	

	@Override
	public void deleteYzElementById(Integer id) {
		yzElenmentDao.deleteYzElementById(id);
	}

	
	@Override
	public YzElement selectYzElementById(Integer id) {
		return yzElenmentDao.selectYzElementById(id);
	}

	@Override
	public List<YzElement> selectAll() {
		return (List<YzElement>)yzElenmentDao.selectAll();
	}

	@Override
	public void updateYzElement(YzElement yzElement) {
		yzElenmentDao.updateYzElement(yzElement);
	}

	@Override
	public void savaYzElementById(Integer id) {
		yzElenmentDao.savaYzElementById(id);
		
	}

	@Override
	public List<YzElement> selectCondition(Map<String,Object> map) {
		return (List<YzElement>)yzElenmentDao.selectCondition(map);
	}


	@Override
	public List<YzElement> selectAllByPid(Integer pid) {
		List<YzElement> list = yzElenmentDao.selectAllByPid(pid);
		
		return list;
	}


	@Override
	public List<YzElement> selectChildren(Integer id) {
		return yzElenmentDao.selectChildren(id);
	}


	@Override
	public void sava(YzElement yzElement) {
		yzElenmentDao.sava(yzElement);
	}


	@Override
	public YzElement selectById(Integer id) {
		YzElement yzElement = yzElenmentDao.selectById(id);
		return yzElement;
	}


	@Override
	public List<YzElement> selectAllJoin() {
		List<YzElement> list = yzElenmentDao.selectAllJoin();
		
		return list;
	}


	@Override
	public List<YzElement> selectAllJoin1() {
List<YzElement> list = yzElenmentDao.selectAllJoin1();
		
		return list;
	}


	@Override
	public List<YzTargetSortTitleAndId> getTitleAndId() {
		List<YzTargetSortTitleAndId> list = yzElenmentDao.getTitleAndId();
		return list;
	}


	@Override
	public YzElement selectOneJoin(Integer id) {
		YzElement element = yzElenmentDao.selectOneJoin(id);
		return element;
	}


	@Override
	public YzElement selectLevelTwoJoin(Integer id) {
		YzElement yzElement = yzElenmentDao.selectLevelTwoJoin(id);
		return yzElement;
	}
	
	
	public Page creatPage(Integer pageNo, Integer sort){
		Page page = new Page();
		page.setPageSize(20);
		page.setPageNo(pageNo);
		Integer count = yzElenmentDao.selectCount(sort);
		page.setTotalCount(count);
		int startNum = page.getStartNum();
		
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("sort", sort);
		map.put("startNum", startNum);
		
		List<YzElement> allList = selectAll();
		
		List<YzElement> list = yzElenmentDao.selectLimit(map);
		
		
		List<YzElement> list1 = new ArrayList<YzElement>(); // 做一个空集合
		for (int i = 0; i < allList.size(); i++) { // 遍历集合
			YzElement yzElement = allList.get(i);
			if (yzElement != null) {
				if (yzElement.getPid() != 0 || yzElement.getPid() == null) {
					list1.add(yzElement); // 获得二级数据
				}
			}

		}

		for (int i = 0; i < allList.size(); i++) {

			for (int j = 0; j < list1.size(); j++) {
				YzElement yzElement = allList.get(i);
				Integer id = yzElement.getId();

				YzElement yzElement2 = list1.get(j);
				Integer pid = yzElement2.getPid();
				if (pid == id) {
					String title1 = yzElement.getTitle();
					String title2 = yzElement2.getTitle();
					yzElement2.setTitle(title1 + " -" + title2);
				}
			}
		}
		
		if(list!=null && list.size()>0){
			for(YzElement yzElementLimit:list){
				Integer limitid = yzElementLimit.getId();
				for(YzElement yzElement:list1){
					Integer id = yzElement.getId();
					if(limitid==id){
						String title2 = yzElement.getTitle();
						yzElementLimit.setTitle(title2);
					}
				}
			}
		}

		page.setList(list);
		
		return page;
	}


	@Override
	public Page creatPageCondition(Integer pageNo, Integer sort,String title) {
		Page page = new Page();
		
		page.setPageNo(pageNo);
		page.setPageSize(10);
		int startNum = page.getStartNum();
		
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> map1 = new HashMap<String, Object>();
		map1.put("title", title);
		map1.put("sort", sort);
		
		Integer count = yzElenmentDao.selectCountCondition(map1);
		page.setTotalCount(count);
		
		map.put("title", title);
		map.put("sort", sort);
		map.put("startNum", startNum);
		
		List<YzElement> allList = selectAll();
		List<YzElement> list = selectCondition(map);
		
		List<YzElement> list1 = new ArrayList<YzElement>(); // 做一个空集合
		for (int i = 0; i < allList.size(); i++) { // 遍历集合
			YzElement yzElement = allList.get(i);
			if (yzElement != null) {
				if (yzElement.getPid() != 0 || yzElement.getPid() == null) {
					list1.add(yzElement); // 获得二级数据
				}
			}

		}

		for (int i = 0; i < allList.size(); i++) {

			for (int j = 0; j < list1.size(); j++) {
				YzElement yzElement = allList.get(i);
				Integer id = yzElement.getId();

				YzElement yzElement2 = list1.get(j);
				Integer pid = yzElement2.getPid();
				if (pid == id) {
					String title1 = yzElement.getTitle();
					String title2 = yzElement2.getTitle();
					yzElement2.setTitle(title1 + " -" + title2);
				}
			}
		}
		
		if(list!=null && list.size()>0){
			for(YzElement yzElementLimit:list){
				Integer limitid = yzElementLimit.getId();
				for(YzElement yzElement:list1){
					Integer id = yzElement.getId();
					if(limitid==id){
						String title2 = yzElement.getTitle();
						yzElementLimit.setTitle(title2);
					}
				}
			}
		}
		
		page.setList(list);
		
		return page;
	}


	@Override
	public YzElement selectAllView(Integer id) {
		// TODO Auto-generated method stub
		return yzElenmentDao.selectAllView(id);
	}


	@Override
	public YzElement selectElementJoinTargetById(Integer elementId) {
		return yzElenmentDao.selectElementJoinTargetById(elementId);
	}

	@Override
	public YzElement selectElementJoinAllTargetById(Integer elementId) {
		return yzElenmentDao.selectElementJoinAllTargetById(elementId);
	}

	@Override
	public YzElement selectElementJoinUserByElementId(Integer elementId) {
		return yzElenmentDao.selectElementJoinUserByElementId(elementId);
	}
}
