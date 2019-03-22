package com.example.zhengai.model;

public class StudentDistribution {
    private Integer id;

    private String province;

    private Integer studentCount;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
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
		return "StudentDistribution [id=" + id + ", province=" + province
				+ ", studentCount=" + studentCount + "]";
	}
    
    
}