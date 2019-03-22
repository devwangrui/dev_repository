package com.example.zhengai.service.impl;

import com.example.zhengai.dao.BaseDatasDao;
import com.example.zhengai.model.BaseDatas;
import com.example.zhengai.service.BaseDatasService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class BaseDatasServiceImpl implements BaseDatasService {
    @Autowired
    private BaseDatasDao BaseDatasDao;

    @Override
    public List<BaseDatas> selectDatasByZyId(Map<String,Object> map) {
        return BaseDatasDao.selectDatasByZyId(map);
    }

    @Override
    public List<BaseDatas> selectDatasByXyId(Map<String,Object> map) {
        return BaseDatasDao.selectDatasByXyId(map);
    }

    @Override
    public List<BaseDatas> selectAllDatas(String tableName) {
        return BaseDatasDao.selectAllDatas(tableName);
    }

    @Override
    public void update(Map<String, Object> map) {
        BaseDatasDao.update(map);
    }

    @Override
    public List<Integer> selectXyDatasId(String tableName) {
        return BaseDatasDao.selectXyDatasId(tableName);
    }

    @Override
    public List<Integer> selectZyDatasId(String tableName) {
        return BaseDatasDao.selectZyDatasId(tableName);
    }

    @Override
    public List<BaseDatas> selectZyJoinXy(Map<String, Object> map) {
        return BaseDatasDao.selectZyJoinXy(map);
    }

    @Override
    public List<BaseDatas> selectDatasByXyIdN(Map<String, Object> map) {
        return BaseDatasDao.selectDatasByXyIdN(map);
    }

    @Override
    public List<Integer> selectDataKey(String tableName) {
        return BaseDatasDao.selectDataKey(tableName);
    }

    @Override
    public List<BaseDatas> selectDatas(Map<String, Object> map) {
        return BaseDatasDao.selectDatas(map);
    }
}
