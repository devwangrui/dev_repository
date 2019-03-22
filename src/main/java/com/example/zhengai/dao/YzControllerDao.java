package com.example.zhengai.dao;

import com.example.zhengai.model.YzController;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface YzControllerDao {
	
	public List<YzController> selectByAddUidPrimaryKey(Integer addUid);
	
	public YzController selectPrimaryKey(Integer id);


	public int updateByPrimaryKeySelective(YzController controller);



	public int insertSelective(YzController controller);
	
	public YzController selectAllChartTid(Integer id);
}
