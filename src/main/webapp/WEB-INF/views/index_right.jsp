<%--
  Created by IntelliJ IDEA.
  User: 郑亚凯
  Date: 2017/08/23
  Time: 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <link href="${path}/static/bootstrap/css/my.css" rel="stylesheet"/>
    <link href="${path}/static/bootstrap/css/animate.css" rel="stylesheet"/>
    <script>

        $(function () {
            $.ajax({
                url : '${path}/type/getAllTypes',
                type : "get",
                dataType : "json",
                success : function(data) {
                    for(var i=0;i<data.length;i++){
                        child = '<a class="myA" href="${path}/type/typelist/'+data[i].typeId+'/1/9">'+data[i].typeName+'</a><sup class="mysup">'+data[i].typeCount+'</sup><hr class="myhr1"/>';
                        $("#type").append(child);
                    }
                }
            })

            $.ajax({
                url : '${path}/label/getAllLabels',
                type : "get",
                dataType : "json",
                success : function(data) {
                    for(var i=0;i<data.length;i++){
                        child = '<a href="${path}/label/articlesBylabel/'+data[i].label+'" class="myA" title='+data[i].label+'>'+data[i].label+'</a><sup class="mysup">'+data[i].labelCount+'</sup><br>';
                        $("#labelId").append(child);
                    }
                    $("#labelId").append('<a href="${path}/label/alllabellist/1/12" class="myA">所有标签</a><br>');
                }
            })
        })
    </script>
</head>
<body>
<div class="panel  panel-default animated fadeInRight" style="height: 600px">
    <div style="margin: 50px;text-align: center">
        <img src="http://yakai.oss-cn-beijing.aliyuncs.com/blog_img/James.jpg" style="height:250px;">
        <h2><span style="font-weight: 600">詹姆斯</span></h2>
        <h4 style="color: #808080">
            <p>Java攻城狮<p>
            <p>微信公众号[薛定汪的鳄]<p>
        </h4>
        <hr>
        <span>邮件&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;<a href="mailto:yakai512@163.com" class="noneLine">yakai512@163.com</a></span><br>
        <span>微信&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp<a href="javascript:;" class="noneLine">薛定谔的汪</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
        <hr>
        <span class="glyphicon glyphicon-fire" style="color: #2e6da4">
                        <a href="https://github.com/zhengyakai/itsome" target="_blank">GitHub</a>
                    </span>
        <span class="glyphicon glyphicon-fire" style="color: #2e6da4">
                        <a href="javascript:;">微博</a>
                    </span>
        <span class="glyphicon glyphicon-fire" style="color: #2e6da4">
                        <a href="javascript:;">简书</a>
                    </span>
    </div>

</div>
<!-- 公众号 -->
<div class="panel  panel-default animated fadeInRight" style="height: 350px">
    <div style="text-align: center;margin: 40px">
        <h2 style="font-weight: 600;font-size: 30px;color: #2e6da4">公众号</h2><hr/>
        <img src="http://yakai.oss-cn-beijing.aliyuncs.com/blog_img/gongzhong.jpg" style="height: 220px">
    </div>
</div>
<!-- 标签分类 -->
<div class="panel  panel-default animated fadeInRight" style="height: auto">
    <div style="text-align: left;margin: 30px 30px auto 30px">
        <p style="font-weight: 600;font-size: 25px;color: #2e6da4;margin-bottom: auto">专栏</p>
        <hr style="border: solid;height: 1px;color:#CCCCCC;background-color: #CCCCCC;margin: auto auto 7px auto"/>
        <a class="myA">服务端开发指南与最佳实践</a><hr class="myhr1"/>
        <a class="myA">Spring Boot 揭秘与实战</a><hr class="myhr1"/>
        <a class="myA">设计模式指南</a><hr class="myhr1"/>
        <a class="myA">RabbitMQ 实战</a><hr class="myhr1"/>
    </div>
    <div id="labelId" style="text-align: left;margin: 30px 30px auto 30px">
        <p style="font-weight: 600;font-size: 25px;color: #2e6da4;margin-bottom: auto">标签</p>
        <hr style="border: solid;height: 1px;color:#CCCCCC;background-color: #CCCCCC;margin: auto auto 7px auto"/>
       <%-- <a href="#" class="myA">Bootstrap</a><sup class="mysup">10</sup><br>--%>
    </div>

    <div id="type" style="text-align: left;margin: 30px 30px auto 30px">
        <p style="font-weight: 600;font-size: 25px;color: #2e6da4;margin-bottom: auto">分类</p>
        <hr style="border: solid;height: 1px;color:#CCCCCC;background-color: #CCCCCC;margin: auto auto 7px auto"/>
        <%--<a style="font-weight: 500;font-size: 20px">JAVA技术</a><sup class="mysup">17</sup><hr class="myhr1"/>--%>
    </div>
    <!-- 推荐网站 -->
    <div style="text-align: left;margin: 30px 30px auto 30px">
        <p style="font-weight: 600;font-size: 25px;color: #2e6da4;margin-bottom: auto">推荐网站</p>
        <hr style="border: solid;height: 1px;color:#CCCCCC;background-color: #CCCCCC;margin: auto auto 7px auto"/>
        <a class="myA" href="http://spring4all.com/" target="_blank">Spring For All 社区</a><hr class="myhr1"/>
        <a class="myA" href="http://docs.720ui.com/index.htm" target="_blank">开发在线文档</a><hr class="myhr1"/>
        <a class="myA" href="http://www.csdn.net/" target="_blank">CSDN</a><hr class="myhr1"/>
    </div>
</div>

</body>
</html>
