package com.example.zhengai.model;

import java.util.List;

public class YzChartSearch {
    private Integer id;

    private String title;

    private String remark;
    private List<YzChartSearchS> child;
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

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

	public List<YzChartSearchS> getChild() {
		return child;
	}

	public void setChild(List<YzChartSearchS> child) {
		this.child = child;
	}
}