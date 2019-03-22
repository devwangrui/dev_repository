package com.example.zhengai.dao;


import com.example.zhengai.model.YzChart;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

public interface YzChartDao {

	public YzChart selectByPrimaryKey(Integer id);
}
