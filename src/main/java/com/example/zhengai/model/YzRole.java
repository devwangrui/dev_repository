package com.example.zhengai.model;

import java.util.List;

public class YzRole {
    private Integer id;

    private String name;

    private Integer pid;

    private Integer status;

    private String remark;
    
    private Integer option;
    
   

	public Integer getOption() {
		return option;
	}

	public void setOption(Integer option) {
		this.option = option;
	}

	private List<YzUser> userList;
    


	public List<YzUser> getUserList() {
		return userList;
	}

	public void setUserList(List<YzUser> userList) {
		this.userList = userList;
	}

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

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
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
}