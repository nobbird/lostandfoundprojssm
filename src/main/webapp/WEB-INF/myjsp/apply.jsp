<%--
  Created by IntelliJ IDEA.
  User: zhn
  Date: 2018/12/22
  Time: 19:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>领物申请</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/images/失物招领.png"/>
</head>
<body>
<form action="${pageContext.request.contextPath}/applyController/applyWuping/${requestScope.tid}/${sessionScope.user.id}" method="post">
    <table width="50%" border="1" align="center">
        <tr>
            <td>申请理由</td>
            <td>
                <input type="text" name="reason" class="textfield">
            </td>
        </tr>
        <tr>
            <td>详情描述</td>
            <td><input type="text" name="content" class="textfield"></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <input type="submit" name="button" id="button" value="发布">
            </td>
        </tr>
    </table>

</form>
<a href="/index">网站首页</a>
</body>
</html>
