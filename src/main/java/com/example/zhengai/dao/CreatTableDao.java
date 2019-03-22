package com.example.zhengai.dao;

import org.apache.ibatis.annotations.Param;

public interface CreatTableDao {

    public void createTmpTable(@Param("tableName") String tableName);

    public void dropTmpTable(@Param("tableName") String tableName);

    public String isExit(@Param("tableName") String tableName);
}
