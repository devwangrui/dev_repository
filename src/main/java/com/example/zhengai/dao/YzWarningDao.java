package com.example.zhengai.dao;

import com.example.zhengai.model.YzWarning;
import org.apache.ibatis.annotations.Select;

public interface YzWarningDao {

    @Select("select * from yz_warning where v_id =#{vId}")
    public YzWarning selectWarningByVId(Integer vId);

    public void updateByPrimaryKey(YzWarning yzWarning);
}
