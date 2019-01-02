<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人中心</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/images/失物招领.png"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/demo.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/validate.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/demo.js"></script>
</head>
<body>
<form id="demo" autocomplete="off" action="${pageContext.request.contextPath}/userController/updateUser" method="post">
    <p>
        <span class="tip">昵称：</span>
        <input type="text" name="username">
    </p>
    <p class="prompot"><i class="iconfont"></i></p>
    <p>
        <span class="tip">密码：</span>
        <input type="password" name="password" id="password">
    </p>
    <p class="prompot"><i class="iconfont"></i></p>
    <p>
        <span class="tip">确认密码：</span>
        <input type="password" name="userpass">
    </p>
    <p class="prompot"><i class="iconfont"></i></p>
    <p>
        <span class="tip">学号：</span>
        <input type="text" name="usernumb">
    </p>
    <p class="prompot"><i class="iconfont"></i></p>
    <p>
        <span class="tip">手机号码：</span>
        <input type="text" name="usertel" class="tel">
    </p>
    <p class="prompot"><i class="iconfont"></i></p>
    <p>
        <span class="tip">邮箱：</span>
        <input type="text" name="useremail" class="mail">
    </p>
    <p class="prompot"><i class="iconfont"></i></p>
    <button type="submit">确认修改</button>
</form>
</body>
</html>
