package com.example.zhengai.query;

public class MyChangData {
//{"name": "张三","postTime": "2018-1-1","yyfx": "原因分析1","id": 1,"yyValue":"1"},
    private String name;

    private String postTime;

    private String yyfx;

    private Integer id;

    private Integer conId;

    private String yyValue;

    public Integer getConId() {
        return conId;
    }

    public void setConId(Integer conId) {
        this.conId = conId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPostTime() {
        return postTime;
    }

    public void setPostTime(String postTime) {
        this.postTime = postTime;
    }

    public String getYyfx() {
        return yyfx;
    }

    public void setYyfx(String yyfx) {
        this.yyfx = yyfx;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getYyValue() {
        return yyValue;
    }

    public void setYyValue(String yyValue) {
        this.yyValue = yyValue;
    }

    @Override
    public String toString() {
        return "MyChangData{" +
                "name='" + name + '\'' +
                ", postTime='" + postTime + '\'' +
                ", yyfx='" + yyfx + '\'' +
                ", id=" + id +
                ", yyValue='" + yyValue + '\'' +
                '}';
    }
}
