
package com.example.zhengai.service;


import com.example.zhengai.model.YzChartS;

import java.util.List;

public interface YzChartSService {
	public List<YzChartS> selectByPidAndSort();
	
	public YzChartS selectByChartId(Integer id);
}
