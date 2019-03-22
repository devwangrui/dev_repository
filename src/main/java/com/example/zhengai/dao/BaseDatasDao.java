package com.example.zhengai.dao;

import com.example.zhengai.model.BaseDatas;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

public interface BaseDatasDao {

    @Select("SELECT * from ${tableName} WHERE zy_id =#{zyId} and xy_id=${xyId}")
    public List<BaseDatas> selectDatasByZyId(Map<String,Object> map);

    @Select("SELECT * from ${tableName} WHERE xy_id =#{xyId}")
    public List<BaseDatas> selectDatasByXyId(Map<String,Object> map);

    @Select("SELECT * from ${tableName} WHERE xy_id =#{xyId} and zy_id is null")
    public List<BaseDatas> selectDatasByXyIdN(Map<String,Object> map);

    public List<BaseDatas> selectAllDatas(String tableName);

    public void update(Map<String,Object> map);

    @Select("SELECT DISTINCT(xy_id)  from ${_parameter} ")
    public  List<Integer> selectXyDatasId(String tableName);

    @Select("SELECT DISTINCT(zy_id)  from ${_parameter} ")
    public  List<Integer> selectZyDatasId(String tableName);

    @Select("SELECT *  from ${tableName} WHERE xy_id =#{xyId} GROUP BY zy_id")
    public List<BaseDatas> selectZyJoinXy(Map<String,Object> map);

    @Select("SELECT DISTINCT data_key from ${_parameter} ")
    public  List<Integer> selectDataKey(String tableName);

    @Select("SELECT * FROM ${tableName} where data_key=#{dataKey}")
    public List<BaseDatas> selectDatas(Map<String,Object> map);

    @Select("SELECT * from ${tableName} WHERE data_key =#{dataKey} ORDER BY y desc,m deSC ,d desc limit 1")
    public BaseDatas selectConditionData(Map<String,Object> map);

    @Select("select DISTINCT nj from ${_parameter}")
    public List<Integer> selectAllNj(String tableName);


}
