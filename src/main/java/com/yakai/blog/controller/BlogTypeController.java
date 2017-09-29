package com.yakai.blog.controller;

import com.yakai.blog.model.BlogArticleVo;
import com.yakai.blog.model.BlogType;
import com.yakai.blog.model.PageBean;
import com.yakai.blog.service.BlogTypeService;
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
@RequestMapping("type")
public class BlogTypeController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private BlogTypeService blogTypeService;

    @RequestMapping(value = "getAllTypes",method = RequestMethod.GET)
    @ResponseBody
    public List<BlogType> getAllTypes(){
        List<BlogType> types=null;
        try {
            types = blogTypeService.getAllTypes();
        } catch (Exception e) {
            logger.info("获取所有博客类型失败!");
        }
        return types;
    }

    /**
     * 根据文章类型显示所有文章列表
     * @param model
     * @param currentPage
     * @param currentCount
     * @param typeId
     * @return
     */
    @RequestMapping(value = "typelist/{typeId}/{currentPage}/{currentCount}",method = RequestMethod.GET)
    public String typelist(Model model,
                           @PathVariable("typeId") Integer typeId,
                           @PathVariable("currentPage") String currentPage,
                           @PathVariable("currentCount") String currentCount){
        try {
            PageBean<BlogArticleVo> voPageBean = blogTypeService.getBlogArticleVosByPage(currentPage,currentCount,typeId);
            List<BlogArticleVo> pageList = voPageBean.getPageList();
            if(pageList==null || pageList.size()==0){
                return "error/404";
            }
            model.addAttribute("voPageBean",voPageBean);
            String typeName =blogTypeService.getTypeNameById(typeId);
            model.addAttribute("typeName",typeName);
            model.addAttribute("typeId",typeId);
        } catch (Exception e) {
            logger.error("访问typelist,根据类型查询所有文章异常!",e);
            return "error/500";
        }
        return "typelist";
    }


}