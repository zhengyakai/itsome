package com.yakai.blog.controller;

import com.alibaba.fastjson.JSON;
import com.yakai.blog.model.BlogArticleVo;
import com.yakai.blog.model.BlogLabelVo;
import com.yakai.blog.model.PageBean;
import com.yakai.blog.service.BlogLabelService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @Auther: ZhengYakai
 * @Description:
 * @Date: Create in 15:23 2017/09/27
 * @Modify:
 */
@Controller
@RequestMapping("label")
public class BlogLabelController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private BlogLabelService blogLabelService;



    /**
     * 获得所有标签,返回json
     * @param currentPage
     * @param currentCount
     * @return
     */
    @RequestMapping("getAllLabels")
    @ResponseBody
    public List<BlogLabelVo> getAllLabels(@RequestParam(defaultValue = "1") String currentPage,
                                          @RequestParam(value = "rows",defaultValue = "10") String currentCount){
        List<BlogLabelVo> vos= null;
        try {
            vos = blogLabelService.getAllLabels(currentPage,currentCount);
            logger.info("List<BlogLabelVo> vos:"+ JSON.toJSONString(vos));
        } catch (Exception e) {
            logger.error("访问/getAllLabels异常:",e);
        }
        return vos;
    }

    /**
     * 通过标签名获得所有的文章
     * @param model
     * @param currentPage
     * @param currentCount
     * @param labelName
     * @return
     */
    @RequestMapping("articlesBylabel/{labelName}")
    public String getTypeListBylabel(Model model, @RequestParam(defaultValue = "1") String currentPage, @RequestParam(value = "rows",defaultValue = "9") String currentCount, @PathVariable("labelName") String labelName){
        try {
            logger.info("传递的标签名是:"+labelName);
            PageBean<BlogArticleVo> voPageBean = blogLabelService.getTypeListBylabel(currentPage,currentCount,labelName);
            List<BlogArticleVo> pageList = voPageBean.getPageList();
            logger.info(JSON.toJSONString(pageList));
            if(pageList==null || pageList.size()==0){
                return "error/404";
            }
            model.addAttribute("voPageBean",voPageBean);
            model.addAttribute("labelName",labelName);
        } catch (Exception e) {
            logger.error("访问articlesBylabel异常:",e);
            return "error/500";
        }
        return "typelist";
    }

    /**
     *所有标签列表页
     * @param model
     * @param currentPage
     * @param currentCount
     * @return
     */
    @RequestMapping("alllabellist/{currentPage}/{currentCount}")
    public String labelList(Model model,
                            @PathVariable("currentPage") String currentPage,
                            @PathVariable("currentCount") String currentCount){
        try {
            PageBean<BlogLabelVo> voPageBean = blogLabelService.getLabelsByPage(currentPage,currentCount);
            logger.info("访问alllabellist查询到的voPageBean:"+ JSON.toJSONString(voPageBean));
            model.addAttribute("voPageBean",voPageBean);
            //int a=1/0; //测试异常
        } catch (Exception e) {
            logger.error("访问alllabellist异常");
            return "error/500";
        }
        return "alllabellist";
    }


    /**
     * 根据标签名显示所有文章列表
     * @param model
     * @param currentPage
     * @param currentCount
     * @param labelName
     * @return
     */
    @RequestMapping("labellist/{labelName}/{currentPage}/{currentCount}")
    public String typelist(Model model,
                           @PathVariable("labelName") String labelName,
                           @PathVariable("currentPage") String currentPage,
                           @PathVariable("currentCount") String currentCount){
        try {
            PageBean<BlogArticleVo> voPageBean = blogLabelService.getBlogArticleVosByPage(currentPage,currentCount,labelName);
            List<BlogArticleVo> pageList = voPageBean.getPageList();
            if(pageList==null || pageList.size()==0){
                return "error/404";
            }
            model.addAttribute("voPageBean",voPageBean);
            //String typeName =blogTypeService.getTypeNameById(typeId);
            model.addAttribute("labelName",labelName);
        } catch (Exception e) {
            logger.error("访问typelist,根据类型查询所有文章异常!",e);
            return "error/500";
        }
        return "typelist";
    }

}
