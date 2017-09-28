package com.yakai.blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class BlogPageController {


    /**
     * 首页
     * @return 请求文章列表页
     */
    @RequestMapping({"/","/index"})
    public String index(){
        return "forward:/article/articlelist/1/9";
    }

    /**
     * 导航页
     * @param pageName
     * @return
     */
    @RequestMapping("/toPage/{pageName}")
    public String toPage(@PathVariable("pageName") String pageName){
        return pageName;
    }
}
