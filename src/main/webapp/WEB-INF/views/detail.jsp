<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/top.jsp"%>
<html>
<head>
    <title>${article.title}</title>
</head>
<body>

<div class="container-fluid animated fadeIn" style="margin-top: 25px;margin-bottom: 0px">
    <div class="col-lg-1"></div>
    <div class="panel panel-info col-lg-8">
        <div class="panel-heading">
            <h3 class="panel-title">${article.title}</h3>
        </div>
        <div class="panel-body" id="content-body">
            <span>${article.content}</span>
        </div>
    </div>
    <div class="col-lg-3">
        <%@include file="index_right.jsp"%>
    </div>
</div>
<div class="container-fluid" style="margin-top: 0px">
    <%@include file="common/foot.jsp"%>
</div>
<script>
    $(function () {
        $("#content-body img").each(function () {
            $(this).css("width","100%");
        })
    })

</script>
</body>
</html>