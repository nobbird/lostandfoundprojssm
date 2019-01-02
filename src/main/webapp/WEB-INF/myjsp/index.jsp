<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/layui.css">
    <script src="${pageContext.request.contextPath}/layuiadmin/layui/layui.js"></script>
    <!--360 browser -->
    <meta name="renderer" content="webkit">
    <meta name="author" content="wos">
    <!-- Android -->
    <meta name="mobile-web-app-capable" content="yes">
    <link rel="icon" sizes="192x192" href="${pageContext.request.contextPath}/static/images/失物招领.png">
    <!--Safari on iOS -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content="L&F"/>
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/static/images/失物招领.png">
    <!--Win8 or 10 -->
    <meta name="msapplication-TileImage" content="${pageContext.request.contextPath}/static/images/失物招领.png">
    <meta name="msapplication-TileColor" content="#e1652f">

    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/static/images/失物招领.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/amazeui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/public.css">

    <!--[if (gte IE 9)|!(IE)]><!-->
    <script src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
    <!--<![endif]-->
    <!--[if lte IE 8 ]>
    <script src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/modernizr.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/amazeui.ie8polyfill.min.js"></script>
    <![endif]-->
    <script src="${pageContext.request.contextPath}/static/js/amazeui.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/public.js"></script>
</head>
<body>

<header class="am-topbar am-topbar-fixed-top wos-header">
    <div class="am-container">
        <h1 class="am-topbar-brand">
            <a href="#"><img src="${pageContext.request.contextPath}/static/images/失物招领.png" alt="" style="width: 60px;height: 60px"></a>
        </h1>

        <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-warning am-show-sm-only"
                data-am-collapse="{target: '#collapse-head'}">
            <span class="am-sr-only">导航切换</span>
            <span class="am-icon-bars"></span>
        </button>

        <div class="am-collapse am-topbar-collapse" id="collapse-head">
            <ul class="am-nav am-nav-pills am-topbar-nav">
                <li class="am-active"><a href="/index">首页</a></li>
                <li><a href="${pageContext.request.contextPath}/wupingController/getListByPage/0"> 失物启事</a></li>
                <li><a href="${pageContext.request.contextPath}/wupingController/getListByPage/1">招领启事</a></li>
                <li><a href="/issuelost">发布窗口</a></li>
                <li><a href="/userMessage">个人中心</a></li>
            </ul>
            <c:choose>
            <c:when test="${ not empty sessionScope.user }">
                <div class="am-topbar-right">
                    <button onclick="location.href='login'" class="am-btn am-btn-danger am-topbar-btn am-btn-sm"><span class="am-icon-pencil"></span> 退出</button>
                </div>
                <div class="am-topbar-right">
                    <button onclick="location.href='userMessage'" class="am-btn am-btn-danger am-topbar-btn am-btn-sm"><span class="am-icon-user"></span>${sessionScope.user.username}</button>
                </div>
            </c:when>
            <c:otherwise>
                <div class="am-topbar-right">
                    <button onclick="location.href='register'" class="am-btn am-btn-default am-topbar-btn am-btn-sm"><span class="am-icon-pencil"></span>注册</button>
                </div>

                <div class="am-topbar-right">
                    <button onclick="location.href='login'" class="am-btn am-btn-danger am-topbar-btn am-btn-sm"><span class="am-icon-user"></span> 登录</button>
                </div>
            </c:otherwise>

            </c:choose>

        </div>
    </div>
</header>
<!--banner-->
<div class="banner">
    <div class="am-g am-container">
        <div class="am-u-sm-12 am-u-md-12 am-u-lg-8">
            <div data-am-widget="slider" class="am-slider am-slider-c1" data-am-slider='{"directionNav":false}' style="margin-top: 70px">
                <ul class="am-slides">
                    <li>
                        <a href="#"><img src="${pageContext.request.contextPath}/static/images/bear.jpg"></a>
                        <div class="am-slider-desc">远方 有一个地方 那里种有我们的梦想</div>

                    </li>
                    <li>
                        <a href="#"><img src="${pageContext.request.contextPath}/static/images/bear.jpg"></a>
                        <div class="am-slider-desc">某天 也许会相遇 相遇在这个好地方</div>

                    </li>
                    <li>
                        <a href="#"><img src="${pageContext.request.contextPath}/static/images/bear.jpg"></a>
                        <div class="am-slider-desc">不要太担心 只因为我相信 终会走过这条遥远的道路</div>

                    </li>
                    <li>
                        <a href="#"><img src="${pageContext.request.contextPath}/static/images/bear.jpg"></a>
                        <div class="am-slider-desc">OH PARA PARADISE 是否那么重要 你是否那么地遥远</div>
                    </li>
                </ul>
            </div>
        </div>
        <div class="am-u-sm-0 am-u-md-0 am-u-lg-4 padding-none">
            <div class="star am-container"><span><img src="${pageContext.request.contextPath}/static/images/star.png">荣誉榜</span></div>
            <ul class="padding-none am-gallery am-avg-sm-2 am-avg-md-4 am-avg-lg-2 am-gallery-overlay" data-am-gallery="{ pureview: true }" >
                <li>
                    <div class="am-gallery-item">
                        <a href="#">
                            <img src="${pageContext.request.contextPath}/static/images/lins.png"  alt="远方 有一个地方 那里种有我们的梦想"/>
                            <h3 class="am-gallery-title">远方 有一个地方 那里种有我们的梦想</h3>
                            <div class="am-gallery-desc">2375-09-26</div>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="am-gallery-item">
                        <a href="#">
                            <img src="${pageContext.request.contextPath}/static/images/lins.png"  alt="远方 有一个地方 那里种有我们的梦想"/>
                            <h3 class="am-gallery-title">远方 有一个地方 那里种有我们的梦想</h3>
                            <div class="am-gallery-desc">2375-09-26</div>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="am-gallery-item">
                        <a href="#">
                            <img src="${pageContext.request.contextPath}/static/images/lins.png"  alt="远方 有一个地方 那里种有我们的梦想"/>
                            <h3 class="am-gallery-title">远方 有一个地方 那里种有我们的梦想</h3>
                            <div class="am-gallery-desc">2375-09-26</div>
                        </a>
                    </div>
                </li>
                <li>
                    <div class="am-gallery-item">
                        <a href="#">
                            <img src="${pageContext.request.contextPath}/static/images/lins.png"   alt="远方 有一个地方 那里种有我们的梦想"/>
                            <h3 class="am-gallery-title">远方 有一个地方 那里种有我们的梦想</h3>
                            <div class="am-gallery-desc">2375-09-26</div>
                        </a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>

<!--news-->
<div class="am-g am-container newatype">
    <div class="am-u-sm-12 am-u-md-12 am-u-lg-8 oh">
            <div data-am-widget="titlebar" class="am-titlebar am-titlebar-default" style="border-bottom: 0px; margin-bottom: -10px">
                <h2 class="am-titlebar-title ">
                    最新启事            </h2>
                <nav class="am-titlebar-nav">
                    <a href="/lost">more &raquo;</a>
                </nav>
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
                                layui.each(d.wupings, function(index, item) {
                                    if (index < 8) {
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
                                        </div>
                                    </li>
                            {{#
                                    }
                                });
                                }
                            }}
                        </ul>
                    </div>
                </div>
            </script>
    </div>
    <div class="am-u-sm-12 am-u-md-12 am-u-lg-4">
        <div data-am-widget="titlebar" class="am-titlebar am-titlebar-default">
            <h2 class="am-titlebar-title ">
                荣誉榜
            </h2>
            <nav class="am-titlebar-nav">
                <a href="#more">more &raquo;</a>
            </nav>
        </div>
        <div data-am-widget="list_news" class="am-list-news am-list-news-default right-bg" data-am-scrollspy="{animation:'fade'}">
            <ul class="am-list"  >
                <li class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-left">
                    <div class="am-u-sm-4 am-list-thumb">
                        <a href="javascript:if(confirm('http://www.douban.com/online/11624755/  \n\n??ļ????? Teleport Ultra ??, ?Ϊ ??һ???????????????Ϊ?????????ĵ????  \n\n????????????'))window.location='http://www.douban.com/online/11624755/'" tppabs="http://www.douban.com/online/11624755/">
                            <img src="${pageContext.request.contextPath}/static/images/face.jpg" class="face"/>
                        </a>
                    </div>

                    <div class=" am-u-sm-8 am-list-main">
                        <h3 class="am-list-item-hd"><a href="javascript:if(confirm('http://www.douban.com/online/11624755/  \n\n??ļ????? Teleport Ultra ??, ?Ϊ ??һ???????????????Ϊ?????????ĵ????  \n\n????????????'))window.location='http://www.douban.com/online/11624755/'" tppabs="http://www.douban.com/online/11624755/">勾三古寺</a></h3>

                        <div class="am-list-item-text">代码压缩和最小化。在这里，我们为你收集了9个最好的JavaScript压缩工具将帮</div>
                    </div>
                </li>
                <hr data-am-widget="divider" style="" class="am-divider am-divider-default" />
                <li class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-left">
                    <div class="am-u-sm-4 am-list-thumb">
                        <a href="javascript:if(confirm('http://www.douban.com/online/11624755/  \n\n??ļ????? Teleport Ultra ??, ?Ϊ ??һ???????????????Ϊ?????????ĵ????  \n\n????????????'))window.location='http://www.douban.com/online/11624755/'" tppabs="http://www.douban.com/online/11624755/">
                            <img src="${pageContext.request.contextPath}/static/images/face.jpg" class="face"/>
                        </a>
                    </div>

                    <div class=" am-u-sm-8 am-list-main">
                        <h3 class="am-list-item-hd"><a href="javascript:if(confirm('http://www.douban.com/online/11624755/  \n\n??ļ????? Teleport Ultra ??, ?Ϊ ??һ???????????????Ϊ?????????ĵ????  \n\n????????????'))window.location='http://www.douban.com/online/11624755/'" tppabs="http://www.douban.com/online/11624755/">勾三古寺</a></h3>

                        <div class="am-list-item-text">代码压缩和最小化。在这里，我们为你收集了9个最好的JavaScript压缩工具将帮</div>
                    </div>
                </li>
                <hr data-am-widget="divider" style="" class="am-divider am-divider-default" />
                <li class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-left">
                    <div class="am-u-sm-4 am-list-thumb">
                        <a href="javascript:if(confirm('http://www.douban.com/online/11624755/  \n\n??ļ????? Teleport Ultra ??, ?Ϊ ??һ???????????????Ϊ?????????ĵ????  \n\n????????????'))window.location='http://www.douban.com/online/11624755/'" tppabs="http://www.douban.com/online/11624755/">
                            <img src="${pageContext.request.contextPath}/static/images/face.jpg" class="face"/>
                        </a>
                    </div>

                    <div class=" am-u-sm-8 am-list-main">
                        <h3 class="am-list-item-hd"><a href="javascript:if(confirm('http://www.douban.com/online/11624755/  \n\n??ļ????? Teleport Ultra ??, ?Ϊ ??һ???????????????Ϊ?????????ĵ????  \n\n????????????'))window.location='http://www.douban.com/online/11624755/'" tppabs="http://www.douban.com/online/11624755/">勾三古寺</a></h3>

                        <div class="am-list-item-text">代码压缩和最小化。在这里，我们为你收集了9个最好的JavaScript压缩工具将帮</div>

                    </div>
                </li>
                <hr data-am-widget="divider" style="" class="am-divider am-divider-default" />
                <li class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-left">
                    <div class="am-u-sm-4 am-list-thumb">
                        <a href="javascript:if(confirm('http://www.douban.com/online/11624755/  \n\n??ļ????? Teleport Ultra ??, ?Ϊ ??һ???????????????Ϊ?????????ĵ????  \n\n????????????'))window.location='http://www.douban.com/online/11624755/'" tppabs="http://www.douban.com/online/11624755/">
                            <img src="${pageContext.request.contextPath}/static/images/face.jpg" class="face"/>
                        </a>
                    </div>

                    <div class=" am-u-sm-8 am-list-main">
                        <h3 class="am-list-item-hd"><a href="javascript:if(confirm('http://www.douban.com/online/11624755/  \n\n??ļ????? Teleport Ultra ??, ?Ϊ ??һ???????????????Ϊ?????????ĵ????  \n\n????????????'))window.location='http://www.douban.com/online/11624755/'" tppabs="http://www.douban.com/online/11624755/">勾三古寺</a></h3>

                        <div class="am-list-item-text">代码压缩和最小化。在这里，我们为你收集了9个最好的JavaScript压缩工具将帮</div>

                    </div>
                </li>
            </ul>
        </div>

        <div data-am-widget="titlebar" class="am-titlebar am-titlebar-default">
            <h2 class="am-titlebar-title ">
                合作专栏
            </h2>
            <nav class="am-titlebar-nav">
                <a href="#more">more &raquo;</a>
            </nav>
        </div>

        <div data-am-widget="list_news" class="am-list-news am-list-news-default right-bg" data-am-scrollspy="{animation:'fade'}">
            <ul class="am-list">
                <li class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-left">
                    <div class="am-u-sm-4 am-list-thumb">
                        <a href="javascript:if(confirm('http://www.douban.com/online/11624755/  \n\n??ļ????? Teleport Ultra ??, ?Ϊ ??һ???????????????Ϊ?????????ĵ????  \n\n????????????'))window.location='http://www.douban.com/online/11624755/'" tppabs="http://www.douban.com/online/11624755/">
                            <img src="${pageContext.request.contextPath}/static/images/face.jpg"  class="face"/>
                        </a>
                    </div>

                    <div class=" am-u-sm-8 am-list-main">
                        <h3 class="am-list-item-hd"><a href="javascript:if(confirm('http://www.douban.com/online/11624755/  \n\n??ļ????? Teleport Ultra ??, ?Ϊ ??һ???????????????Ϊ?????????ĵ????  \n\n????????????'))window.location='http://www.douban.com/online/11624755/'" tppabs="http://www.douban.com/online/11624755/">勾三古寺</a></h3>

                        <div class="am-list-item-text">代码压缩和最小化。在这里，我们为你收集了9个最好的JavaScript压缩工具将帮</div>
                    </div>
                </li>
                <hr data-am-widget="divider" style="" class="am-divider am-divider-default" />
                <li class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-left">
                    <div class="am-u-sm-4 am-list-thumb">
                        <a href="javascript:if(confirm('http://www.douban.com/online/11624755/  \n\n??ļ????? Teleport Ultra ??, ?Ϊ ??һ???????????????Ϊ?????????ĵ????  \n\n????????????'))window.location='http://www.douban.com/online/11624755/'" tppabs="http://www.douban.com/online/11624755/">
                            <img src="${pageContext.request.contextPath}/static/images/face.jpg"  class="face"/>
                        </a>
                    </div>

                    <div class=" am-u-sm-8 am-list-main">
                        <h3 class="am-list-item-hd"><a href="javascript:if(confirm('http://www.douban.com/online/11624755/  \n\n??ļ????? Teleport Ultra ??, ?Ϊ ??һ???????????????Ϊ?????????ĵ????  \n\n????????????'))window.location='http://www.douban.com/online/11624755/'" tppabs="http://www.douban.com/online/11624755/">勾三古寺</a></h3>

                        <div class="am-list-item-text">代码压缩和最小化。在这里，我们为你收集了9个最好的JavaScript压缩工具将帮</div>
                    </div>
                </li>
                <hr data-am-widget="divider" style="" class="am-divider am-divider-default" />
                <li class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-left">
                    <div class="am-u-sm-4 am-list-thumb">
                        <a href="javascript:if(confirm('http://www.douban.com/online/11624755/  \n\n??ļ????? Teleport Ultra ??, ?Ϊ ??һ???????????????Ϊ?????????ĵ????  \n\n????????????'))window.location='http://www.douban.com/online/11624755/'" tppabs="http://www.douban.com/online/11624755/">
                            <img src="${pageContext.request.contextPath}/static/images/face.jpg"  class="face"/>
                        </a>
                    </div>

                    <div class=" am-u-sm-8 am-list-main">
                        <h3 class="am-list-item-hd"><a href="javascript:if(confirm('http://www.douban.com/online/11624755/  \n\n??ļ????? Teleport Ultra ??, ?Ϊ ??һ???????????????Ϊ?????????ĵ????  \n\n????????????'))window.location='http://www.douban.com/online/11624755/'" tppabs="http://www.douban.com/online/11624755/">勾三古寺</a></h3>

                        <div class="am-list-item-text">代码压缩和最小化。在这里，我们为你收集了9个最好的JavaScript压缩工具将帮</div>

                    </div>
                </li>
                <hr data-am-widget="divider" style="" class="am-divider am-divider-default" />
                <li class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-left">
                    <div class="am-u-sm-4 am-list-thumb">
                        <a href="javascript:if(confirm('http://www.douban.com/online/11624755/  \n\n??ļ????? Teleport Ultra ??, ?Ϊ ??һ???????????????Ϊ?????????ĵ????  \n\n????????????'))window.location='http://www.douban.com/online/11624755/'" tppabs="http://www.douban.com/online/11624755/">
                            <img src="${pageContext.request.contextPath}/static/images/face.jpg" class="face"/>
                        </a>
                    </div>

                    <div class=" am-u-sm-8 am-list-main">
                        <h3 class="am-list-item-hd"><a href="javascript:if(confirm('http://www.douban.com/online/11624755/  \n\n??ļ????? Teleport Ultra ??, ?Ϊ ??һ???????????????Ϊ?????????ĵ????  \n\n????????????'))window.location='http://www.douban.com/online/11624755/'" tppabs="http://www.douban.com/online/11624755/">勾三古寺</a></h3>

                        <div class="am-list-item-text">代码压缩和最小化。在这里，我们为你收集了9个最好的JavaScript压缩工具将帮</div>

                    </div>
                </li>
            </ul>
        </div>
        <div data-am-widget="titlebar" class="am-titlebar am-titlebar-default">
            <h2 class="am-titlebar-title ">
                评测
            </h2>
            <nav class="am-titlebar-nav">
                <a href="#more">more &raquo;</a>
            </nav>
        </div>

        <div data-am-widget="list_news" class="am-list-news am-list-news-default right-bg" data-am-scrollspy="{animation:'fade'}">
            <ul class="am-list"  >
                <li class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-left">
                    <div class="am-u-sm-4 am-list-thumb">
                        <a href="javascript:if(confirm('http://www.douban.com/online/11624755/  \n\n??ļ????? Teleport Ultra ??, ?Ϊ ??һ???????????????Ϊ?????????ĵ????  \n\n????????????'))window.location='http://www.douban.com/online/11624755/'" tppabs="http://www.douban.com/online/11624755/">
                            <img src="${pageContext.request.contextPath}/static/images/face.jpg" tppabs="http://www.17sucai.com/preview/446841/2017-02-16/meng/Temp-images/face.jpg"/>
                        </a>
                    </div>

                    <div class=" am-u-sm-8 am-list-main">
                        <h3 class="am-list-item-hd"><a href="javascript:if(confirm('http://www.douban.com/online/11624755/  \n\n??ļ????? Teleport Ultra ??, ?Ϊ ??һ???????????????Ϊ?????????ĵ????  \n\n????????????'))window.location='http://www.douban.com/online/11624755/'" tppabs="http://www.douban.com/online/11624755/">勾三古寺</a></h3>

                        <div class="am-list-item-text">代码压缩和最小化。在这里，我们为你收集了9个最好的JavaScript压缩工具将帮</div>
                    </div>
                </li>
                <hr data-am-widget="divider" style="" class="am-divider am-divider-default" />
                <li class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-left">
                    <div class="am-u-sm-4 am-list-thumb">
                        <a href="javascript:if(confirm('http://www.douban.com/online/11624755/  \n\n??ļ????? Teleport Ultra ??, ?Ϊ ??һ???????????????Ϊ?????????ĵ????  \n\n????????????'))window.location='http://www.douban.com/online/11624755/'" tppabs="http://www.douban.com/online/11624755/">
                            <img src="${pageContext.request.contextPath}/static/images/face.jpg" tppabs="http://www.17sucai.com/preview/446841/2017-02-16/meng/Temp-images/face.jpg"/>
                        </a>
                    </div>

                    <div class=" am-u-sm-8 am-list-main">
                        <h3 class="am-list-item-hd"><a href="javascript:if(confirm('http://www.douban.com/online/11624755/  \n\n??ļ????? Teleport Ultra ??, ?Ϊ ??һ???????????????Ϊ?????????ĵ????  \n\n????????????'))window.location='http://www.douban.com/online/11624755/'" tppabs="http://www.douban.com/online/11624755/">勾三古寺</a></h3>

                        <div class="am-list-item-text">代码压缩和最小化。在这里，我们为你收集了9个最好的JavaScript压缩工具将帮</div>
                    </div>
                </li>
                <hr data-am-widget="divider" style="" class="am-divider am-divider-default" />
                <li class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-left">
                    <div class="am-u-sm-4 am-list-thumb">
                        <a href="javascript:if(confirm('http://www.douban.com/online/11624755/  \n\n??ļ????? Teleport Ultra ??, ?Ϊ ??һ???????????????Ϊ?????????ĵ????  \n\n????????????'))window.location='http://www.douban.com/online/11624755/'" tppabs="http://www.douban.com/online/11624755/">
                            <img src="${pageContext.request.contextPath}/static/images/face.jpg" tppabs="http://www.17sucai.com/preview/446841/2017-02-16/meng/Temp-images/face.jpg"/>
                        </a>
                    </div>

                    <div class=" am-u-sm-8 am-list-main">
                        <h3 class="am-list-item-hd"><a href="javascript:if(confirm('http://www.douban.com/online/11624755/  \n\n??ļ????? Teleport Ultra ??, ?Ϊ ??һ???????????????Ϊ?????????ĵ????  \n\n????????????'))window.location='http://www.douban.com/online/11624755/'" tppabs="http://www.douban.com/online/11624755/">勾三古寺</a></h3>

                        <div class="am-list-item-text">代码压缩和最小化。在这里，我们为你收集了9个最好的JavaScript压缩工具将帮</div>

                    </div>
                </li>
                <hr data-am-widget="divider" style="" class="am-divider am-divider-default" />
                <li class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-left">
                    <div class="am-u-sm-4 am-list-thumb">
                        <a href="javascript:if(confirm('http://www.douban.com/online/11624755/  \n\n??ļ????? Teleport Ultra ??, ?Ϊ ??һ???????????????Ϊ?????????ĵ????  \n\n????????????'))window.location='http://www.douban.com/online/11624755/'" tppabs="http://www.douban.com/online/11624755/">
                            <img src="${pageContext.request.contextPath}/static/images/face.jpg" tppabs="http://www.17sucai.com/preview/446841/2017-02-16/meng/Temp-images/face.jpg"/>
                        </a>
                    </div>

                    <div class=" am-u-sm-8 am-list-main">
                        <h3 class="am-list-item-hd"><a href="javascript:if(confirm('http://www.douban.com/online/11624755/  \n\n??ļ????? Teleport Ultra ??, ?Ϊ ??һ???????????????Ϊ?????????ĵ????  \n\n????????????'))window.location='http://www.douban.com/online/11624755/'" tppabs="http://www.douban.com/online/11624755/">勾三古寺</a></h3>

                        <div class="am-list-item-text">代码压缩和最小化。在这里，我们为你收集了9个最好的JavaScript压缩工具将帮</div>

                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>

<div data-am-widget="gotop" class="am-gotop am-gotop-fixed" >
    <a href="#top" title="回到顶部">
        <img class="am-gotop-icon-custom" src="${pageContext.request.contextPath}/static/images/goTop.gif" />
    </a>
</div>

<footer>
    <div class="content">
        <ul class="am-avg-sm-5 am-avg-md-5 am-avg-lg-5 am-thumbnails">
            <li><a href="#">联系我们</a></li>
            <li><a href="#">加入我们</a></li>
            <li><a href="#">合作伙伴</a></li>
            <li><a href="#">广告及服务</a></li>
            <li><a href="#">友情链接</a></li>
        </ul>
        <p>lost and found<br>© 2018 copyright</p>
        <div class="w2div">
            <ul data-am-widget="gallery" class="am-gallery am-avg-sm-2
  am-avg-md-2 am-avg-lg-2 am-gallery-overlay" data-am-gallery="{ pureview: true }" >
                <li class="w2">
                    <div class="am-gallery-item">
                        <a href="${pageContext.request.contextPath}/static/images/dd.jpg" tppabs="http://www.17sucai.com/preview/446841/2017-02-16/meng/Temp-images/dd.jpg">
                            <img src="${pageContext.request.contextPath}/static/images/dd.jpg" tppabs="http://www.17sucai.com/preview/446841/2017-02-16/meng/Temp-images/dd.jpg" />
                            <h3 class="am-gallery-title">订阅号：lost and found</h3>
                        </a>
                    </div>
                </li>
                <li   class="w2">
                    <div class="am-gallery-item">
                        <a href="${pageContext.request.contextPath}/static/images/dd.jpg" tppabs="http://www.17sucai.com/preview/446841/2017-02-16/meng/Temp-images/dd.jpg">
                            <img src="${pageContext.request.contextPath}/static/images/dd.jpg" tppabs="http://www.17sucai.com/preview/446841/2017-02-16/meng/Temp-images/dd.jpg"/>
                            <h3 class="am-gallery-title">服务号：lost and found</h3>
                        </a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</footer>
</body>
</html>
<script>
    layui.use(['laytpl'], function () {
        $.post('/wupingController/getAllWuping',  function (data) {
            var getTpl = demo1.innerHTML
                , view = document.getElementById('view')
                , laytpl = layui.laytpl;

            function flash(data) {
                laytpl(getTpl).render(data, function (html) {
                    view.innerHTML = html;
                });
            }

            flash(data);
        });
    });
</script>
