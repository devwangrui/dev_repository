package com.example.zhengai.dao;


import com.example.zhengai.model.YzDatasFormula;

public interface YzDatasFormulaDao {

	
	public void deleteById(Integer id);
	
	public void savaYzDatasFormula(YzDatasFormula yzDatasFormula);
	
	public YzDatasFormula selectById(Integer id);
}
