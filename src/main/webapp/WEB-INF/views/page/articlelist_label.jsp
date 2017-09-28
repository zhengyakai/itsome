<%--
  Created by IntelliJ IDEA.
  User: 郑亚凯
  Date: 2017/08/24
  Time: 14:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<nav style="text-align: center">
    <ul class="pagination pagination-lg">
        <!-- 上一页 -->
        <c:if test="${voPageBean.currentPage==1 }">
            <li class="disabled">
                <a href="javascript:void(0);" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
        </c:if>
        <c:if test="${voPageBean.currentPage!=1 }">
            <li>
                <a href="${path }/label/labellist/${labelName}/${voPageBean.currentPage-1}/9" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
        </c:if>

        <c:forEach begin="1" end="${voPageBean.totalPage }" var="page">
            <c:if test="${voPageBean.currentPage==page }">
                <li class="active"><a href="javascript:void(0);">${page }</a></li>
            </c:if>
            <c:if test="${voPageBean.currentPage!=page }">
                <li><a href="${path }/label/labellist/${labelName}/${page}/9">${page }</a></li>
            </c:if>
        </c:forEach>

        <!-- 下一页 -->
        <c:if test="${voPageBean.currentPage==voPageBean.totalPage }">
            <li class="disabled">
                <a href="javascript:void(0);" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </c:if>
        <c:if test="${voPageBean.currentPage!=voPageBean.totalPage  }">
            <li>
                <a href="${path }/label/labellist/${labelName}/${voPageBean.currentPage+1}/9" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </c:if>
    </ul>
</nav>
</body>
</html>
