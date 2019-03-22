package com.example.zhengai.service.impl;

import com.example.zhengai.dao.YzHomepageStyleDao;
import com.example.zhengai.model.YzHomepageStyle;
import com.example.zhengai.service.YzHomepageStyleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class YzHomePageStyleServiceImpl implements YzHomepageStyleService {

    @Autowired
    private YzHomepageStyleDao yzHomepageStyleDao;

    @Override
    public Integer insert(YzHomepageStyle yzHomepageStyle) {
        return yzHomepageStyleDao.insert(yzHomepageStyle);
    }

    @Override
    public void updateByPrimaryKeySelective(Integer chartId, Integer styleId) {
        yzHomepageStyleDao.updateByPrimaryKeySelective(chartId,styleId);
    }

    @Override
    public Integer selectTargetCount() {
        return yzHomepageStyleDao.selectTargetCount();
    }

    @Override
    public Integer selectMaxY() {
        return yzHomepageStyleDao.selectMaxY();
    }

    public Integer selectMaxX(){
        return yzHomepageStyleDao.selectMaxX();
    }

    @Override
    public Integer selectEndX() {
        return yzHomepageStyleDao.selectEndX();
    }

    public void updateStyle(YzHomepageStyle yzHomepageStyle){
        yzHomepageStyleDao.updateStyle(yzHomepageStyle);
    };

    @Override
    public YzHomepageStyle selectByTargeyId(Integer targetId) {
        return yzHomepageStyleDao.selectByTargeyId(targetId);
    }

    @Override
    public YzHomepageStyle selectById(Integer styleId) {
        return yzHomepageStyleDao.selectById(styleId);
    }
}
