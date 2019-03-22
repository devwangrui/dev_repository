package com.example.zhengai.service;


import com.example.zhengai.model.YzController;

import java.util.List;

/**
 * <div style="color:red;width:80%;height:80px;background: #ffee00  no-repeat fixed top;margin-left:25px;">
* @ClassName: YzControllerService 
* @Description: TODO(Yz_CONTROLLER 对应service层) 
* @author 徐浙东
* @date 2018年12月13日  
*</div>
 */
public interface YzControllerService {
	
	public List<YzController> selectByAddUidPrimaryKey(Integer addUid);
	
	public YzController selectPrimaryKey(Integer id);
	
	public int updateByPrimaryKeySelective(YzController controller);
	
	public int insertSelective(YzController controller);
	
	public YzController selectAllChartTid(Integer id);
}
