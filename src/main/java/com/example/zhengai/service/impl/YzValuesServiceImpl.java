package com.example.zhengai.service.impl;

import com.example.zhengai.dao.YzValuesDao;
import com.example.zhengai.model.YzValues;
import com.example.zhengai.service.YzValuesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class YzValuesServiceImpl implements YzValuesService {
    @Autowired
    private YzValuesDao yzValuesDao;

    @Override
    public List<YzValues> selectValuesByMap(Map<String, Object> map) {
        return yzValuesDao.selectValuesByMap(map);
    }
}
