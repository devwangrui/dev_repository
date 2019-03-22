package com.example.zhengai.model;

public class BaseDatas {

    private Integer xyId;

    private Integer zyId;

    private Integer nj;

    private Float num;

    private Integer classId;

    private Integer y;

    private Integer m;

    private Integer d;

    private String addTime;

    private String sheng;

    private String sort;

    private Integer styleId;

    private Integer dataKey;

    private String title;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getDataKey() {
        return dataKey;
    }

    public void setDataKey(Integer dataKey) {
        this.dataKey = dataKey;
    }

    public Integer getStyleId() {
        return styleId;
    }

    public void setStyleId(Integer styleId) {
        this.styleId = styleId;
    }

    public Integer getXyId() {
        return xyId;
    }

    public void setXyId(Integer xyId) {
        this.xyId = xyId;
    }

    public Integer getZyId() {
        return zyId;
    }

    public void setZyId(Integer zyId) {
        this.zyId = zyId;
    }

    public Integer getNj() {
        return nj;
    }

    public void setNj(Integer nj) {
        this.nj = nj;
    }

    public Float getNum() {
        return num;
    }

    public void setNum(Float num) {
        this.num = num;
    }

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }

    public Integer getY() {
        return y;
    }

    public void setY(Integer y) {
        this.y = y;
    }

    public Integer getM() {
        return m;
    }

    public void setM(Integer m) {
        this.m = m;
    }

    public Integer getD() {
        return d;
    }

    public void setD(Integer d) {
        this.d = d;
    }

    public String getAddTime() {
        return addTime;
    }

    public void setAddTime(String addTime) {
        this.addTime = addTime;
    }

    public String getSheng() {
        return sheng;
    }

    public void setSheng(String sheng) {
        this.sheng = sheng;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    @Override
    public String toString() {
        return "BaseDatas{" +
                "xyId=" + xyId +
                ", zyId=" + zyId +
                ", nj=" + nj +
                ", num=" + num +
                ", classId=" + classId +
                ", y=" + y +
                ", m=" + m +
                ", d=" + d +
                ", addTime='" + addTime + '\'' +
                ", sheng='" + sheng + '\'' +
                ", sort='" + sort + '\'' +
                ", styleId=" + styleId +
                ", dataKey=" + dataKey +
                ", title=" + title +
                '}';
    }
}
