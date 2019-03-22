package com.example.zhengai.model;

import java.util.List;

public class YzDatas {
    private Integer id;

    private String title;

    private Integer sort;

    private String table;

    private YzValues yzValues;

    public YzValues getYzValues() {
        return yzValues;
    }

    public void setYzValues(YzValues yzValues) {
        this.yzValues = yzValues;
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

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public String getTable() {
        return table;
    }

    public void setTable(String table) {
        this.table = table;
    }

    @Override
    public String toString() {
        return "YzDatas{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", sort=" + sort +
                ", table='" + table + '\'' +
                ", yzValues=" + yzValues +
                '}';
    }
}