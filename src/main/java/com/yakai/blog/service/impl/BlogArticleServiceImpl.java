package com.yakai.blog.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yakai.blog.dao.BlogArticleMapper;
import com.yakai.blog.model.BlogArticle;
import com.yakai.blog.model.BlogArticleExample;
import com.yakai.blog.model.BlogArticleIndexVo;
import com.yakai.blog.model.PageBean;
import com.yakai.blog.service.BlogArticleService;
import com.yakai.blog.service.RedisUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BlogArticleServiceImpl implements BlogArticleService {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private BlogArticleMapper blogArticleMapper;
    @Autowired
    private RedisUtils redisUtils;
    /**
     * 获得首页数据并分页
     * @param currentPage
     * @param currentCount
     * @return
     */
    @Override
    public PageBean<BlogArticleIndexVo> getArticlesByPage(String currentPage, String currentCount) {

        int pageSize = Integer.parseInt(currentCount);
        PageHelper.startPage(Integer.parseInt(currentPage), pageSize);
        //example.setOrderByClause("create_time desc");
        List<BlogArticleIndexVo> list = blogArticleMapper.getArticleIndexVos();

        PageBean<BlogArticleIndexVo> pageBean = new PageBean<>();
        pageBean.setCurrentCount(Integer.valueOf(currentCount));
        pageBean.setCurrentPage(Integer.parseInt(currentPage));
        pageBean.setPageList(list);
        //设置返回的总记录数
        PageInfo<BlogArticleIndexVo> pageInfo=new PageInfo<>(list);
        Long total = pageInfo.getTotal();
        pageBean.setTotalCount(total.intValue());
        int totalPage = (total.intValue()  +  pageSize  - 1) / pageSize;
        pageBean.setTotalPage(totalPage);
        return pageBean;
    }

    /**
     * 文章详情页
     * @param articleId
     * @return
     */
    @Override
    public BlogArticle getArticleById(Integer articleId) {

        String detailKey=String.valueOf(articleId);

        BlogArticle blogArticle = null;
        String detailJson = null;
        try {
            detailJson = this.redisUtils.get(detailKey);
            if(StringUtils.isNotBlank(detailJson)){
                blogArticle = JSONObject.parseObject(detailJson, BlogArticle.class);
                logger.info("从redis中获得的blogArticle详情"+detailJson);
            }else{
                blogArticle = blogArticleMapper.selectByPrimaryKey(articleId);
                detailJson = JSONObject.toJSONString(blogArticle);
                this.redisUtils.set(detailKey,detailJson,300);
            }
        }catch (Exception e){
            logger.info("从redis中获得blogArticle详情异常!",e);
        }
        return blogArticle;
    }

    /**
     * 根据关键字搜索文章
     * @param searchWords
     * @return
     */
    @Override
    public List<BlogArticle> getArticleBySearchWords(String searchWords) {
        BlogArticleExample example = new BlogArticleExample();
        example.createCriteria().andTitleLike("%"+searchWords+"%");
        List<BlogArticle> articles = blogArticleMapper.selectByExample(example);
        return articles;
    }

}
