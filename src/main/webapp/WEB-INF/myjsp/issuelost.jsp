<%--
  Created by IntelliJ IDEA.
  User: zhn
  Date: 2018/12/18
  Time: 9:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>丢失物品信息单</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/static/images/失物招领.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/amazeui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/public.css">
</head>
<body>
<form class="am-form am-form-horizontal" action="${pageContext.request.contextPath}/wupingController/wupingAdd/${sessionScope.user.id}" method="post" enctype="multipart/form-data" style="width: 700px;margin: 80px auto">
    <div class="am-form-group">
        <label for="doc-ipt-3" class="am-u-sm-2 am-form-label">信息类型</label>
        <div class="am-u-sm-10">
            寻物启事<input name="flag" type="radio" value="0" id="doc-ipt-3">&nbsp;招领启事<input name="flag" type="radio" value="1">
        </div>
    </div>

    <div class="am-form-group ">
        <label for="doc-ipt-pwd-2" class="am-u-sm-2 am-form-label">信息标题</label>
        <div class="am-u-sm-10">
            <input type="text" name="title" class="am-form-field" id="doc-ipt-pwd-2">
        </div>
    </div>

    <div class="am-form-group">
        <label for="doc-ipt-4" class="am-u-sm-2 am-form-label">物品类型</label>
        <div class="am-u-sm-10">
            数码产品<input name="types" type="radio" value="0" id="doc-ipt-4">&nbsp;书籍<input name="types" type="radio" value="1">&nbsp;包<input name="types" type="radio" value="2">&nbsp;饭卡<input name="types" type="radio" value="3">
        </div>
    </div>

    <div class="am-form-group">
        <label for="doc-ipt-pwd-4" class="am-u-sm-2 am-form-label">丢失/捡到日期</label>
        <div class="am-u-sm-10">
            <input type="text" name="losttime" class="textfield" id="doc-ipt-pwd-4">
        </div>
    </div>

    <div class="am-form-group">
        <label for="doc-ipt-pwd-3" class="am-u-sm-2 am-form-label">物品详情</label>
        <div class="am-u-sm-10">
            <textarea type="text" name="content" class="textfield" id="doc-ipt-pwd-3" rows="3"></textarea>
        </div>
    </div>

    <div class="am-form-group">
        <label for="doc-ipt-pwd-4" class="am-u-sm-2 am-form-label">上传图片</label>
        <div class="am-u-sm-10">
            <input type="file" name="file">
        </div>
    </div>


    <div class="am-form-group">
        <div class="am-u-sm-10 am-u-sm-offset-2">
            <button type="submit" class="am-btn am-btn-primary am-round">提交</button>
        </div>
    </div>
</form>

</body>
</html>
