package com.yakai.blog.dao;

import com.yakai.blog.model.BlogType;
import com.yakai.blog.model.BlogTypeExample;
import java.util.List;

public interface BlogTypeMapper {
    int deleteByPrimaryKey(Integer typeId);

    int insert(BlogType record);

    int insertSelective(BlogType record);

    List<BlogType> selectByExample(BlogTypeExample example);

    BlogType selectByPrimaryKey(Integer typeId);

    int updateByPrimaryKeySelective(BlogType record);

    int updateByPrimaryKey(BlogType record);

    List<BlogType> getAllTypesAndCount();
}