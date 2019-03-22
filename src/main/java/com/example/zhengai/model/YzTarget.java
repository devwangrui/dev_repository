package com.example.zhengai.model;

import java.util.List;


public class YzTarget implements Comparable<YzTarget> {
    private Integer id;

    private String title;

    private Integer rank;

    private Integer sOne;

    private Integer sTwo;

    private String stand;

    private Integer standSort;

    private Integer standSortS;

    private String dataTitle;

    private Integer dataId;

    private Integer sort;

    private Integer updateSort;

    private String remark;

    private String addTime;

    private Integer addUid;

    private String editTime;

    private Integer editUid;

    private Integer isDel;

    private String delTime;

    private Integer delUid;
    
    private YzDatas yzDatas;
    
    private List<YzTargetSort> list;

    private List<YzDatasValue> yzDatasValueList;

    private YzHomepageStyle yzHomepageStyle;

    private YzElement yzElement;

    public YzElement getYzElement() {
        return yzElement;
    }

    public void setYzElement(YzElement yzElement) {
        this.yzElement = yzElement;
    }

    public List<YzDatasValue> getYzDatasValueList() {
        return yzDatasValueList;
    }

    public void setYzDatasValueList(List<YzDatasValue> yzDatasValueList) {
        this.yzDatasValueList = yzDatasValueList;
    }

    public YzHomepageStyle getYzHomepageStyle() {
        return yzHomepageStyle;
    }

    public void setYzHomepageStyle(YzHomepageStyle yzHomepageStyle) {
        this.yzHomepageStyle = yzHomepageStyle;
    }

    public YzDatas getYzDatas() {
		return yzDatas;
	}

	public void setYzDatas(YzDatas yzDatas) {
		this.yzDatas = yzDatas;
	}

	public List<YzTargetSort> getList() {
		return list;
	}

	public void setList(List<YzTargetSort> list) {
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

    public Integer getsOne() {
        return sOne;
    }

    public void setsOne(Integer sOne) {
        this.sOne = sOne;
    }

    public Integer getsTwo() {
        return sTwo;
    }

    public void setsTwo(Integer sTwo) {
        this.sTwo = sTwo;
    }

    public String getStand() {
        return stand;
    }

    public void setStand(String stand) {
        this.stand = stand;
    }

    public Integer getStandSort() {
        return standSort;
    }

    public void setStandSort(Integer standSort) {
        this.standSort = standSort;
    }

    public Integer getStandSortS() {
        return standSortS;
    }

    public void setStandSortS(Integer standSortS) {
        this.standSortS = standSortS;
    }

    public String getDataTitle() {
        return dataTitle;
    }

    public void setDataTitle(String dataTitle) {
        this.dataTitle = dataTitle;
    }

    public Integer getDataId() {
        return dataId;
    }

    public void setDataId(Integer dataId) {
        this.dataId = dataId;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public Integer getUpdateSort() {
        return updateSort;
    }

    public void setUpdateSort(Integer updateSort) {
        this.updateSort = updateSort;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
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

    @Override
    public String toString() {
        return "YzTarget{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", rank=" + rank +
                ", sOne=" + sOne +
                ", sTwo=" + sTwo +
                ", stand='" + stand + '\'' +
                ", standSort=" + standSort +
                ", standSortS=" + standSortS +
                ", dataTitle='" + dataTitle + '\'' +
                ", dataId=" + dataId +
                ", sort=" + sort +
                ", updateSort=" + updateSort +
                ", remark='" + remark + '\'' +
                ", addTime='" + addTime + '\'' +
                ", addUid=" + addUid +
                ", editTime='" + editTime + '\'' +
                ", editUid=" + editUid +
                ", isDel=" + isDel +
                ", delTime='" + delTime + '\'' +
                ", delUid=" + delUid +
                ", yzDatas=" + yzDatas +
                ", list=" + list +
                ", yzDatasValueList=" + yzDatasValueList +
                ", yzHomepageStyle=" + yzHomepageStyle +
                ", yzElement=" + yzElement +
                '}';
    }

    @Override
    public int compareTo(YzTarget o) {
        int i = this.id - o.id;
        if(i == 0){
            return this.id - o.id;
        }
        return i;
    }

}