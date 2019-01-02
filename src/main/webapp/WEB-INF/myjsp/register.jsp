<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>注册</title>
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
                    注册
                </div>
                <form action="${pageContext.request.contextPath}/userController/register" method="post">

                    <div class="form_text_ipt">
                        <input name="username" type="text" placeholder="用户名">
                    </div>
                    <div class="ececk_warning"><span>数据不能为空</span></div>
                    <div class="form_text_ipt">
                        <input name="userpass" type="password" placeholder="密码">
                    </div>
                    <div class="ececk_warning"><span>数据不能为空</span></div>
                    <div class="form_text_ipt">
                        <input name="usernumb" type="password" placeholder="学号">
                    </div>
                    <div class="ececk_warning"><span>数据不能为空</span></div>
                    <div class="form_text_ipt">
                        <input name="usertel" type="text" placeholder="手机号">
                    </div>
                    <div class="ececk_warning"><span>数据不能为空</span></div>
                    <div class="form_text_ipt">
                        <input name="useremail" type="text" placeholder="邮箱">
                    </div>
                    <div class="ececk_warning"><span>数据不能为空</span></div>

                    <div class="form_btn">
                        <button type="submit">注册</button>
                    </div>
                    <div class="form_reg_btn">
                        <span>已有帐号？</span><a href="login">马上登录</a>
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

</body>
</html>
