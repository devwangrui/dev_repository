package com.example.zhengai.model;

public class YzDatasChart {
    private Integer chartId;

    private String chartName;

    private String echartstype;

    public Integer getChartId() {
        return chartId;
    }

    public void setChartId(Integer chartId) {
        this.chartId = chartId;
    }

    public String getChartName() {
        return chartName;
    }

    public void setChartName(String chartName) {
        this.chartName = chartName;
    }

    public String getEchartstype() {
        return echartstype;
    }

    public void setEchartstype(String echartstype) {
        this.echartstype = echartstype;
    }

    @Override
    public String toString() {
        return "YzDatasChart{" +
                "chartId=" + chartId +
                ", chartName='" + chartName + '\'' +
                ", echartstype='" + echartstype + '\'' +
                '}';
    }
}