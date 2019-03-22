package com.example.zhengai.service;

import com.example.zhengai.model.YzHomepageStyle;

public interface YzHomepageStyleService {

    public void updateByPrimaryKeySelective(Integer chartId,Integer styleId);

    public Integer insert(YzHomepageStyle yzHomepageStyle);

    public Integer selectMaxY();

    public Integer selectTargetCount();

    public Integer selectMaxX();

    public Integer selectEndX();

    public void updateStyle(YzHomepageStyle yzHomepageStyle);

    public YzHomepageStyle selectByTargeyId(Integer targetId);

    public YzHomepageStyle selectById(Integer styleId);

}
