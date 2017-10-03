<%--
  Created by IntelliJ IDEA.
  User: 郑亚凯
  Date: 2017/08/23
  Time: 17:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/top.jsp"%>
<html>
<head>
    <title>
        <c:if test="${typeName!=null}">
            ${typeName}
        </c:if>
        <c:if test="${labelName!=null}">
            ${labelName}
        </c:if>
    </title>
</head>
<body>
<div class="container-fluid">
    <div class="container-fluid">
        <div class="col-lg-3 col-xs-12">
            <div class="mytype" style="float: right;">
            <span class="glyphicon glyphicon-folder-open myspan">
                <c:if test="${typeName!=null}">
                    ${typeName}
                </c:if>
                 <c:if test="${labelName!=null}">
                     ${labelName}
                 </c:if>
            </span>
            </div>
        </div>
        <div class="col-lg-9">
            <c:forEach var="articlesVo" items="${voPageBean.pageList}">
                <div class="mytype col-lg-3 col-xs-12 animated fadeInDown">
                    <a href="${path}/article/detail/${articlesVo.articleId}">
                    <span class="myspan">
                            ${articlesVo.title}
                    </span>
                        <%--<h5><fmt:formatDate value="${articlesVo.createTime}" pattern="yyyy/MM/dd"/></h5>--%>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>

    <div class="container-fluid">
        <div class="col-lg-3"></div>
        <div class="col-lg-9" style="text-align: center">
            <c:if test="${typeName!=null}">
                <%@include file="page/articlelist_type.jsp"%>
            </c:if>
            <c:if test="${labelName!=null}">
                <%@include file="page/articlelist_label.jsp"%>
            </c:if>
        </div>
    </div>
    <%@include file="common/foot.jsp"%>
</div>
</body>
<script>
    $(function () {
        $(".mytype").slideDown(1500);
    })
</script>
</html>
