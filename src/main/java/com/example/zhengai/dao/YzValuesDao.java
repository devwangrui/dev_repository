package com.example.zhengai.dao;

import com.example.zhengai.model.YzValues;

import java.util.List;
import java.util.Map;

public interface YzValuesDao {

    public List<YzValues> selectValuesByMap(Map<String,Object> map);
}
