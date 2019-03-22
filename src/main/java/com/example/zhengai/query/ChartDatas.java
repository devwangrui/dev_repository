package com.example.zhengai.query;

import java.util.List;
import java.util.Map;

public class ChartDatas {

    private Integer id;

    private Integer rId;

    private  String title;

    private String chartsType;

    private List<String> xname;

    private List<Map<String,Object>> piedata;

    private List<Float> data;

    private List<Float> data1;

    private Integer levelTwoId;

    private String levelTwoTitle;

    private Integer targetId;

    private String targetTitle;

    private String levelOneTitle;

    private String optKey;

    private Integer levelOneId;

    private String dataTitle;

    public String getDataTitle() {
        return dataTitle;
    }

    public void setDataTitle(String dataTitle) {
        this.dataTitle = dataTitle;
    }

    public String getOptKey() {
        return optKey;
    }

    public void setOptKey(String optKey) {
        this.optKey = optKey;
    }

    public Integer getLevelOneId() {
        return levelOneId;
    }

    public void setLevelOneId(Integer levelOneId) {
        this.levelOneId = levelOneId;
    }

    public Integer getLevelTwoId() {
        return levelTwoId;
    }

    public void setLevelTwoId(Integer levelTwoId) {
        this.levelTwoId = levelTwoId;
    }

    public String getLevelTwoTitle() {
        return levelTwoTitle;
    }

    public void setLevelTwoTitle(String levelTwoTitle) {
        this.levelTwoTitle = levelTwoTitle;
    }

    public Integer getTargetId() {
        return targetId;
    }

    public void setTargetId(Integer targetId) {
        this.targetId = targetId;
    }

    public String getTargetTitle() {
        return targetTitle;
    }

    public void setTargetTitle(String targetTitle) {
        this.targetTitle = targetTitle;
    }

    public String getLevelOneTitle() {
        return levelOneTitle;
    }

    public void setLevelOneTitle(String levelOneTitle) {
        this.levelOneTitle = levelOneTitle;
    }

    public Integer getrId() {
        return rId;
    }

    public void setrId(Integer rId) {
        this.rId = rId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getChartsType() {
        return chartsType;
    }

    public void setChartsType(String chartsType) {
        this.chartsType = chartsType;
    }

    public List<String> getXname() {
        return xname;
    }

    public void setXname(List<String> xname) {
        this.xname = xname;
    }

    public List<Map<String,Object>> getPiedata() {
        return piedata;
    }

    public void setPiedata(List<Map<String,Object>> piedata) {
        this.piedata = piedata;
    }

    public List<Float> getData() {
        return data;
    }

    public void setData(List<Float> data) {
        this.data = data;
    }

    public List<Float> getData1() {
        return data1;
    }

    public void setData1(List<Float> data1) {
        this.data1 = data1;
    }

    @Override
    public String toString() {
        return "ChartDatas{" +
                "id=" + id +
                ", rId=" + rId +
                ", title='" + title + '\'' +
                ", chartsType='" + chartsType + '\'' +
                ", xname=" + xname +
                ", piedata=" + piedata +
                ", data=" + data +
                ", data1=" + data1 +
                ", levelTwoId=" + levelTwoId +
                ", levelTwoTitle='" + levelTwoTitle + '\'' +
                ", targetId=" + targetId +
                ", targetTitle='" + targetTitle + '\'' +
                ", levelOneTitle='" + levelOneTitle + '\'' +
                ", levelOneId='" + levelOneId + '\'' +
                ", optKey='" + optKey + '\'' +
                ", dataTitle='" + dataTitle + '\'' +
                '}';
    }
}
