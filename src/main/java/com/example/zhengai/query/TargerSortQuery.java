package com.example.zhengai.query;

import com.example.zhengai.model.YzTarget;

import java.util.List;



public class TargerSortQuery implements Comparable<TargerSortQuery> {
	
	    private Integer id;

	    private String title;

	    private Integer rank;

	    private String remark;

	    private Integer pid;

	    private Integer updateSort;

	    private Integer sort;

	    private String addTime;

	    private Integer addUid;

	    private String editTime;

	    private Integer editUid;

	    private Integer isDel;

	    private String delTime;

	    private Integer delUid;
	    
	    private List<YzTarget> list;


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

		public String getRemark() {
			return remark;
		}

		public void setRemark(String remark) {
			this.remark = remark;
		}

		public Integer getPid() {
			return pid;
		}

		public void setPid(Integer pid) {
			this.pid = pid;
		}

		public Integer getUpdateSort() {
			return updateSort;
		}

		public void setUpdateSort(Integer updateSort) {
			this.updateSort = updateSort;
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

		public List<YzTarget> getList() {
			return list;
		}

		public void setList(List<YzTarget> list) {
			this.list = list;
		}

	@Override
	public String toString() {
		return "TargerSortQuery{" +
				"id=" + id +
				", title='" + title + '\'' +
				", rank=" + rank +
				", remark='" + remark + '\'' +
				", pid=" + pid +
				", updateSort=" + updateSort +
				", sort=" + sort +
				", addTime='" + addTime + '\'' +
				", addUid=" + addUid +
				", editTime='" + editTime + '\'' +
				", editUid=" + editUid +
				", isDel=" + isDel +
				", delTime='" + delTime + '\'' +
				", delUid=" + delUid +
				", list=" + list +
				'}';
	}

	@Override
	public int compareTo(TargerSortQuery o) {
		int i = this.id - o.id;
		if(i == 0){
			return this.id - o.id;
		}
		return i;

	}
}
