package com.yakai.blog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class BlogPageController {


    /**
     * 首页
     * @return 请求文章列表页
     */
    @RequestMapping(value = {"/","/index"},method = RequestMethod.GET)
    public String index(){
        return "forward:/article/articlelist/1/9";
    }

    /**
     * 导航页
     * @param pageName
     * @return
     */
    @RequestMapping(value = "/toPage/{pageName}",method = RequestMethod.GET)
    public String toPage(@PathVariable("pageName") String pageName){
        return pageName;
    }
}
