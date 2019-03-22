package com.example.zhengai.model;

import java.util.List;

public class YzNode {
  

	private Integer id;

    private String name;

    private String title;

    private Integer status;

    private String remark;

    private Integer sort;

    private Integer pid;

    private Integer level;
    
    private Integer judge;
    
    private List<YzNode> yzNode;
    
    private List<YzRole> list;

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public List<YzNode> getYzNode() {
		return yzNode;
	}

    
	public void setYzNode(List<YzNode> yzNode) {
		this.yzNode = yzNode;
	}
	
	public List<YzRole> getlist() {
		return list;
	}


	public void setlist(List<YzRole> list) {
		this.list = list;
	}

	public Integer getJudge() {
		return judge;
	}

	public void setJudge(Integer judge) {
		this.judge = judge;
	}
}