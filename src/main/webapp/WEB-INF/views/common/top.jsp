<%--
  Created by IntelliJ IDEA.
  User: 郑亚凯
  Date: 2017/8/7
  Time: 14:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="http://yakai.oss-cn-beijing.aliyuncs.com/blog_img/favicon.ico"/>
    <link href="${path}/static/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${path}/static/bootstrap/css/my.css" rel="stylesheet"/>
    <link href="${path}/static/bootstrap/css/animate.css" rel="stylesheet"/>
    <script type="text/javascript" src="${path}/static/js/jquery-3.1.1.js"></script>
    <script type="text/javascript" src="${path}/static/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${path}/static/js/my.js"></script>
    <style>
        #x:hover{
            text-decoration: none;
        }
        .rb {
            position: fixed;
            bottom: 60px;
            right: 20px;
            display: none;
            z-index: 9999;
            font-size: 50px;
            font-weight: 600;
        }
    </style>
</head>

<body style="background-color: #EEEEEE;padding: 0px">
<!-- 返回顶部按钮 -->
<%--<div class="rb" >
    <a style="font-size:50px;font-weight: 600;color:#CCCCCC;margin-bottom: 0px" href="javascript:window.scrollTo( 0, 0 );">
        <span class="glyphicon glyphicon-upload"></span>
    </a>
</div>--%>
<span class="rb">
    <a href="javascript:window.scrollTo( 0, 0 );">
    <span  class="glyphicon glyphicon-upload"></span>
    </a>
</span>

<div class="container-fluid">
    <nav id="navId" class="navbar navbar-default navbar-fixed-top animated">
        <div class="col-lg-1"></div>
        <div class="col-lg-10">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a class="navbar-brand" href="${path }/index">Home</a>
                    </li>
                    <li>
                        <a  class="navbar-brand" href="${path }/archives/all">Archives</a>
                    </li>
                    <li>
                        <a  class="navbar-brand" href="${path }/toPage/about">About</a>
                    </li>
                    <li>
                        <a  class="navbar-brand" href="${path }/toPage/link">Link</a>
                    </li>
                    <li>
                        <a id="search" class="navbar-brand" href="javascript:;">Search</a>
                    </li>
                </ul>
                <form class="navbar-form  navbar-right" role="search" onsubmit="return baiduWithHttps(this)" action="http://www.baidu.com/baidu" target="_blank">
                    <div class="form-group">
                        <input name="tn" type="hidden" value="SE_zzsearchcode_shhzc78w">
                        <input type="text" class="form-control" placeholder="SearchMore..." onfocus="checkHttps" name="word" size="23">
                    </div>
                </form>
            </div>
        </div>
        <div class="col-lg-1"></div>
    </nav>
</div>
<div class="container-fluid" style="background-color: #4183C4;box-shadow:0 0 25px #000;" >
    <div class="col-lg-1"></div>
    <div class="col-lg-11 animated fadeIn" style="margin: 100px 0px 0px 0px;padding-bottom: 60px;animation-duration: 3s">
        <span style="color: white">
        <span style="font-weight: 500;font-size: 63px">薛定谔的汪</span><br>
        <span style="font-weight: 500;font-size: 20px">
            <span class="glyphicon glyphicon-map-marker">&nbsp;beijing.china</span>
            &nbsp;&nbsp;
            <span class="glyphicon glyphicon-cloud">&nbsp;cloudfavourites</span>&nbsp;&nbsp;
            <span class="glyphicon glyphicon-user">&nbsp;@薛定谔的汪</span>
        </span>
        </span>
    </div>
</div>


<div class="modal" id="searchModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body" style="height: 560px;padding: 15px;overflow: auto" >
                <div class="input-group">
                    <input name="searchWords" id="searchInput" class="form-control" placeholder="搜索..."/>
                    <span class="input-group-addon" data-dismiss="modal">
                            <a href="javascript:;" style="color: black;" id="x">x</a>
                        </span>
                </div>

                <div class="animated fadeIn" id="search-result">
                </div>
            </div>
        </div>
        <!--/*modal-dialog*/-->
    </div>
    <!--/*modal-content*/-->
</div>
<!--/*modal*/-->
<script>
    //返回顶部滚动div
    $(document).scroll(function() {
        var $scollTOP=$(document).scrollTop();
        if($scollTOP<300){
            $(".rb").css("display","none");
        }else{
            $(".rb").css("display","block");
        }
    })

    $(function() {
        $("#search").click(function(){
            $("#searchModal").modal("toggle");
            $(".modal-backdrop").remove();//删除class值为modal-backdrop的标签，可去除阴影
            $("#searchInput").val("");
            $("#search-result").children().remove();
        });

        $("#searchInput").keyup(searchAjax);
        /*$("#searchInput").keyup(function () {
            alert($(this).val())
        })*/
    });

    function searchAjax(){
        $("#search-result").children().remove();
        //获得关键字
        var keyword = $(this).val();
        //如果输入的内容是空(例如用户连续敲空格),不发送ajax
        if (keyword !== null && keyword !== undefined && keyword.trim()!== ''){
            $.ajax({
                url : '${path}/article/search/'+keyword,
                type : "post",
                dataType : "json",
                success : function(data) {
                    for(var i=0;i<data.length;i++){
                        child = '<h2 style="margin: 5px 0px"><a href="${path}/article/detail/'+data[i].articleId+'">'+data[i].title+'</a></h2>\n' +'<span class="summary">'+data[i].label+'</span>\n' +'<hr style="margin: 5px auto">';
                        $("#search-result").append(child);
                    }
                }
            })
        }
    }
</script>
</body>
</html>
