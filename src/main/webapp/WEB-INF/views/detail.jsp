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
            <h3 class="panel-title">
                ${article.title}&nbsp;&nbsp;&nbsp;&nbsp;
                <fmt:formatDate value="${article.createTime}" pattern="yyyy/MM/dd"/>
            </h3>
        </div>
        <div class="panel-body" id="content-body">
            <span id="article-content">
                ${article.content}
            </span>
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
        //var $p = $("#article-content").find("p");
        //alert($p.length)
        $("p").css("font-size","18px");
        $("li").css("font-size","18px");
        $("pre").css("font-size","18px");
        $("#content-body span").css("font-size","18px");
        //$("span:not(.glyphicon-upload)").css("font-size","18px");
        $("#content-body img").each(function () {
            $(this).css("width","50%");
        })
    })

</script>
</body>
</html>