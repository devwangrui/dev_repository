package com.example.zhengai.model;

public class YzTransformCon {
    private Integer id;

    private Integer tId;

    private Integer uId;

    private String addTime;

    private Integer sort;

    private String content;

    private YzTargetViewGlKey yzTargetViewGlKey;

    private YzTargetRatio yzTargetRatio;

    private YzUser yzUser;

    public YzUser getYzUser() {
        return yzUser;
    }

    public void setYzUser(YzUser yzUser) {
        this.yzUser = yzUser;
    }

    public YzTargetViewGlKey getYzTargetViewGlKey() {
        return yzTargetViewGlKey;
    }

    public void setYzTargetViewGlKey(YzTargetViewGlKey yzTargetViewGlKey) {
        this.yzTargetViewGlKey = yzTargetViewGlKey;
    }

    public YzTargetRatio getYzTargetRatio() {
        return yzTargetRatio;
    }

    public void setYzTargetRatio(YzTargetRatio yzTargetRatio) {
        this.yzTargetRatio = yzTargetRatio;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer gettId() {
        return tId;
    }

    public void settId(Integer tId) {
        this.tId = tId;
    }

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public String getAddTime() {
        return addTime;
    }

    public void setAddTime(String addTime) {
        this.addTime = addTime;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }



    @Override
    public String toString() {
        return "YzTransformCon{" +
                "id=" + id +
                ", tId=" + tId +
                ", uId=" + uId +
                ", addTime='" + addTime + '\'' +
                ", sort=" + sort +
                ", content='" + content + '\'' +
                ", yzTargetViewGlKey=" + yzTargetViewGlKey +
                ", yzTargetRatio=" + yzTargetRatio +
                ", yzUser=" + yzUser +
                '}';
    }
}