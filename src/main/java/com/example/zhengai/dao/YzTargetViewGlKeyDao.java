package com.example.zhengai.dao;


import com.example.zhengai.model.YzTargetViewGlKey;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface YzTargetViewGlKeyDao {
	
	public void deleteByVid(Integer vId);
	
	public void sava(YzTargetViewGlKey ytvg);



}
