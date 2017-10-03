package com.yakai.blog.model;

import java.util.Date;

public class BlogArticle {
    private Integer articleId;

    private String title;

    private Integer type;

    private String label;

    private Date createTime;

    private Date modifyTime;

    private String content;

    public Integer getArticleId() {
        return articleId;
    }

    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label == null ? null : label.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(Date modifyTime) {
        this.modifyTime = modifyTime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    @Override
    public boolean equals(Object obj) {
        if(obj instanceof BlogArticle){
            BlogArticle blogArticle = (BlogArticle) obj;
            return (articleId.equals(blogArticle.articleId));
        }
        return super.equals(obj);
    }

    @Override
    public int hashCode() {
        return articleId.hashCode();
    }

}