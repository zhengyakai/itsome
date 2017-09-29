package com.yakai.blog.controller;

import com.alibaba.fastjson.JSON;
import com.yakai.blog.model.BlogArticle;
import com.yakai.blog.model.BlogArticleIndexVo;
import com.yakai.blog.model.PageBean;
import com.yakai.blog.service.BlogArticleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


@Controller
@RequestMapping("article")
public class BlogArticleController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private BlogArticleService articleService;


    /**
     * 获得文章列表
     * @param model
     * @param currentPage
     * @param currentCount
     * @return
     */
    @RequestMapping(value="articlelist/{currentPage}/{currentCount}",method = RequestMethod.GET)
    public String articlelist(Model model,
                              @PathVariable("currentPage") String currentPage,
                              @PathVariable("currentCount") String currentCount){
        try {
            PageBean<BlogArticleIndexVo> pageBean=articleService.getArticlesByPage(currentPage,currentCount);
            logger.info("IndexPageBean信息:"+ JSON.toJSONString(pageBean));
            model.addAttribute("pageBean",pageBean);
        } catch (Exception e) {
            logger.error("访问/articlelist异常!",e);
            return "error/500";
        }
        return "index";
    }


    /**
     * 文章详情页
     * @param model
     * @param articleId
     * @return
     */
    @RequestMapping(value="/detail/{articleId}",method = RequestMethod.GET)
    public String detail(Model model, @PathVariable("articleId") Integer articleId){
        try {
            logger.info("详情页请求的articleId:"+articleId);
            BlogArticle article = articleService.getArticleById(articleId);
            logger.info("article详情:"+ JSON.toJSONString(article));
            if(article==null){
                return "error/404";
            }
            model.addAttribute("article",article);
        } catch (Exception e) {
            logger.error("根据articleId查询博客文章异常",e);
            return "error/500";
        }
        return "detail";
    }


    /**
     * 关键字搜索
     * @param searchWords
     * @return
     */
    @RequestMapping(value = "search/{searchWords}",method = RequestMethod.POST)
    @ResponseBody
    public List<BlogArticle> search(@PathVariable("searchWords") String searchWords){


        List<BlogArticle> searchArticles = null;
        try {
            logger.info("搜索关键字:"+searchWords);
            if(searchWords==null){
                searchWords="";
            }
            /*searchWords = new String(searchWords.getBytes("ISO-8859-1"),"utf-8");
            logger.info("转码后的搜索关键字:"+searchWords);*/
            searchArticles = articleService.getArticleBySearchWords(searchWords);
        } catch (Exception e) {
            logger.error("根据关键字搜索异常:",e);
        }
        return searchArticles;
    }
}
