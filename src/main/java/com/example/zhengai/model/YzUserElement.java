package com.example.zhengai.model;

public class YzUserElement {
    private Integer uId;

    private Integer eIdOne;

    private Integer eIdTwo;

    private Integer eIdT;

    private YzElement yzElement;

    private YzUser yzUser;

    public YzUser getYzUser() {
        return yzUser;
    }


    public void setYzUser(YzUser yzUser) {
        this.yzUser = yzUser;
    }

    public YzElement getYzElement() {
        return yzElement;
    }

    public void setYzElement(YzElement yzElement) {
        this.yzElement = yzElement;
    }

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public Integer geteIdOne() {
        return eIdOne;
    }

    public void seteIdOne(Integer eIdOne) {
        this.eIdOne = eIdOne;
    }

    public Integer geteIdTwo() {
        return eIdTwo;
    }

    public void seteIdTwo(Integer eIdTwo) {
        this.eIdTwo = eIdTwo;
    }

    public Integer geteIdT() {
        return eIdT;
    }

    public void seteIdT(Integer eIdT) {
        this.eIdT = eIdT;
    }

    @Override
    public String toString() {
        return "YzUserElement{" +
                "uId=" + uId +
                ", eIdOne=" + eIdOne +
                ", eIdTwo=" + eIdTwo +
                ", eIdT=" + eIdT +
                ", yzElement=" + yzElement +
                ", yzUser=" + yzUser +
                '}';
    }
}