package com.example.zhengai.dao;

import com.example.zhengai.model.YzHomepageStyle;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Service;

public interface YzHomepageStyleDao {

    public void updateByPrimaryKeySelective(Integer chartId,Integer styleId);

    public Integer insert(YzHomepageStyle yzHomepageStyle);

    @Select("select max(y) from yz_homepage_style")
    public Integer selectMaxY();

    @Select("SELECT COUNT(DISTINCT(q.kid)) FROM (SELECT * FROM (SELECT * from (SELECT t.*,k.id kid,k.title ktitle,k.rank krank,k.s_one ko,k.s_two kt,k.stand ks,k.stand_sort kss,k.stand_sort_s ksss,k.data_title kdt,\n" +
            "k.data_id kdi,k.sort ksort,k.update_sort kus,k.remark kr,k.add_time kat,k.add_uid kau,k.is_del kide,k.del_time kdet,k.del_uid kdd FROM(SELECT a.*\n" +
            ",b.id AS '二级ID',b.title AS ti,b.rank AS ra,b.remark as br,b.pid as pi,\n" +
            "b.update_sort as bu,b.sort AS bs,b.add_time as bat,b.add_uid as bau,b.edit_time as bet,b.edit_uid as beu,b.is_del as bid ,b.del_time as bdt,b.del_uid as bdu from yz_target_sort a ,yz_target_sort b WHERE a.id = b.pid AND a.is_del =0) t,yz_target k WHERE t.id = k.s_one AND t.`二级ID`=k.s_two) x ,yz_datas_value f\n" +
            "WHERE x.kid = f.target_id) m LEFT JOIN yz_homepage_style s ON m.kid = s.targ_id)q ")
    public Integer selectTargetCount();

    @Select("select max(x) from yz_homepage_style")
    public Integer selectMaxX();
    @Select("SELECT MAX(x) FROM (select * from yz_homepage_style t WHERE t.y= (SELECT max(y) FROM yz_homepage_style ))h")
    public Integer selectEndX();

    public void updateStyle(YzHomepageStyle yzHomepageStyle);

    @Select("select * from yz_homePage_style where targ_Id = #{targetId}")
    public YzHomepageStyle selectByTargeyId(Integer targetId);

    @Select("select * from yz_homePage_style where style_id = #{styleId}")
    public YzHomepageStyle selectById(Integer styleId);


}
