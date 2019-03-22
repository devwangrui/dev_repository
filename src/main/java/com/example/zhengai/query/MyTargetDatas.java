package com.example.zhengai.query;

public class MyTargetDatas {

    /*{"i": 1,"firstNorm": "一级指标","secondNorm": "二级指标","normName": "指标名称","end": false,"starPeople": "王小明"}*/
    private Integer i;
    private String firstNorm;
    private String secondNorm;
    private String normName;
    private Boolean end =false;
    private String starPeople;


    public Integer getI() {
        return i;
    }

    public void setI(Integer i) {
        this.i = i;
    }

    public String getFirstNorm() {
        return firstNorm;
    }

    public void setFirstNorm(String firstNorm) {
        this.firstNorm = firstNorm;
    }

    public String getSecondNorm() {
        return secondNorm;
    }

    public void setSecondNorm(String secondNorm) {
        this.secondNorm = secondNorm;
    }

    public String getNormName() {
        return normName;
    }

    public void setNormName(String normName) {
        this.normName = normName;
    }

    public Boolean getEnd() {
        return end;
    }

    public void setEnd(Boolean end) {
        this.end = end;
    }

    public String getStarPeople() {
        return starPeople;
    }

    public void setStarPeople(String starPeople) {
        this.starPeople = starPeople;
    }

    @Override
    public String toString() {
        return "MyTargetDatas{" +
                "i=" + i +
                ", firstNorm='" + firstNorm + '\'' +
                ", secondNorm='" + secondNorm + '\'' +
                ", normName='" + normName + '\'' +
                ", end=" + end +
                ", starPeople='" + starPeople + '\'' +
                '}';
    }
}
