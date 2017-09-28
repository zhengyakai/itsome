package com.yakai.blog.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yakai.blog.dao.BlogArticleMapper;
import com.yakai.blog.model.BlogArticleVo;
import com.yakai.blog.model.BlogLabelVo;
import com.yakai.blog.model.PageBean;
import com.yakai.blog.service.BlogLabelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Auther: ZhengYakai
 * @Description:
 * @Date: Create in 15:25 2017/09/27
 * @Modify:
 */
@Service
public class BlogLabelServiceImpl implements BlogLabelService{

    @Autowired
    private BlogArticleMapper blogArticleMapper;
    /**
     * 获得所有的标签名和数目
     * @param currentPage
     * @param currentCount
     * @return
     */
    @Override
    public List<BlogLabelVo> getAllLabels(String currentPage, String currentCount) {
        int pageSize = Integer.parseInt(currentCount);
        PageHelper.startPage(Integer.parseInt(currentPage), pageSize);
        List<BlogLabelVo> vos = blogArticleMapper.getAllLabels();
        return vos;
    }

    /**
     * 通过标签名获得
     * @param currentPage
     * @param currentCount
     * @param labelName
     * @return
     */
    @Override
    public PageBean<BlogArticleVo> getTypeListBylabel(String currentPage, String currentCount, String labelName) {

        int pageSize = Integer.parseInt(currentCount);
        PageHelper.startPage(Integer.parseInt(currentPage), pageSize);
        PageBean<BlogArticleVo> pageBean = new PageBean<>();
        pageBean.setCurrentCount(Integer.valueOf(currentCount));
        pageBean.setCurrentPage(Integer.parseInt(currentPage));
        List<BlogArticleVo> list = blogArticleMapper.getArticlesByLabelName(labelName);
        pageBean.setPageList(list);
        //设置返回的总记录数
        PageInfo<BlogArticleVo> pageInfo = new PageInfo<>(list);
        Long total = pageInfo.getTotal();
        pageBean.setTotalCount(total.intValue());
        int totalPage = (total.intValue() + pageSize - 1) / pageSize;
        pageBean.setTotalPage(totalPage);
        return pageBean;
    }

    @Override
    public PageBean<BlogLabelVo> getLabelsByPage(String currentPage, String currentCount) {
        int pageSize = Integer.parseInt(currentCount);
        PageHelper.startPage(Integer.parseInt(currentPage), pageSize);
        PageBean<BlogLabelVo> pageBean = new PageBean<>();
        pageBean.setCurrentCount(Integer.valueOf(currentCount));
        pageBean.setCurrentPage(Integer.parseInt(currentPage));
        List<BlogLabelVo> list = blogArticleMapper.getAllLabels();
        pageBean.setPageList(list);
        //设置返回的总记录数
        PageInfo<BlogLabelVo> pageInfo=new PageInfo<>(list);
        Long total = pageInfo.getTotal();
        pageBean.setTotalCount(total.intValue());
        int totalPage = (total.intValue()  +  pageSize  - 1) / pageSize;
        pageBean.setTotalPage(totalPage);
        return pageBean;
    }

    @Override
    public PageBean<BlogArticleVo> getBlogArticleVosByPage(String currentPage, String currentCount, String labelName) {

        int pageSize = Integer.parseInt(currentCount);
        PageHelper.startPage(Integer.parseInt(currentPage), pageSize);
        PageBean<BlogArticleVo> pageBean = new PageBean<>();
        pageBean.setCurrentCount(Integer.valueOf(currentCount));
        pageBean.setCurrentPage(Integer.parseInt(currentPage));
        List<BlogArticleVo> list = blogArticleMapper.getArticlesByLabelName(labelName);
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
