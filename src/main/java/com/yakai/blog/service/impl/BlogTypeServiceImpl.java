package com.yakai.blog.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yakai.blog.dao.BlogArticleMapper;
import com.yakai.blog.dao.BlogTypeMapper;
import com.yakai.blog.model.BlogArticleVo;
import com.yakai.blog.model.BlogType;
import com.yakai.blog.model.PageBean;
import com.yakai.blog.service.BlogTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BlogTypeServiceImpl implements BlogTypeService {

    @Autowired
    private BlogTypeMapper typeMapper;
    @Autowired
    private BlogArticleMapper blogArticleMapper;


    @Override
    public List<BlogType> getAllTypes() {
        List<BlogType> types = typeMapper.getAllTypesAndCount();
        return types;
    }

    @Override
    public String getTypeNameById(Integer typeId) {
        BlogType blogType = typeMapper.selectByPrimaryKey(typeId);
        String typeName = blogType.getTypeName();
        return typeName;
    }

    @Override
    public PageBean<BlogArticleVo> getBlogArticleVosByPage(String currentPage, String currentCount, Integer typeId) {

        int pageSize = Integer.parseInt(currentCount);
        PageHelper.startPage(Integer.parseInt(currentPage), pageSize);
        PageBean<BlogArticleVo> pageBean = new PageBean<>();
        pageBean.setCurrentCount(Integer.valueOf(currentCount));
        pageBean.setCurrentPage(Integer.parseInt(currentPage));
        List<BlogArticleVo> list = blogArticleMapper.getArticlesByTypeId(typeId);
        pageBean.setPageList(list);
        //设置返回的总记录数
        PageInfo<BlogArticleVo> pageInfo=new PageInfo<>(list);
        Long total = pageInfo.getTotal();
        pageBean.setTotalCount(total.intValue());
        int totalPage = (total.intValue()  +  pageSize  - 1) / pageSize;
        pageBean.setTotalPage(totalPage);
        return pageBean;
    }
}
