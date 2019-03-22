package com.example.zhengai.dao;

import com.example.zhengai.model.YzDatasChart;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface YzDatasChartDao {

    @Select("select * from yz_datas_chart where chart_id =#{id}")
    public YzDatasChart selectChartById(Integer id);

    @Select("select * from yz_datas_chart")
    public List<YzDatasChart> selectAll();
}
