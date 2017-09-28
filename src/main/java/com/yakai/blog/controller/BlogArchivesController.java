package com.yakai.blog.controller;

import com.alibaba.fastjson.JSON;
import com.yakai.blog.model.BlogArchiveVo;
import com.yakai.blog.model.BlogArticle;
import com.yakai.blog.model.PageBean;
import com.yakai.blog.service.BlogArchiveService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * @Auther: ZhengYakai
 * @Description:
 * @Date: Create in 09:30 2017/09/28
 * @Modify:
 */
@Controller
@RequestMapping("archives")
public class BlogArchivesController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private BlogArchiveService archiveService;

    /**
     * archives列表 按时间
     * @param model
     * @param currentPage
     * @param currentCount
     * @return
     */
    @RequestMapping("{dateStr}")
    public String archives(Model model, @RequestParam(defaultValue = "1") String currentPage,
                           @RequestParam(value = "rows",defaultValue = "9") String currentCount,
                           @PathVariable("dateStr") String dateStr){

        logger.info("-----------------请求Archives开始------------------");
        try {
            PageBean<BlogArticle> pageBean=archiveService.getArticlesByPageDate(currentPage,currentCount,dateStr);
            List<BlogArticle> pageList = pageBean.getPageList();
            if(pageList==null || pageList.size()==0){
                return "error/404";
            }
            logger.info("请求Archives查询到的pageBean:"+ JSON.toJSONString(pageBean));
            List<BlogArchiveVo> archiveVos = archiveService.getDateList();
            logger.info("请求Archives查询到的BlogArchiveVo集合:"+JSON.toJSONString(archiveVos));
            model.addAttribute("dateStr",dateStr);
            model.addAttribute("archiveVos",archiveVos);
            model.addAttribute("pageBean",pageBean);
        } catch (Exception e) {
            logger.error("请求Archives异常:",e);
            return "error/500";
        }
        logger.info("-----------------请求Archives结束-------------------");
        return "archives";
    }
}
