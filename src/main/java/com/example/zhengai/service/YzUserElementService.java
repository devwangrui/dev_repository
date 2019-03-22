package com.example.zhengai.service;


import com.example.zhengai.model.YzUserElement;

import java.util.List;

public interface YzUserElementService {
	
    public List<YzUserElement> selectById(Integer id);
	
	public void deleteById(Integer id);
	
	public void sava(YzUserElement yzUserElement);
	
	public void update(YzUserElement yzUserElement);

}
