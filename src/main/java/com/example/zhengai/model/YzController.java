package com.example.zhengai.model;

import java.util.List;

public class YzController {
    private Integer id;

    private String title;

    private Integer rank;

    private Integer isShow;

    private String controller;

    private Integer sort;

    private Integer tId;

    private String addTime;

    private Integer addUid;

    private String editTime;

    private Integer editUid;

    private Integer isDel;

    private String delTime;

    private Integer delUid;
    
    private List<YzControllerChart> user;

    private List<YzTargetChart> userList;
    
    private List<YzChart> userChart;
    
    private List<YzControllerChart> chart;
    
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

    public Integer getRank() {
        return rank;
    }

    public void setRank(Integer rank) {
        this.rank = rank;
    }

    public Integer getIsShow() {
        return isShow;
    }

    public void setIsShow(Integer isShow) {
        this.isShow = isShow;
    }

    public String getController() {
        return controller;
    }

    public void setController(String controller) {
        this.controller = controller;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public Integer gettId() {
        return tId;
    }

    public void settId(Integer tId) {
        this.tId = tId;
    }

    public String getAddTime() {
        return addTime;
    }

    public void setAddTime(String addTime) {
        this.addTime = addTime;
    }

    public Integer getAddUid() {
        return addUid;
    }

    public void setAddUid(Integer addUid) {
        this.addUid = addUid;
    }

    public String getEditTime() {
        return editTime;
    }

    public void setEditTime(String editTime) {
        this.editTime = editTime;
    }

    public Integer getEditUid() {
        return editUid;
    }

    public void setEditUid(Integer editUid) {
        this.editUid = editUid;
    }

    public Integer getIsDel() {
        return isDel;
    }

    public void setIsDel(Integer isDel) {
        this.isDel = isDel;
    }

    public String getDelTime() {
        return delTime;
    }

    public void setDelTime(String delTime) {
        this.delTime = delTime;
    }

    public Integer getDelUid() {
        return delUid;
    }

    public void setDelUid(Integer delUid) {
        this.delUid = delUid;
    }

	public List<YzControllerChart> getUser() {
		return user;
	}

	public void setUser(List<YzControllerChart> user) {
		this.user = user;
	}

	public List<YzTargetChart> getUserList() {
		return userList;
	}

	public void setUserList(List<YzTargetChart> userList) {
		this.userList = userList;
	}

	public List<YzChart> getUserChart() {
		return userChart;
	}

	public void setUserChart(List<YzChart> userChart) {
		this.userChart = userChart;
	}

	public List<YzControllerChart> getChart() {
		return chart;
	}

	public void setChart(List<YzControllerChart> chart) {
		this.chart = chart;
	}
}