package com.yakai.blog.service;

import com.yakai.blog.model.BlogArticleVo;
import com.yakai.blog.model.BlogLabelVo;
import com.yakai.blog.model.PageBean;

import java.util.List;

/**
 * @Auther: ZhengYakai
 * @Description:
 * @Date: Create in 15:25 2017/09/27
 * @Modify:
 */
public interface BlogLabelService {
    List<BlogLabelVo> getAllLabels(String currentPage, String currentCount);

    PageBean<BlogArticleVo> getTypeListBylabel(String currentPage, String currentCount, String labelName);

    PageBean<BlogLabelVo> getLabelsByPage(String currentPage, String currentCount);

    PageBean<BlogArticleVo> getBlogArticleVosByPage(String currentPage, String currentCount, String labelName);
}
