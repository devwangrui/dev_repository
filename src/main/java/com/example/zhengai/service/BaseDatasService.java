package com.example.zhengai.service;

import com.example.zhengai.model.BaseDatas;

import java.util.List;
import java.util.Map;

public interface BaseDatasService {

    public List<BaseDatas> selectDatasByZyId(Map<String,Object> map);

    public List<BaseDatas> selectDatasByXyId(Map<String,Object> map);

    public List<BaseDatas> selectAllDatas(String tableName);

    public void update(Map<String,Object> map);

    public  List<Integer> selectXyDatasId(String tableName);

    public  List<Integer> selectZyDatasId(String tableName);

    public List<BaseDatas> selectZyJoinXy(Map<String,Object> map);

    public List<BaseDatas> selectDatasByXyIdN(Map<String,Object> map);

    public  List<Integer> selectDataKey(String tableName);

    public List<BaseDatas> selectDatas(Map<String,Object> map);

}
