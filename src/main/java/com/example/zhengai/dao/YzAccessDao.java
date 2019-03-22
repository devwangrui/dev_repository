package com.example.zhengai.dao;


import com.example.zhengai.model.YzAccess;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.springframework.boot.context.properties.ConfigurationProperties;


public interface YzAccessDao {

	public int insertSelective(YzAccess yzAccess);

	public int deleteByRoleId(Integer id);
}
