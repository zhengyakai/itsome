<%--
  Created by IntelliJ IDEA.
  User: 郑亚凯
  Date: 2017/08/23
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<link href="${path}/static/bootstrap/css/animate.css" rel="stylesheet"/>
<link href="${path}/static/bootstrap/css/my.css" rel="stylesheet"/>
<style>
    .aiticleCls{
        background-color: white;
        padding: 25px;
        margin-top: 25px;
    }
</style>

<body>
<div class="container-fluid" id="index-article">
<c:forEach var="articleIndexVo" items="${pageBean.pageList}">
    <div class="aiticleCls animated fadeInLeft">
        <article style="margin-bottom: 25px">
            <h2><a  href="${path }/detail/${articleIndexVo.articleId}">${articleIndexVo.title}</a></h2>
            <span class="summary">${articleIndexVo.label}</span><br><br>
            <span class="glyphicon glyphicon-calendar" style="color: #808080;font-size: 20px">
                       <fmt:formatDate value="${articleIndexVo.createTime}" pattern="yyyy/MM/dd"/>
                    </span>
        </article>
    </div>
    <hr>
</c:forEach>
<%@include file="page/articlelist_all.jsp"%>
</div>
</body>
</html>
