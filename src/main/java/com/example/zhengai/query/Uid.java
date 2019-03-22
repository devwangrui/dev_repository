package com.example.zhengai.query;

import com.example.zhengai.model.YzUser;

public class Uid {
    private Integer uId;

    private YzUser yzUser;

    public YzUser getYzUser() {
        return yzUser;
    }

    public void setYzUser(YzUser yzUser) {
        this.yzUser = yzUser;
    }

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    @Override
    public String toString() {
        return "Uid{" +
                "uId=" + uId +
                ", yzUser=" + yzUser +
                '}';
    }
}
