package com.example.zhengai.query;

import com.example.zhengai.model.YzElement;

import java.util.List;



public class YzElementQuery extends YzElement {
	
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

	/*@Override
	public List<YzElementQuery> getList() {
		return list;
	}

	public void setList(List<YzElementQuery> list) {
		this.list = list;
	}*/
}
