package com.example.zhengai.service;


import com.example.zhengai.model.YzTargetChart;

import java.util.List;

/**
 * <div style="color:red;width:80%;height:80px;background: #ffee00  no-repeat fixed top;margin-left:25px;">
* @ClassName: YzControllerService 
* @Description: TODO(Yz_Target_Chart对应service层) 
* @author 徐浙东
* @date 2018年12月13日  
*</div>
 */
public interface YzTargetChartSevice {
	
	public List<YzTargetChart> selectAllChart();
	
	public List<YzTargetChart> selectAll(String title);
	
	public List<YzTargetChart> selectAllByTid(Integer id);
	
	public Integer insertSelective(YzTargetChart chart);
	
	public Integer updateByPrimaryKeySelective(YzTargetChart chart);
	
	public YzTargetChart  selectByPrimaryKey(Integer id);
}
