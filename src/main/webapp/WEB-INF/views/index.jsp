<%--
  Created by IntelliJ IDEA.
  User: 郑亚凯
  Date: 2017/8/7
  Time: 14:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/top.jsp"%>
<html>
<head>
    <title>Schrodinger's dog</title>
</head>
<body id="body">
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-1"></div>
        <div class="col-lg-8">
            <%@include file="articlelist.jsp"%>
        </div>
        <div class="col-lg-3" style="margin-top: 25px">
            <%@include file="index_right.jsp"%>
        </div>
    </div>
    <%@include file="common/foot.jsp"%>
</div>
</body>
</html>
