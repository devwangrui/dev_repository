package com.example.zhengai.service;


import com.example.zhengai.model.YzDatasFormula;

public interface YzDatasFormulaService {
	
    public void deleteById(Integer id);
	
	public void savaYzDatasFormula(YzDatasFormula yzDatasFormula);
	
	public YzDatasFormula selectById(Integer id);

}
