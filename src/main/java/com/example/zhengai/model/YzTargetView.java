package com.example.zhengai.model;

import java.util.List;

public class YzTargetView {
    private Integer id;

    private String title;

    private Integer sort;

    private Integer isShow;

    private Integer eId;

    private String addTime;

    private Integer addUid;

    private String editTime;

    private Integer editUid;

    private Integer isDel;

    private String delTime;

    private Integer delUid;
    
    private YzUser yzUser;
    
    private Integer juge;
    
    private List<YzTargetSort> alist;

    private YzWarning yzWarning;

    public List<YzTargetSort> getAlist() {
        return alist;
    }

    public void setAlist(List<YzTargetSort> alist) {
        this.alist = alist;
    }

    public YzWarning getYzWarning() {
        return yzWarning;
    }

    public void setYzWarning(YzWarning yzWarning) {
        this.yzWarning = yzWarning;
    }

    public List<YzTargetSort> getaList() {
		return alist;
	}

	public void setaList(List<YzTargetSort> alist) {
		this.alist = alist;
	}

	public YzUser getYzUser() {
		return yzUser;
	}

	public void setYzUser(YzUser yzUser) {
		this.yzUser = yzUser;
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

    public Integer getIsShow() {
        return isShow;
    }

    public void setIsShow(Integer isShow) {
        this.isShow = isShow;
    }

    public Integer geteId() {
        return eId;
    }

    public void seteId(Integer eId) {
        this.eId = eId;
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

	public Integer getJuge() {
		return juge;
	}

	public void setJuge(Integer juge) {
		this.juge = juge;
	}

    @Override
    public String toString() {
        return "YzTargetView{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", sort=" + sort +
                ", isShow=" + isShow +
                ", eId=" + eId +
                ", addTime='" + addTime + '\'' +
                ", addUid=" + addUid +
                ", editTime='" + editTime + '\'' +
                ", editUid=" + editUid +
                ", isDel=" + isDel +
                ", delTime='" + delTime + '\'' +
                ", delUid=" + delUid +
                ", yzUser=" + yzUser +
                ", juge=" + juge +
                ", alist=" + alist +
                ", yzWarning=" + yzWarning +
                '}';
    }
}