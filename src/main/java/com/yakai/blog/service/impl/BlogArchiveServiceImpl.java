package com.yakai.blog.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yakai.blog.dao.BlogArticleMapper;
import com.yakai.blog.model.BlogArchiveVo;
import com.yakai.blog.model.BlogArticle;
import com.yakai.blog.model.BlogArticleExample;
import com.yakai.blog.model.PageBean;
import com.yakai.blog.service.BlogArchiveService;
import com.yakai.blog.service.RedisUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Auther: ZhengYakai
 * @Description:
 * @Date: Create in 09:33 2017/09/28
 * @Modify:
 */
@Service
public class BlogArchiveServiceImpl implements BlogArchiveService{
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private BlogArticleMapper blogArticleMapper;
    @Autowired
    private RedisUtils redisUtils;

    /*@Value("${archivesKey}")
    private String archivesKey;*/
    public PageBean<BlogArticle> getArticlesByPageDate(String currentPage, String currentCount, String dateStr) {
        String archivesKey="archivesKey_"+dateStr+"_"+currentPage;
        logger.info("archivesKey:"+archivesKey);

        String pageBeanJson =  null;
        try {
            pageBeanJson=this.redisUtils.get(archivesKey);
            //判断是否为空 不为空直接返回
            if(StringUtils.isNotBlank(pageBeanJson)){
                PageBean<BlogArticle> pageBean = JSONObject.parseObject(pageBeanJson, PageBean.class);
                logger.info("从redis中取得的archivesPageBean:"+pageBeanJson);
                //PageBean<BlogArticle> pageBean  = (PageBean<BlogArticle>) JSON.parse(pageBeanJson);
                return pageBean;
            }
        } catch (Exception e) {
            logger.info("从redis中获得archivesPageBean异常!",e);
        }
        //为空的话 去数据库命中,然后放到redis中
        int pageSize = Integer.parseInt(currentCount);
        PageHelper.startPage(Integer.parseInt(currentPage), pageSize);
        List<BlogArticle> list = null;
        if(StringUtils.isBlank(dateStr)||"all".equals(dateStr)){
            BlogArticleExample example = new BlogArticleExample();
            example.setOrderByClause("create_time desc");
            example.createCriteria();
            list = blogArticleMapper.selectByExample(example);
        }else{
            list = blogArticleMapper.getArticlesByDate(dateStr);
        }
        PageBean<BlogArticle> pageBean = new PageBean<>();
        pageBean.setCurrentCount(Integer.valueOf(currentCount));
        pageBean.setCurrentPage(Integer.parseInt(currentPage));
        pageBean.setPageList(list);
        //设置返回的总记录数
        PageInfo<BlogArticle> pageInfo=new PageInfo<>(list);
        Long total = pageInfo.getTotal();
        pageBean.setTotalCount(total.intValue());
        int totalPage = (total.intValue()  +  pageSize  - 1) / pageSize;
        pageBean.setTotalPage(totalPage);
        try {
            pageBeanJson = JSON.toJSONString(pageBean);
            this.redisUtils.set(archivesKey,pageBeanJson,300);
        } catch (Exception e) {
            logger.error("archivesPageBean存入redis异常!",e);
        }
        return pageBean;
    }

    @Override
    public List<BlogArchiveVo> getDateList() {
        List<BlogArchiveVo> dateList=blogArticleMapper.getDateList();
        return dateList;
    }
}
