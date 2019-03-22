package com.example.zhengai.model;

import java.util.List;

public class YzDic {
    private Integer id;

    private String title;

    private String sort;

    private Integer pid;
    
    private List<YzDatasDic> user;
    
    private List<YzDatas> list;

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

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

	public List<YzDatasDic> getUser() {
		return user;
	}

	public void setUser(List<YzDatasDic> user) {
		this.user = user;
	}

	public List<YzDatas> getList() {
		return list;
	}

	public void setList(List<YzDatas> list) {
		this.list = list;
	}
}