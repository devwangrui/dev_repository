package com.example.zhengai.dao;
import java.util.List;

import com.example.zhengai.model.YzControllerChart;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;

public interface YzControllerChartDao {
	
	public List<YzControllerChart> selectYzTargetChart(Integer id);
	
	public List<YzControllerChart> selectByCidPrimaryKey(Integer id);


	public int deleteByPrimaryKey(Integer pId);


	public int insertSelective(YzControllerChart chart);
}
