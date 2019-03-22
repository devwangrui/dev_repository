package com.example.zhengai.model;

public class YzTargetRatio {
    private Integer id;

    private Integer tId;

    private Integer eId;

    private Integer sort;

    private Float num;

    private Integer isOk;

    private Integer isUp;

    private Integer isNow;

    private Integer addTime;

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

    public Integer geteId() {
        return eId;
    }

    public void seteId(Integer eId) {
        this.eId = eId;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public Float getNum() {
        return num;
    }

    public void setNum(Float num) {
        this.num = num;
    }

    public Integer getIsOk() {
        return isOk;
    }

    public void setIsOk(Integer isOk) {
        this.isOk = isOk;
    }

    public Integer getIsUp() {
        return isUp;
    }

    public void setIsUp(Integer isUp) {
        this.isUp = isUp;
    }

    public Integer getIsNow() {
        return isNow;
    }

    public void setIsNow(Integer isNow) {
        this.isNow = isNow;
    }

    public Integer getAddTime() {
        return addTime;
    }

    public void setAddTime(Integer addTime) {
        this.addTime = addTime;
    }

    @Override
    public String toString() {
        return "YzTargetRatio{" +
                "id=" + id +
                ", tId=" + tId +
                ", eId=" + eId +
                ", sort=" + sort +
                ", num=" + num +
                ", isOk=" + isOk +
                ", isUp=" + isUp +
                ", isNow=" + isNow +
                ", addTime=" + addTime +
                '}';
    }
}