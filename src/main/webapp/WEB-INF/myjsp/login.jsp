<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/reset.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/common.css"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/images/失物招领.png"/>
</head>
<body>
<div class="wrap login_wrap">
    <div class="content">

        <div class="logo"></div>

        <div class="login_box">

            <div class="login_form">
                <div class="login_title">
                    登录
                </div>
                <form id="form-login" action="${pageContext.request.contextPath}/userController/login" method="post">

                    <div class="form_text_ipt">
                        <input name="username" type="text" placeholder="用户名" required>
                    </div>
                    <div class="ececk_warning"><span>数据不能为空</span></div>
                    <div class="form_text_ipt">
                        <input name="userpass" type="password" placeholder="密码" required>
                    </div>
                    <div class="ececk_warning"><span>数据不能为空</span></div>
                    <div class="form_check_ipt">
                        <div class="left check_left">
                            <label><input name="" type="checkbox"> 下次自动登录</label>
                        </div>
                        <div class="right check_right">
                            <a href="#">忘记密码</a>
                        </div>
                    </div>
                    <div class="form_btn">
                        <button type="submit" name="button">登录</button>
                    </div>
                    <div class="form_reg_btn">
                        <span>还没有帐号？</span><a href="register">马上注册</a>
                    </div>
                    <br>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/common.js"></script>
</body>
</html>