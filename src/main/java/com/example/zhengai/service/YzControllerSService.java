package com.example.zhengai.service;


import com.example.zhengai.model.YzControllerS;

import java.util.List;

/**
 * <div style="color:red;width:80%;height:80px;background: #ffee00  no-repeat fixed top;margin-left:25px;">
* @ClassName: YzControllerService 
* @Description: TODO(Yz_CONTROLLER_S 对应service层) 
* @author 徐浙东
* @date 2018年12月13日  
*</div>
 */
public interface YzControllerSService {
	
	public List<YzControllerS> selectALLControllers();
	
	public int updateByPrimaryKeySelective(YzControllerS s);
	
	public int insertSelective(YzControllerS s);
	
	public void deleteByPrimaryKey(Integer id);
	
	public YzControllerS selectByPrimaryKey(Integer id);

	public List<YzControllerS> selectAll();
}
