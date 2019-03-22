package com.example.zhengai.model;

public class YzHomepageStyle {
    private Integer styleId;

    private Integer x;

    private Integer y;

    private Integer w;

    private Integer h;

    private Integer userId;

    private Integer targId;

    private Integer chartId;


    public Integer getStyleId() {
        return styleId;
    }

    public void setStyleId(Integer styleId) {
        this.styleId = styleId;
    }

    public Integer getX() {
        return x;
    }

    public void setX(Integer x) {
        this.x = x;
    }

    public Integer getY() {
        return y;
    }

    public void setY(Integer y) {
        this.y = y;
    }

    public Integer getW() {
        return w;
    }

    public void setW(Integer w) {
        this.w = w;
    }

    public Integer getH() {
        return h;
    }

    public void setH(Integer h) {
        this.h = h;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getTargId() {
        return targId;
    }

    public void setTargId(Integer targId) {
        this.targId = targId;
    }

    public Integer getChartId() {
        return chartId;
    }

    public void setChartId(Integer chartId) {
        this.chartId = chartId;
    }

    @Override
    public String toString() {
        return "YzHomepageStyle{" +
                "styleId=" + styleId +
                ", x=" + x +
                ", y=" + y +
                ", w=" + w +
                ", h=" + h +
                ", userId=" + userId +
                ", targId=" + targId +
                ", chartId=" + chartId +
                '}';
    }
}