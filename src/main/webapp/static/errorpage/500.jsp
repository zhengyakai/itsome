<%--
  Created by IntelliJ IDEA.
  User: 郑亚凯
  Date: 2017/08/28
  Time: 09:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>500 - 对不起，服务器内部错误！- 医疗系统</title>
    <link rel="stylesheet" type="text/css" href="/static/css/main.css">
</head>
<body>
<div id="wrapper">
    <div id="main">
        <div id="header">
            <h1><span class="icon">!</span>500<span class="sub">Internal Server Error</span></h1>
        </div>
        <div id="content">
            <h2>服务器内部错误！</h2>
            <p>当您看到这个页面,表示服务器内部错误,网站可能正在升级,无法执行您的请求,请稍后重试或联系站长进行处理,感谢您的支持!</p>
            <div class="utilities">
                <div class="input-container" style="font: 13px 'TeXGyreScholaRegular', Arial, sans-serif;color: #696969; text-shadow: 0 1px white;text-decoration: none;">
                    <span id="totalSecond" style="color:red">5</span>秒后自动跳转…
                </div>
                <a class="button right" href="#" onClick="history.go(-1);return true;">返回...</a><a class="button right" href="mailto:yakai512@163.com">联系站长</a>
                <div class="clear"></div>
            </div>
        </div>
    </div>
</div>
</body>

<!--定义js变量及方法-->
<script language="javascript" type="text/javascript">
    var second = document.getElementById('totalSecond').textContent;


    if (navigator.appName.indexOf("Explorer") > -1)
    {
        second = document.getElementById('totalSecond').innerText;
    } else
    {
        second = document.getElementById('totalSecond').textContent;
    }

    setInterval("redirect()", 1000);
    function redirect()
    {
        if (second < 0)
        {
            <!--定义倒计时后跳转页面-->
            location.href = '${pageContext.request.contextPath}/index';
        } else
        {
            if (navigator.appName.indexOf("Explorer") > -1)
            {
                document.getElementById('totalSecond').innerText = second--;
            } else
            {
                document.getElementById('totalSecond').textContent = second--;
            }
        }
    }
</script>
</html>
