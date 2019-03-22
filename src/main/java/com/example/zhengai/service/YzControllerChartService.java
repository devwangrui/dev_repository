package com.example.zhengai.service;


import com.example.zhengai.model.YzControllerChart;

import java.util.List;

/**
 * <div style="color:red;width:80%;height:80px;background: #ffee00  no-repeat fixed top;margin-left:25px;">
* @ClassName: YzControllerService 
* @Description: TODO(Yz_CONTROLLER_CHART 对应service层) 
* @author 徐浙东
* @date 2018年12月13日  
*</div>
 */
public interface YzControllerChartService {
	
	public List<YzControllerChart> selectYzTargetChart(Integer id);
	
	public List<YzControllerChart> selectByCidPrimaryKey(Integer id);
	
	public int deleteByPrimaryKey(Integer pId);
	
	public int insertSelective(YzControllerChart chart);
}
