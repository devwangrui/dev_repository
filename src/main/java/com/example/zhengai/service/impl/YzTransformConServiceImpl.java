package com.example.zhengai.service.impl;

import com.example.zhengai.dao.YzTransformConDao;
import com.example.zhengai.model.YzTransformCon;
import com.example.zhengai.query.Uid;
import com.example.zhengai.service.YzTransformConService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class YzTransformConServiceImpl implements YzTransformConService {

    @Autowired
    YzTransformConDao yzTransformConDao;
    public List<YzTransformCon> selectTargetViewByTid(Integer tId){
        return yzTransformConDao.selectTargetViewByTid(tId);
    }

    public List<YzTransformCon> selectByUserId(Integer uId){
        return yzTransformConDao.selectByUserId(uId);
    }

    public void insertSelective(YzTransformCon yzTransformCon){
         yzTransformConDao.insertSelective(yzTransformCon);
    }

    public List<YzTransformCon> selectZhengaiUser(Integer tId){
        return yzTransformConDao.selectZhengaiUser(tId);
    }

    public Integer selectMaxSort(Integer uId){
        return yzTransformConDao.selectMaxSort(uId);
    }

    public void deletUserByUId(Integer uId){
        yzTransformConDao.deletUserByUId(uId);
    }

    public YzTransformCon selectByPrimaryKey(Integer id){
        return yzTransformConDao.selectByPrimaryKey(id);
    }

    public void updateByPrimaryKeySelective(YzTransformCon yzTransformCon){
        yzTransformConDao.updateByPrimaryKeySelective(yzTransformCon);
    }

    @Override
    public List<Integer> selectAllUIdByTId(Integer tId) {
        return yzTransformConDao.selectAllUIdByTId(tId);
    }

    @Override
    public YzTransformCon selectZhengaiUserCondition(Map<String,Object> map) {
        return yzTransformConDao.selectZhengaiUserCondition(map);
    }

    @Override
    public List<YzTransformCon> selectTransformConBySort2(Integer tId) {
        return yzTransformConDao.selectTransformConBySort2(tId);
    }
}
