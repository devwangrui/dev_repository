package com.example.zhengai.service;

import com.example.zhengai.model.YzWarning;

public interface YzWarningService {

    public YzWarning selectWarningByVId(Integer vId);

    public void updateWarningByVId(YzWarning yzWarning);
}
