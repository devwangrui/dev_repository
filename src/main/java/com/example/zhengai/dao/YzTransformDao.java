package com.example.zhengai.dao;

import com.example.zhengai.model.YzTransform;
import com.example.zhengai.query.MyUT;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface YzTransformDao {

    @Select("SELECT * FROM yz_transform WHERE t_id=#{tId}")
    public YzTransform selectTransformByTId(Integer tId);

    @Update("UPDATE yz_transform SET gotime =#{goTime},endtime=#{endTime} where t_id =#{tId}")
    public  void updateTransformByTId(MyUT myUT);

    public void insertSelective(YzTransform yzTransform);

    public void updateByPrimaryKeySelective(YzTransform yzTransform);



}
