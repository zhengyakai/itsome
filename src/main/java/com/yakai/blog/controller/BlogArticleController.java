package com.yakai.blog.controller;

import com.alibaba.fastjson.JSON;
import com.yakai.blog.model.BlogArticleIndexVo;
import com.yakai.blog.model.BlogLabelVo;
import com.yakai.blog.model.PageBean;
import com.yakai.blog.service.BlogArticleService;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
}
