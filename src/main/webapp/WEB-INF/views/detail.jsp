<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="common/top.jsp"%>
<html>
<head>
    <title>${article.title}</title>
    <style>
        pre {
            box-sizing: border-box;
            /*以下样式是自动换行代码*/
            white-space: pre-wrap; /* css-3 */
            white-space: -moz-pre-wrap; /* Mozilla, since 1999 */
            white-space: -pre-wrap; /* Opera 4-6 */
            white-space: -o-pre-wrap; /* Opera 7 */
            word-wrap: break-word; /* Internet Explorer 5.5+ */
            /*以上样式是自动换行代码，需要的加上，不需要的删除*/

            background: #d9edf7;  /*背景颜色*/
            padding: 0.75em 0.75em; /*内部文字距离边框的距离*/
            margin: 1em 3em 1em 0em; /*边框上右下左的缩进*/
            font-size:.8em; /*字体大小*/
            border-style:dotted dotted dotted solid;/*边框样式*/
            border-width:1px 1px 1px 5px;/*边框宽度*/
            border-color:#5bbcdd;/*边框颜色*/
            line-height:200% /*行间距*/
        }
    </style>
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
        $("#content-body img").each(function () {
            $(this).css("width","50%");
        });
        //$("#content-body pre").attr("class","preClass");
    })

</script>
</body>
</html>