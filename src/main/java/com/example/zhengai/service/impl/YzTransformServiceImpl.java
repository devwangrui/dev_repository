package com.example.zhengai.service.impl;

import com.example.zhengai.dao.YzTransformDao;
import com.example.zhengai.model.YzTransform;
import com.example.zhengai.query.MyUT;
import com.example.zhengai.service.YzTransformService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class YzTransformServiceImpl implements YzTransformService {
    @Autowired
    private YzTransformDao yzTransformDao;


    @Override
    public YzTransform selectTransformByTId(Integer tId) {
        return yzTransformDao.selectTransformByTId(tId);
    }

    @Override
    public void updateTransformByTId(MyUT myUT) {
        yzTransformDao.updateTransformByTId(myUT);
    }


    @Override
    public void insertSelective(YzTransform yzTransform) {
        yzTransformDao.insertSelective(yzTransform);
    }

    @Override
    public void updateByPrimaryKeySelective(YzTransform yzTransform) {
        yzTransformDao.updateByPrimaryKeySelective(yzTransform);
    }
}
