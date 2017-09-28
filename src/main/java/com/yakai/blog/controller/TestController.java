package com.yakai.blog.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.File;

@Controller
public class TestController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @RequestMapping("test")
    @ResponseBody
    public String test(){
        File file = new File("/rmsfs/ygqdbank/changshu/resolveFiles/pending/a.txt");
        if(file.exists()){
            logger.info("a.txt文件存在");
            return "ok";
        }else{
            logger.info("a.txt文件不存在");
            return "error";
        }
    }
    @RequestMapping("testTop")
    public String testTop(){
        return "common/top";
    }
}
