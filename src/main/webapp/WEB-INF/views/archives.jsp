<%--
  Created by IntelliJ IDEA.
  User: 郑亚凯
  Date: 2017/08/24
  Time: 12:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/top.jsp"%>
<html>
<head>
    <title>Archives</title>
    <style>
        .aiticleCls{
            background-color: white;
            height: auto;
            margin-top: 25px
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="container-fluid">
        <div class="col-lg-1 col-xs-12"></div>
        <div class="col-lg-8 col-xs-12 aiticleCls">

            <c:forEach items="${pageBean.pageList}" var="article">
                <div class="mytype col-lg-3 col-xs-12 animated fadeInDown">
                    <a href="${path}/article/detail/${article.articleId}">
                    <span class="myspan">
                            ${article.title}
                    </span>
                    </a>
                </div>
            </c:forEach>
        </div>




        <div class="col-lg-2 col-xs-12 aiticleCls animated fadeInDown">
            <div style="text-align: left;margin: 25px 20px">
            <span style="font-size: 25px;font-weight: 500">
                <a>
                    <c:if test="${dateStr eq 'all'}">
                        文章
                    </c:if>
                    <c:if test="${dateStr ne 'all'}">
                        ${dateStr}
                    </c:if>
                </a>
            </span>
                <br><br>

                <c:forEach var="archiveVo" items="${archiveVos}">
                    <div style="margin: 10px auto 0px auto">
                    <span style="font-size: 20px">
                        <a href='${path}/archives/${archiveVo.dateStr}'>${archiveVo.dateStr}</a>(${archiveVo.dateCount})
                    </span>
                    </div>
                </c:forEach>

            </div>
        </div>
        <div class="col-lg-1"></div>
    </div>

    <div class="container-fluid">
        <div class="col-lg-1"></div>
        <div class="col-lg-9">
            <%@include file="page/articlelist_time.jsp"%>
        </div>
        <div class="col-lg-2"></div>
    </div>
    <%@include file="common/foot.jsp"%>
</div>
</body>
</html>
