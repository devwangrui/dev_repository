package com.example.zhengai.dao;

import com.example.zhengai.model.YzDatas;
import com.github.abel533.echarts.style.LineStyle;
import org.apache.ibatis.annotations.Select;

import java.util.List;


public interface YzDatasDao {
   
	
	public YzDatas selectByPrimaryKey(Integer id);
	
	public void update(YzDatas yzDatas);
	
	public void sava(YzDatas yzDatas);
	
	public List<YzDatas> selectDatas(String title);
	
	public List<YzDatas> selectByTitle();

	@Select("SELECT * FROM zhangai.yz_datas")
	public List<YzDatas>  selectAllDatas();
}
