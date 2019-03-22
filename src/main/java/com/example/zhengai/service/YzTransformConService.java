package com.example.zhengai.service;

import com.example.zhengai.model.YzTransformCon;
import com.example.zhengai.query.Uid;

import java.util.List;
import java.util.Map;

public interface YzTransformConService {

    public List<YzTransformCon> selectTargetViewByTid(Integer tId);

    public List<YzTransformCon> selectByUserId(Integer uId);

    public void insertSelective(YzTransformCon yzTransformCon);

    public List<YzTransformCon> selectZhengaiUser(Integer tId);

    public Integer selectMaxSort(Integer uId);

    public void deletUserByUId(Integer uId);

    public YzTransformCon selectByPrimaryKey(Integer id);

    public void updateByPrimaryKeySelective(YzTransformCon yzTransformCon);

    public List<Integer> selectAllUIdByTId(Integer tId);

    public YzTransformCon selectZhengaiUserCondition(Map<String,Object> map);

    public List<YzTransformCon> selectTransformConBySort2(Integer tId);
}
