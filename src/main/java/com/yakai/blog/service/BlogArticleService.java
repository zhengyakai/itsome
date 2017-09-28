package com.yakai.blog.service;

import com.yakai.blog.model.BlogArticle;
import com.yakai.blog.model.BlogArticleIndexVo;
import com.yakai.blog.model.PageBean;

import java.util.List;

public interface BlogArticleService {
    PageBean<BlogArticleIndexVo> getArticlesByPage(String currentPage, String currentCount);

    BlogArticle getArticleById(Integer articleId);

    List<BlogArticle> getArticleBySearchWords(String searchWords);
}
