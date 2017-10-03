package com.yakai.blog.dao;

import com.yakai.blog.model.*;

import java.util.List;

public interface BlogArticleMapper {
    int deleteByPrimaryKey(Integer articleId);

    int insert(BlogArticle record);

    int insertSelective(BlogArticle record);

    List<BlogArticle> selectByExampleWithBLOBs(BlogArticleExample example);

    List<BlogArticle> selectByExample(BlogArticleExample example);

    BlogArticle selectByPrimaryKey(Integer articleId);

    int updateByPrimaryKeySelective(BlogArticle record);

    int updateByPrimaryKeyWithBLOBs(BlogArticle record);

    int updateByPrimaryKey(BlogArticle record);

    List<BlogArticleIndexVo> getArticleIndexVos();

    List<BlogLabelVo> getAllLabels();

    List<BlogArticleVo> getArticlesByLabelName(String labelName);

    List<BlogArticleVo> getArticlesByTypeId(Integer typeId);

    List<BlogArchiveVo> getDateList();

    List<BlogArticle> getArticlesByDate(String dateStr);

    //List<BlogArticle> selectLikeType(String );
}