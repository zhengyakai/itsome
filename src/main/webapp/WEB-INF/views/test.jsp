<%--
  Created by IntelliJ IDEA.
  User: 郑亚凯
  Date: 2017/08/28
  Time: 17:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title></title><%--
    <script type="text/javascript" src="/static/js/jquery-3.1.1.js" ></script>
    <script type="text/javascript" src="/static/bootstrap/js/bootstrap.min.js" ></script>
    <link rel="stylesheet" href="/static/bootstrap/css/bootstrap.min.css" />--%>
</head>
<body>
<button class="btn btn-primary" type="button" id="test">点击我显示模态框</button>

<div class="modal" id="my-modal-alert">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times</span><span class="sr-only">Close</span>
                </button>                        <h4 class="modal-title" id="modal-title">模态框</h4><span id="num"></span>
            </div>                     <!--/*modal-header*/-->
            <div class="modal-body">
                <div id="modal_message">没有半透明阴影的模态框</div>
            </div>
            <!--/*modal-body*/-->
            <div class="modal-footer" id="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" >保存</button>
                <!--/*modal-body*/-->
            </div>
            <!--/*modal-footer*/-->
        </div>
        <!--/*modal-dialog*/-->
    </div>
    <!--/*modal-content*/-->
</div>
<!--/*modal*/-->
<script>
    $(function() {
        $("#test").click(function(){
            $("#my-modal-alert").modal("toggle");
            $(".modal-backdrop").remove();//删除class值为modal-backdrop的标签，可去除阴影
        });
    });
</script>
</body>
</html>
