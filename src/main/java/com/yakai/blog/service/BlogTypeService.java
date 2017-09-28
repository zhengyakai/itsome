package com.yakai.blog.service;

import com.yakai.blog.model.BlogArticleVo;
import com.yakai.blog.model.BlogType;
import com.yakai.blog.model.PageBean;

import java.util.List;

public interface BlogTypeService {
    List<BlogType> getAllTypes();

    String getTypeNameById(Integer typeId);

    PageBean<BlogArticleVo> getBlogArticleVosByPage(String currentPage, String currentCount, Integer typeId);
}
