package com.example.zhengai.model;

import java.util.List;

import com.example.zhengai.query.YzElementQuery;


public class YzElement   {
    private Integer id;

    private String title;

    private Integer rank;

    private Integer sort;

    private String addTime;

    private Integer addUid;

    private Integer isDel;

    private Integer pid;

    private Integer pidSort;

    private Integer level;
    
    private List<YzElementQuery> list;
    
  private List<YzElementViewKey> userView;
    
    private List<YzTargetView> userTarget;

    private  List<YzTarget> yzTargets;

    private List<YzTargetSort> yzTargetSorts;

    private List<YzUserElement> yzUserElements;

    public List<YzUserElement> getYzUserElements() {
        return yzUserElements;
    }

    public void setYzUserElements(List<YzUserElement> yzUserElements) {
        this.yzUserElements = yzUserElements;
    }

    public List<YzTargetSort> getYzTargetSorts() {
        return yzTargetSorts;
    }

    public void setYzTargetSorts(List<YzTargetSort> yzTargetSorts) {
        this.yzTargetSorts = yzTargetSorts;
    }

    public List<YzTarget> getYzTargets() {
        return yzTargets;
    }

    public void setYzTargets(List<YzTarget> yzTargets) {
        this.yzTargets = yzTargets;
    }

    public List<YzElementQuery> getList() {
		return list;
	}

	public void setList(List<YzElementQuery> list) {
		this.list = list;
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

    public Integer getRank() {
        return rank;
    }

    public void setRank(Integer rank) {
        this.rank = rank;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
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

    public Integer getIsDel() {
        return isDel;
    }

    public void setIsDel(Integer isDel) {
        this.isDel = isDel;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getPidSort() {
        return pidSort;
    }

    public void setPidSort(Integer pidSort) {
        this.pidSort = pidSort;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }


	public List<YzElementViewKey> getUserView() {
		return userView;
	}

	public void setUserView(List<YzElementViewKey> userView) {
		this.userView = userView;
	}

	public List<YzTargetView> getUserTarget() {
		return userTarget;
	}

	public void setUserTarget(List<YzTargetView> userTarget) {
		this.userTarget = userTarget;
	}

    @Override
    public String toString() {
        return "YzElement{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", rank=" + rank +
                ", sort=" + sort +
                ", addTime='" + addTime + '\'' +
                ", addUid=" + addUid +
                ", isDel=" + isDel +
                ", pid=" + pid +
                ", pidSort=" + pidSort +
                ", level=" + level +
                ", list=" + list +
                ", userView=" + userView +
                ", userTarget=" + userTarget +
                ", yzTargets=" + yzTargets +
                ", yzTargetSorts=" + yzTargetSorts +
                ", yzUserElements=" + yzUserElements +
                '}';
    }
}