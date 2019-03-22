package com.example.zhengai.dao;

import com.example.zhengai.model.YzTransform;
import com.example.zhengai.model.YzTransformCon;
import com.example.zhengai.query.Uid;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import java.util.List;
import java.util.Map;

public interface YzTransformConDao {

    @Select("SELECT * FROM yz_transform_con WHERE t_id =#{tId}")
    public List<YzTransformCon> selectTargetViewByTid(Integer tId);

    @Select("select * from yz_transform_con WHERE u_id =#{uId}")
    public List<YzTransformCon> selectByUserId(Integer uId);

    public void insertSelective(YzTransformCon yzTransformCon);

    public List<YzTransformCon> selectZhengaiUser(Integer tId);

    @Select("SELECT MAX(sort) from yz_transform_con WHERE u_id=#{uId}")
    public Integer selectMaxSort(Integer uId);

    @Delete("delete from yz_transform_con where u_id=#{uId}")
    public void deletUserByUId(Integer uId);

    public YzTransformCon selectByPrimaryKey(Integer id);

    public void updateByPrimaryKeySelective(YzTransformCon yzTransformCon);

    @Select("SELECT DISTINCT u_id FROM yz_transform_con WHERE t_id =#{tId}")
    public List<Integer> selectAllUIdByTId(Integer tId);

    public YzTransformCon selectZhengaiUserCondition(Map<String,Object> map);

    @Select("select * from yz_transform_con where sort =2 and t_id =#{tId}")
    public List<YzTransformCon> selectTransformConBySort2(Integer tId);


}
