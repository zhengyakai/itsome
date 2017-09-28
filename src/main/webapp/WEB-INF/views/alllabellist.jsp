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
    <title>LabelList</title>
</head>
<body>
<div class="container-fluid">
    <div class="container-fluid">
        <div class="col-lg-3">
            <div class="mylabel" style="float: right;width: auto">
                <span class="glyphicon glyphicon-folder-open myspan"> LabelList</span>
            </div>
        </div>
        <div class="col-lg-9">
            <c:forEach var="labelVo" items="${voPageBean.pageList}">
                <div class="mylabel animated fadeInDown">
                    <a href="${path}/label/articlesBylabel/${labelVo.label}">
                        <span class="myspan">${labelVo.label}</span>
                    </a>
                    <sup class="mysup">${labelVo.labelCount}</sup>
                </div>
            </c:forEach>
        </div>
    </div>


    <div class="container-fluid">
        <div class="col-lg-3"></div>
        <div class="col-lg-9" style="text-align: center">
            <%@include file="page/labellist_all.jsp"%>
        </div>
    </div>
    <%@include file="common/foot.jsp"%>
</div>
</body>
</html>
