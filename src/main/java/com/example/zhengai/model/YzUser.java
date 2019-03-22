package com.example.zhengai.model;

import java.util.List;

public class YzUser {
	
    private Integer id;

    private String username;

    private String name;

    private Integer sort;

    private Integer bmOne;

    private Integer bmTwo;

    private Integer bmThree;

    private Integer addTime;

    private Integer lastLogin;

    private Integer loginNum;
    
    private List<YzRole> roleList;
    
    private List<YzElement> list;

    private List<YzTransformCon> yzTransformCon;

    private YzTransformCon transformCon;

    private List<YzUserElement> yzUserElement;

    public List<YzUserElement> getYzUserElement() {
        return yzUserElement;
    }

    public YzTransformCon getTransformCon() {
        return transformCon;
    }

    public void setTransformCon(YzTransformCon transformCon) {
        this.transformCon = transformCon;
    }

    public void setYzUserElement(List<YzUserElement> yzUserElement) {
        this.yzUserElement = yzUserElement;
    }

    public List<YzTransformCon> getYzTransformCon() {
        return yzTransformCon;
    }

    public void setYzTransformCon(List<YzTransformCon> yzTransformCon) {
        this.yzTransformCon = yzTransformCon;
    }

    public List<YzElement> getList() {
		return list;
	}

	public void setList(List<YzElement> list) {
		this.list = list;
	}

	public List<YzRole> getRoleList() {
		return roleList;
	}

	public void setRoleList(List<YzRole> roleList) {
		this.roleList = roleList;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public Integer getBmOne() {
        return bmOne;
    }

    public void setBmOne(Integer bmOne) {
        this.bmOne = bmOne;
    }

    public Integer getBmTwo() {
        return bmTwo;
    }

    public void setBmTwo(Integer bmTwo) {
        this.bmTwo = bmTwo;
    }

    public Integer getBmThree() {
        return bmThree;
    }

    public void setBmThree(Integer bmThree) {
        this.bmThree = bmThree;
    }

    public Integer getAddTime() {
        return addTime;
    }

    public void setAddTime(Integer addTime) {
        this.addTime = addTime;
    }

    public Integer getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(Integer lastLogin) {
        this.lastLogin = lastLogin;
    }

    public Integer getLoginNum() {
        return loginNum;
    }

    public void setLoginNum(Integer loginNum) {
        this.loginNum = loginNum;
    }

    @Override
    public String toString() {
        return "YzUser{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", name='" + name + '\'' +
                ", sort=" + sort +
                ", bmOne=" + bmOne +
                ", bmTwo=" + bmTwo +
                ", bmThree=" + bmThree +
                ", addTime=" + addTime +
                ", lastLogin=" + lastLogin +
                ", loginNum=" + loginNum +
                ", roleList=" + roleList +
                ", list=" + list +
                ", yzTransformCon=" + yzTransformCon +
                ", yzUserElement=" + yzUserElement +
                '}';
    }
}