package com.example.zhengai.model;

public class YzTargetViewGlKey {
    private Integer vId;

    private Integer tId;

    public Integer getvId() {
        return vId;
    }

    public void setvId(Integer vId) {
        this.vId = vId;
    }

    public Integer gettId() {
        return tId;
    }

    public void settId(Integer tId) {
        this.tId = tId;
    }

    @Override
    public String toString() {
        return "YzTargetViewGlKey{" +
                "vId=" + vId +
                ", tId=" + tId +
                '}';
    }
}