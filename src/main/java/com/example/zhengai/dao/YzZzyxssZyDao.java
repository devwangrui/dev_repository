package com.example.zhengai.dao;

import com.example.zhengai.model.YzZzyxssZy;
import org.apache.ibatis.annotations.Select;

public interface YzZzyxssZyDao {

    @Select("SELECT * from yz_zzyxss_zy WHERE zy_id =#{id}")
    public YzZzyxssZy selectById(Integer id);
}
