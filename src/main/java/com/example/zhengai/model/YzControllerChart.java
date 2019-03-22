package com.example.zhengai.model;

import java.util.List;



public class YzControllerChart {
    private Integer id;

    private Integer pId;

    private String address;

    private String url;

    private Integer cId;

    private List<YzTargetChart> userList;
    
    private List<YzChart> userChart;
    
 private List<YzChartSearch> chartSearch;
    
    private List<YzChartSearchS> chartSearchS;
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getpId() {
        return pId;
    }

    public void setpId(Integer pId) {
        this.pId = pId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getcId() {
        return cId;
    }

    public void setcId(Integer cId) {
        this.cId = cId;
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

	public List<YzChartSearch> getChartSearch() {
		return chartSearch;
	}

	public void setChartSearch(List<YzChartSearch> chartSearch) {
		this.chartSearch = chartSearch;
	}

	public List<YzChartSearchS> getChartSearchS() {
		return chartSearchS;
	}

	public void setChartSearchS(List<YzChartSearchS> chartSearchS) {
		this.chartSearchS = chartSearchS;
	}
}