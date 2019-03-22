package com.example.zhengai.query;

public class ChartStyle  {

    private Integer rId;

    private Integer x;

    private Integer y;

    private Integer w;

    private Integer h;

    private Integer i;

    private String title;

    private String echartsType;

    private String trueTitle;

    private String optKey;

    private Integer styleId;

    public Integer getStyleId() {
        return styleId;
    }

    public void setStyleId(Integer styleId) {
        this.styleId = styleId;
    }

    public String getOptKey() {
        return optKey;
    }

    public void setOptKey(String optKey) {
        this.optKey = optKey;
    }

    public String getTrueTitle() {
        return trueTitle;
    }

    public void setTrueTitle(String trueTitle) {
        this.trueTitle = trueTitle;
    }

    public Integer getrId() {
        return rId;
    }

    public void setrId(Integer rId) {
        this.rId = rId;
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

    public Integer getI() {
        return i;
    }

    public void setI(Integer i) {
        this.i = i;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getEchartsType() {
        return echartsType;
    }

    public void setEchartsType(String echartsType) {
        this.echartsType = echartsType;
    }

    @Override
    public String toString() {
        return "ChartStyle{" +
                "rId=" + rId +
                ", x=" + x +
                ", y=" + y +
                ", w=" + w +
                ", h=" + h +
                ", i=" + i +
                ", title='" + title + '\'' +
                ", trueTitle='" + trueTitle + '\'' +
                ", echartsType='" + echartsType + '\'' +
                ", optKey='" + optKey + '\'' +
                ", styleId='" + styleId + '\'' +
                '}';
    }
}
