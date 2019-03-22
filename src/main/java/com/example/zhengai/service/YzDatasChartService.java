package com.example.zhengai.service;


import com.example.zhengai.model.YzDatasChart;

import java.util.List;

public interface YzDatasChartService {

    public YzDatasChart selectChartById(Integer id);

    public List<YzDatasChart> selectAll();
}
