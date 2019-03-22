package com.example.zhengai.service.impl;

import com.example.zhengai.dao.YzNewsDao;
import com.example.zhengai.model.YzNews;
import com.example.zhengai.service.YzNewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class YzNewsServiceImpl implements YzNewsService {
    @Autowired
    private YzNewsDao yzNewsDao;
    @Override
    public List<YzNews> selectNewsToHomePage() {
        return yzNewsDao.selectNewsToHomePage();
    }
}
