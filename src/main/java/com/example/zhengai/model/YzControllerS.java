package com.example.zhengai.model;

import java.util.List;

public class YzControllerS {
    
	private Integer id;

    private String title;

    private String icon;

    private Integer rank;

    private String addTime;

	private Integer addUid;

    private String editTime;

    private Integer editUid;

    private Integer isDel;

    private String delTime;

    private Integer delUid;
    
    private List<YzController> user;

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

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public Integer getRank() {
        return rank;
    }

    public void setRank(Integer rank) {
        this.rank = rank;
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

	public List<YzController> getUser() {
		return user;
	}

	public void setUser(List<YzController> user) {
		this.user = user;
	}
}