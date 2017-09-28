<%--
  Created by IntelliJ IDEA.
  User: 郑亚凯
  Date: 2017/08/16
  Time: 18:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/top.jsp"%>
<html>
<head>
    <title>Link</title>
    <style>
        p{
            text-indent: 2em
        }
        li{
            font-size: 18px;
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="col-lg-1"></div>
        <div class="col-lg-8 animated fadeInLeft" style="margin-top: 50px">
            <h2 style="font-weight: 700">友情链接</h2>
            <hr style="background-color: #4183C4;border: none;height: 2px" >
            <ul>
                <li>
                    <a href="http://itmuch.com/" target="_blank">周立Spring Cloud</a> - 在这里学习Spring Cloud
                </li>
                <li>
                    <a href="http://blog.didispace.com/" target="_blank">程序员DD翟永超</a> - 慕课网Spring Boot讲师
                </li>
                <li>
                    <a href="http://www.bysocket.com/" target="_blank">泥瓦匠BySocket</a> - 技术大牛
                </li>
                <li>
                    <a>梁桂钊的博客</a> - 后端攻城狮
                </li>
                <li>
                    <a>cmsblogs</a> - chenssy记录、分享JAVA技术
                </li>
                <li>
                    <a>韩威博客</a> - 韩威java知识分享网
                </li>
                <li>
                    <a>小柒博客</a> - 小柒博客，一个主JAVA，次架构，偶尔聊聊生活的地方。
                </li>
                <li>
                    <a>六月</a> - 一个博友的博客
                </li>
                <li>
                    <a>荒蛮故事</a> - 一个分享故事的网站
                </li>
            </ul>

            <h2 style="font-weight: 700">推荐网站</h2>
            <hr style="background-color: #4183C4;border: none;height: 2px" >
            <ul>
                <li>
                    <a>云收藏</a> - 云收藏，让收藏更简单。一个在线云端的网络收藏夹，可以分享和查看其它人分享
                </li>
                <li>
                    <a>wherebt</a> - 提供各种BT资源导航,主要收录了bt sync keys的分享网站
                </li>
                <li>
                    <a>公众号编辑器</a> - 可以以优雅的方式在微信公众号去发布markdown文章
                </li>
            </ul>
            <h2 style="font-weight: 700">个人链接</h2>
            <hr style="background-color: #4183C4;border: none;height: 2px" >
            <ul>
                <li>
                    <a href="${path }/index">Schrodinger's dog</a> - 个人独立博客
                </li>
                <li>
                    <a>GitHub</a> - 我的代码
                </li>
                <li>
                    <a>CSDN</a> - 最开始写博客的地方
                </li>
                <li>
                    <a>微博</a> - 个人微博,几乎不用
                </li>
            </ul>

            <h2 style="font-weight: 700">其他</h2>
            <hr style="background-color: #4183C4;border: none;height: 2px" >
            <p style="font-size: 16px"><i>欢迎交换友情链接，最好同样是技术类的博客，需要交换友链的朋友请发送邮件到：<a href="mailto:yakai512@163.com">yakai512@163.com</a>，或者在本页留言。格式要求如下：</i></p>
            <ul>
                <li>
                    网站名称：Schrodinger's dog
                </li>
                <li>
                    网站链接：http://www.ithuskie.com/
                </li>
                <li>
                    网站描述：xxx的个人博客，分享技术，分享生活
                </li>
            </ul>
            <div style="text-align: center">
                <img src="http://yakai.oss-cn-beijing.aliyuncs.com/blog_img/gongzhong.jpg" style="height: 250px">
                <br><br>
                <span style="font-size: 16px">扫码关注 : 薛定谔的汪</span>
                <br><br>
                <span style="font-size: 13px">（<span style="color: red;font-weight: 700">转载本站文章请注明作者和出处</span>
                    <span style="color: #337AB7;font-weight: 700">薛定谔的汪-Schrodinger's dog</span>）</span>
            </div>
            <br><br>
        </div>
        <div class="col-lg-3">
            <%@include file="index_right.jsp"%>
        </div>
        <%@include file="common/foot.jsp"%>
    </div>
</body>
</html>
