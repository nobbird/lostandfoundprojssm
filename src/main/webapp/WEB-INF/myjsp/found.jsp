<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>寻物启事</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/images/失物招领.png"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/amazeui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/public.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/layui.css">
    <script src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/layuiadmin/layui/layui.js"></script>
</head>
<body>
<div style="width: 300px;margin: 30px auto">
    <form id="search">
        <div style="float: left">
            <input name="key" type="search" class="am-form-field">
        </div>
        <div style="float: left">
            <input type="submit" value="搜索"  class="am-btn am-btn-success">
        </div>
    </form>
</div>

<div class="am-g am-container newatype" >
    <div class="am-u-sm-12 am-u-md-12 am-u-lg-8 oh">
        <div data-am-widget="titlebar" class="am-titlebar am-titlebar-default"
             style="border-bottom: 0px; margin-bottom: -10px">
            <h2 class="am-titlebar-title ">招领启事 </h2>

        </div>

        <div id="view"></div>
        <script id="demo1" type="text/html">
            <div class="am-list-news am-list-news-default news">
                <div class="am-list-news-bd">
                    <ul class="am-list">
                        {{# if(d.total === 0) { }}
                            <p>数据为空</p>
                        {{#
                            } else {
                                layui.each(d.list, function(index, item) {
                        }}
                                    <li class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-left am-fl">
                                        <div class="am-u-sm-4 am-list-thumb ">
                                            <img class="am-thumbnail" src="{{item.images}}"/>
                                        </div>
                                        <div class=" am-u-sm-5 am-list-main">
                                            <h3 class="am-list-item-hd">{{item.title}}</h3>
                                            <div class="am-list am-list-static"
                                                 style="line-height: 1.4;font-size: 1.3rem;color: #999999;margin: 0;">{{item.content}}<br>丢失时间：{{item.losttime}}
                                            </div>
                                        </div>
                                        <div class="newsico am-fl" style="width: 300px;height: 30px;margin-top: 130px">
                                            <i class="am-badge am-badge-secondary am-round">{{item.types==0?'数码产品':(item.types==1?'书籍':(item.types==2?'包':'饭卡'))}}</i>
                                            <i class="am-badge am-badge-secondary am-round">{{item.updatetime}}</i>
                                            <br><br>
                                            <i class="am-badge am-badge-success am-round am-text-default"><a href="/apply/{{item.id}}" style="color: #fff">申领</a></i>
                                        </div>
                                    </li>
                        {{#
                                });
                            }
                        }}
                    </ul>
                </div>
            </div>
        </script>

        <div id="demo"></div>

    </div>
</div>
</body>
<script>

    layui.use(['laypage', 'laytpl'], function () {
        $.post('/wupingController/getWupingByPages/1', {pageNow: 1, pageSize: 8}, function (data) {
            var getTpl = demo1.innerHTML
                ,view = document.getElementById('view')
                ,laypage = layui.laypage
                ,laytpl = layui.laytpl;

            function flash(data) {
                laytpl(getTpl).render(data, function(html){
                    view.innerHTML = html;
                });
            }

            flash(data);

            laypage.render({
                elem: 'demo',
                count: data.payload.total,
                limit: 8,
                jump: function (obj) {
                    $.post('/wupingController/getWupingByPages/1', {pageNow: obj.curr, pageSize: 8}, function (data) {
                        flash(data.payload);
                    });
                }
            })
        });
        document.querySelector("#search").onsubmit = function (e) {
            e.preventDefault();
            var key = this.key.value;

            $.get('/wupingController/keyWordSearch', {
                pageNow: 1,
                pageSize: 8,
                flag: 1,
                keyWord: key
            }, function (data) {
                var getTpl = demo1.innerHTML
                    , view = document.getElementById('view')
                    , laypage = layui.laypage
                    , laytpl = layui.laytpl;

                function flash(data) {
                    laytpl(getTpl).render(data, function (html) {
                        view.innerHTML = html;
                    });
                }

                flash(data);

                laypage.render({
                    elem: 'demo',
                    count: data.payload.total,
                    limit: 8,
                    jump: function (obj) {
                        $.post('/wupingController/keyWordSearch', {
                            pageNow: obj.curr,
                            pageSize: 8,
                            flag: 1,
                            keyWord: key
                        }, function (data) {
                            flash(data);

                        });
                    }
                });
            });
            return false;
        }
    });

</script>

