package com.example.zhengai.query;

public class QueryStudent {
	
	private String province;
	
	private Integer studentCount;

	public String getprovince() {
		return province;
	}

	public void setprovince(String province) {
		this.province = province;
	}

	public Integer getStudentCount() {
		return studentCount;
	}

	public void setStudentCount(Integer studentCount) {
		this.studentCount = studentCount;
	}

	@Override
	public String toString() {
		return "QueryStudent [province=" + province + ", studentCount="
				+ studentCount + "]";
	}
	
	

}
