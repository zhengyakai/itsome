package com.yakai.blog.model;

public class BlogArchiveVo {

    private String dateStr;
    private String dateCount;
    private Integer articleId;


    public Integer getArticleId() {
        return articleId;
    }

    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    public String getDateStr() {
        return dateStr;
    }

    public void setDateStr(String dateStr) {
        this.dateStr = dateStr;
    }

    public String getDateCount() {
        return dateCount;
    }

    public void setDateCount(String dateCount) {
        this.dateCount = dateCount;
    }
}
