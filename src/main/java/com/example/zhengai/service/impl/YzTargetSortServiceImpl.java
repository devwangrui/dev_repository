package com.example.zhengai.service.impl;

import java.util.List;
import java.util.Map;

import com.example.zhengai.dao.YzTargetSortDao;
import com.example.zhengai.model.YzTarget;
import com.example.zhengai.model.YzTargetSort;
import com.example.zhengai.query.TargerSortQuery;
import com.example.zhengai.query.YzTargetSortTitleAndId;
import com.example.zhengai.service.YzTargetSortService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class YzTargetSortServiceImpl implements YzTargetSortService {
	@Autowired
	private YzTargetSortDao yzTargetSortDao;

	@Override
	public void deleteTargetByID(Integer id) {
		yzTargetSortDao.deleteTargetByID(id);

	}

	@Override
	public List<YzTargetSort> selectTargetJoinTwoLevelTarget() {
		return null;
	}

	@Override
	public void updateTarget(YzTargetSort target) {
		yzTargetSortDao.updateTarget(target);

	}

	@Override
	public List<YzTargetSort> selectAllTarget() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public YzTargetSort selectById(Integer id) {
		YzTargetSort yzTargetSort = yzTargetSortDao.selectById(id);
		return yzTargetSort;
	}

	@Override
	public void savaYzTargetSort(YzTargetSort yzTargetSort) {
		yzTargetSortDao.savaYzTargetSort(yzTargetSort);
		
	}

	@Override
	public List<YzTargetSort> selectByPid(Integer pId) {
		List<YzTargetSort> list = yzTargetSortDao.selectByPid(pId);
		return list;
	}

	@Override
	public void deleteByPid(Integer id) {
		yzTargetSortDao.deleteByPid(id);
	}

	@Override
	public List<String> selectTitle() {
		
		
		return yzTargetSortDao.selectTitle();
	}

	@Override
	public void updateToIsDel(Integer id) {
		yzTargetSortDao.updateToIsDel(id);
	}

	@Override
	public List<YzTargetSort> selectAllPY(Integer sort) {
		
		List<YzTargetSort> list = yzTargetSortDao.selectAllPY(sort);
		return list;
	}

	@Override
	public List<TargerSortQuery> selectChildren(Integer id) {
		List<TargerSortQuery> list = yzTargetSortDao.selectChildren(id);
		return list;
	}

	@Override
	public List<String> selectPTitel() {
		
		List<String> list = yzTargetSortDao.selectPTitel();
		return list;
	}

	@Override
	public List<String> selectCTitel() {
		return yzTargetSortDao.selectCTitel();
	}

	@Override
	public List<YzTarget> selectBysOne(Integer id) {
		List<YzTarget> list = yzTargetSortDao.selectBysOne(id);
		
		return list;
	}

	@Override
	public YzTargetSort selectAllJoin(Map<String,Object> map) {
		YzTargetSort yzTargetSort = yzTargetSortDao.selectAllJoin(map);
		return yzTargetSort;
	}

	@Override
	public YzTargetSort selectP(Integer id) {
		return yzTargetSortDao.selectP(id);
	}

	@Override
	public List<YzTargetSort> selectCh(Integer id) {
		List<YzTargetSort> list = yzTargetSortDao.selectCh(id);
		return list;
	}

	@Override
	public List<YzTargetSortTitleAndId> selectTitleAndIdP(Integer sort) {
		
		List<YzTargetSortTitleAndId> list = yzTargetSortDao.selectTitleAndIdP(sort);
		return list;
	}

	@Override
	public List<YzTargetSortTitleAndId> selectTitleAndIdCh() {
		List<YzTargetSortTitleAndId> list = yzTargetSortDao.selectTitleAndIdCh();
		return list;
	}

	@Override
	public int savaYzTargetSort1(YzTargetSort yzTargetSort) {
		int ret=yzTargetSortDao.savaYzTargetSort1(yzTargetSort);
		return ret;
	}

	@Override
	public List<YzTargetSort> selectAllPY1() {
		
		return yzTargetSortDao.selectAllPY1();
	}

	@Override
	public List<YzTargetSort> selectLevels(Integer sort) {
		List<YzTargetSort> list = yzTargetSortDao.selectLevels(sort);
		return list;
	}
	
	
	@Override
	public List<YzTargetSort> selectTargetViewJoinN(Map<String,Object> map) {
		
		List<YzTargetSort> list = yzTargetSortDao.selectTargetViewJoinN(map);
		return list;
	}

	@Override
	public TargerSortQuery selectTwoLevel(Integer id) {
		return yzTargetSortDao.selectTwoLevel(id);
	}

	@Override
	public YzTargetSort selectallOne(Integer id) {
		
		return yzTargetSortDao.selectallOne(id);
	}

	@Override
	public YzTargetSort selectByLevel3(Integer id) {
		return yzTargetSortDao.selectByLevel3(id);
	}
	
	@Override
	public YzTargetSort selectByLevel3N(Integer id) {
		return yzTargetSortDao.selectByLevel3N(id);
	}

	@Override
	public List<YzTargetSort> selectJoinElement(Map<String, Object> map) {
		List<YzTargetSort> list = yzTargetSortDao.selectJoinElement(map);
		return list;
	}

	@Override
	public List<YzTargetSortTitleAndId> selectTitleAndIdLevelTwo(Integer id) {
		List<YzTargetSortTitleAndId> list = yzTargetSortDao.selectTitleAndIdLevelTwo(id);
		return list;
	}

	@Override
	public List<YzTargetSort> selectAllJoinAll() {
		return yzTargetSortDao.selectAllJoinAll();
	}

	@Override
	public YzTargetSort selectAllJoin1(Integer id) {
		
		return yzTargetSortDao.selectAllJoin1(id);
	}

	@Override
	public List<YzTargetSort> selectThree() {
		return yzTargetSortDao.selectThree();
	}

	@Override
	public List<YzTargetSort> selectAllPY2(Integer sort) {
		// TODO Auto-generated method stub
		return yzTargetSortDao.selectAllPY2(sort);
	}

	@Override
	public List<YzTargetSort> selectHomePageDates() {
		return yzTargetSortDao.selectHomePageDates();
	}

	@Override
	public List<YzTargetSort> selectMyHomePageDates() {
		return yzTargetSortDao.selectMyHomePageDates();
	}

	@Override
	public List<YzTargetSort> selectHomePageDatesByTargetId(Integer targetId) {
		return yzTargetSortDao.selectHomePageDatesByTargetId(targetId);
	}
}
