package com.example.zhengai.dao;

import com.example.zhengai.model.YzControllerS;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;


public interface YzControllerSDao {
	
	public List<YzControllerS> selectALLControllers();


	public int updateByPrimaryKeySelective(YzControllerS s);

	public int insertSelective(YzControllerS s);


	public void deleteByPrimaryKey(Integer id);

	public YzControllerS selectByPrimaryKey(Integer id);

	public List<YzControllerS> selectAll();
}
