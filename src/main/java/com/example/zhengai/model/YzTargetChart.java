package com.example.zhengai.model;

import java.util.List;

public class YzTargetChart {
    private Integer id;

    private String title;

    private String boxTitle;

    private String boxCon;

    private Integer select;

    private Integer data;

    private Integer chart;

    private String where;

    private Integer tId;

    private String addTime;

    private  Integer addUid;

    private Integer editUid;

    private String editTime;

    private Integer isDel;

    private String delTime;

    private Integer delUid;
    
	private List<YzChart> userList;
    
    public List<YzChart> getUserList() {
		return userList;
	}

	public void setUserList(List<YzChart> userList) {
		this.userList = userList;
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

    public String getBoxTitle() {
        return boxTitle;
    }

    public void setBoxTitle(String boxTitle) {
        this.boxTitle = boxTitle;
    }

    public String getBoxCon() {
        return boxCon;
    }

    public void setBoxCon(String boxCon) {
        this.boxCon = boxCon;
    }

    public Integer getSelect() {
        return select;
    }

    public void setSelect(Integer select) {
        this.select = select;
    }

    public Integer getData() {
        return data;
    }

    public void setData(Integer data) {
        this.data = data;
    }

    public Integer getChart() {
        return chart;
    }

    public void setChart(Integer chart) {
        this.chart = chart;
    }

    public String getWhere() {
        return where;
    }

    public void setWhere(String where) {
        this.where = where;
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

    public Integer getEditUid() {
        return editUid;
    }

    public void setEditUid(Integer editUid) {
        this.editUid = editUid;
    }

    public String getEditTime() {
        return editTime;
    }

    public void setEditTime(String editTime) {
        this.editTime = editTime;
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
}