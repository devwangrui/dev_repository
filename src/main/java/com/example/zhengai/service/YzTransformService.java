package com.example.zhengai.service;

import com.example.zhengai.model.YzTransform;
import com.example.zhengai.query.MyUT;

import java.util.Map;

public interface YzTransformService {


    public YzTransform selectTransformByTId(Integer tId);

    public  void updateTransformByTId(MyUT myUT);

    public void insertSelective(YzTransform yzTransform);

    public void updateByPrimaryKeySelective(YzTransform yzTransform);

}
