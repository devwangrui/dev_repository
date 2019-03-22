package com.example.zhengai.service.impl;

import com.example.zhengai.dao.YzDatasFormulaDao;
import com.example.zhengai.model.YzDatasFormula;
import com.example.zhengai.service.YzDatasFormulaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class YzDatasFormulaServiceImpl implements YzDatasFormulaService {

	@Autowired
	private YzDatasFormulaDao yzDatasFormulaDao;
	@Override
	public void deleteById(Integer id) {
		yzDatasFormulaDao.deleteById(id);

	}

	@Override
	public void savaYzDatasFormula(YzDatasFormula yzDatasFormula) {
		yzDatasFormulaDao.savaYzDatasFormula(yzDatasFormula);

	}

	@Override
	public YzDatasFormula selectById(Integer id) {
		return yzDatasFormulaDao.selectById(id);
	}

}
