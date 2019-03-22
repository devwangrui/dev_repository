package com.example.zhengai.model;

public class YzDatasValue {
    private Integer dataTargetId;

    private String dataTitle;

    private Integer targetId;

    private Integer dataValue;

    private YzValues yzValues;

    public YzValues getYzValues() {
        return yzValues;
    }

    public void setYzValues(YzValues yzValues) {
        this.yzValues = yzValues;
    }

    public Integer getDataTargetId() {
        return dataTargetId;
    }

    public void setDataTargetId(Integer dataTargetId) {
        this.dataTargetId = dataTargetId;
    }

    public String getDataTitle() {
        return dataTitle;
    }

    public void setDataTitle(String dataTitle) {
        this.dataTitle = dataTitle;
    }

    public Integer getTargetId() {
        return targetId;
    }

    public void setTargetId(Integer targetId) {
        this.targetId = targetId;
    }

    public Integer getDataValue() {
        return dataValue;
    }

    public void setDataValue(Integer dataValue) {
        this.dataValue = dataValue;
    }

    @Override
    public String toString() {
        return "YzDatasValue{" +
                "dataTargetId=" + dataTargetId +
                ", dataTitle='" + dataTitle + '\'' +
                ", targetId=" + targetId +
                ", dataValue=" + dataValue +
                ", yzValues=" + yzValues +
                '}';
    }
}