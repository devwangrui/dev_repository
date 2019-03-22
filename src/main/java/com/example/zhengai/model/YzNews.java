package com.example.zhengai.model;

public class YzNews {
    private Integer newsId;

    private String newsTitle;

    private String newsDate;

    private Integer userId;

    private Integer delCode;

    private String newsContent;

    public Integer getNewsId() {
        return newsId;
    }

    public void setNewsId(Integer newsId) {
        this.newsId = newsId;
    }

    public String getNewsTitle() {
        return newsTitle;
    }

    public void setNewsTitle(String newsTitle) {
        this.newsTitle = newsTitle;
    }

    public String getNewsDate() {
        return newsDate;
    }

    public void setNewsDate(String newsDate) {
        this.newsDate = newsDate;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getDelCode() {
        return delCode;
    }

    public void setDelCode(Integer delCode) {
        this.delCode = delCode;
    }

    public String getNewsContent() {
        return newsContent;
    }

    public void setNewsContent(String newsContent) {
        this.newsContent = newsContent;
    }

    @Override
    public String toString() {
        return "YzNews{" +
                "newsId=" + newsId +
                ", newsTitle='" + newsTitle + '\'' +
                ", newsDate='" + newsDate + '\'' +
                ", userId=" + userId +
                ", delCode=" + delCode +
                ", newsContent='" + newsContent + '\'' +
                '}';
    }
}