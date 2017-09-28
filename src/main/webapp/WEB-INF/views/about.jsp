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
    <title>About Me</title>
    <style>
        p{
            text-indent: 2em
        }
    </style>
</head>
<body style="padding: 0px">
    <div class="container-fluid animated fadeIn">
        <div class="col-lg-1"></div>
        <div class="col-lg-8" style="margin-top: 25px">
            <h2>About Me</h2>
            <p>一位奋斗在帝国都的小码农，Java攻城狮出身，XXXXXXXXX...（ID：XXXXXXXX），欢迎关注~</p>
            <p>
                热爱编码、热爱开源、热爱户外、热爱生活
            </p>
            <p>
                我喜欢这样一句话来代表对技术的热情：“我的代码曾运行在几千万用户的机器上，作为一个程序员，还有什么比这更让人满足的呢？如果有，那就是让这个用户数量再扩大 10 倍。”
            </p>
        </div>
        <div class="col-lg-3" style="margin-top: 25px">
            <%@include file="index_right.jsp"%>
        </div>
        <%@include file="common/foot.jsp"%>
    </div>
</body>
</html>
