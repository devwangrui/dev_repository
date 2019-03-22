package com.example.zhengai.service.impl;

import com.example.zhengai.dao.YzDatasChartDao;
import com.example.zhengai.model.YzDatasChart;
import com.example.zhengai.service.YzDatasChartService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class YzDatasChartServiceImpl implements YzDatasChartService {

    @Autowired
    private YzDatasChartDao yzDatasChartDao;
    @Override
    public YzDatasChart selectChartById(Integer id) {
        return yzDatasChartDao.selectChartById(id);
    }

    @Override
    public List<YzDatasChart> selectAll() {
        return yzDatasChartDao.selectAll();
    }
}
