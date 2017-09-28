package com.yakai.blog.model;

import java.util.Date;

/**
 * @Auther: ZhengYakai
 * @Description:
 * @Date: Create in 14:15 2017/09/27
 * @Modify:
 */
public class BlogArticleIndexVo {

    private Integer articleId;

    private String title;

    private String label;

    private Date createTime;

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
        this.title = title;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
