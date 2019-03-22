package com.example.zhengai.service.impl;

import com.example.zhengai.dao.YzWarningDao;
import com.example.zhengai.model.YzWarning;
import com.example.zhengai.service.YzWarningService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class YzWarningServiceImpl implements YzWarningService {

    @Autowired
    private YzWarningDao yzWarningDao;

    @Override
    public YzWarning selectWarningByVId(Integer vId) {
        return yzWarningDao.selectWarningByVId(vId);
    }

    @Override
    public void updateWarningByVId(YzWarning yzWarning) {

        yzWarningDao.updateByPrimaryKey(yzWarning);

    }
}
