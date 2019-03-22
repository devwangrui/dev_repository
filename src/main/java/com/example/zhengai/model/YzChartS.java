package com.example.zhengai.model;;

import java.util.List;


import org.apache.poi.ss.usermodel.Chart;

public class YzChartS {
    private Integer id;

    private String title;

    private Integer sort;
    
    private List<Chart> userList;
    
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

	public List<Chart> getUserList() {
		return userList;
	}

	public void setUserList(List<Chart> userList) {
		this.userList = userList;
	}
}