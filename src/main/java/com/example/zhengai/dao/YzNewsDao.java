package com.example.zhengai.dao;

import com.example.zhengai.model.YzNews;

import java.util.List;

public interface YzNewsDao {

    public List<YzNews> selectNewsToHomePage();
}
