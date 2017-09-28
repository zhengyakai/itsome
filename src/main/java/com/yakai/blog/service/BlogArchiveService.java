package com.yakai.blog.service;

import com.yakai.blog.model.BlogArchiveVo;
import com.yakai.blog.model.BlogArticle;
import com.yakai.blog.model.PageBean;

import java.util.List;

/**
 * @Auther: ZhengYakai
 * @Description:
 * @Date: Create in 09:33 2017/09/28
 * @Modify:
 */
public interface BlogArchiveService {
    PageBean<BlogArticle> getArticlesByPageDate(String currentPage, String currentCount, String dateStr);

    List<BlogArchiveVo> getDateList();
}
