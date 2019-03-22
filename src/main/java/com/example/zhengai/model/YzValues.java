package com.example.zhengai.model;

public class YzValues {
    private Integer valueId;

    private Integer dataId;

    private Integer xyId;

    private Float num;

    private Float num1;

    private String addTime;

    private String dataTitle;

    public Integer getValueId() {
        return valueId;
    }

    public void setValueId(Integer valueId) {
        this.valueId = valueId;
    }

    public Integer getDataId() {
        return dataId;
    }

    public void setDataId(Integer dataId) {
        this.dataId = dataId;
    }

    public Integer getXyId() {
        return xyId;
    }

    public void setXyId(Integer xyId) {
        this.xyId = xyId;
    }

    public Float getNum() {
        return num;
    }

    public void setNum(Float num) {
        this.num = num;
    }

    public Float getNum1() {
        return num1;
    }

    public void setNum1(Float num1) {
        this.num1 = num1;
    }

    public String getAddTime() {
        return addTime;
    }

    public void setAddTime(String addTime) {
        this.addTime = addTime;
    }

    public String getDataTitle() {
        return dataTitle;
    }

    public void setDataTitle(String dataTitle) {
        this.dataTitle = dataTitle;
    }

    @Override
    public String toString() {
        return "YzValues{" +
                "valueId=" + valueId +
                ", dataId=" + dataId +
                ", xyId=" + xyId +
                ", num=" + num +
                ", num1=" + num1 +
                ", addTime='" + addTime + '\'' +
                ", dataTitle='" + dataTitle + '\'' +
                '}';
    }
}