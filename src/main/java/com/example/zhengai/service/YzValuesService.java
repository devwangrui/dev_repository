package com.example.zhengai.service;

import com.example.zhengai.model.YzValues;

import java.util.List;
import java.util.Map;

public interface YzValuesService {

    public List<YzValues> selectValuesByMap(Map<String,Object> map);
}
