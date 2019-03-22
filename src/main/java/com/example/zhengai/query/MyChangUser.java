package com.example.zhengai.query;

public class MyChangUser {


    private String name;

    private Boolean select =false;

    private String position;

    private Integer id;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Boolean getSelect() {
        return select;
    }

    public void setSelect(Boolean select) {
        this.select = select;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "MyChangUser{" +
                "name='" + name + '\'' +
                ", select=" + select +
                ", position='" + position + '\'' +
                ", id=" + id +
                '}';
    }
}
