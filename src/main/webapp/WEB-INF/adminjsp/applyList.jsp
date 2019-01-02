<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>数据操作 - 数据表格</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/style/admin.css" media="all">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/images/失物招领.png"/>
</head>
<body>

<div class="layui-card layadmin-header">
    <div class="layui-breadcrumb" lay-filter="breadcrumb">
        <a lay-href="">主页</a>
        <a><cite>组件</cite></a>
        <a><cite>数据表格</cite></a>
        <a><cite>数据操作</cite></a>
    </div>
</div>

<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">数据操作</div>
                <div class="layui-card-body">
                    <div class="layui-btn-group test-table-operate-btn" style="margin-bottom: 10px;">
                        <button class="layui-btn" data-type="getCheckData">获取选中行数据</button>
                        <button class="layui-btn" data-type="getCheckLength">获取选中数目</button>
                        <button class="layui-btn" data-type="isAll">验证是否全选</button>
                    </div>

                    <table class="layui-hide" id="test-table-operate" lay-filter="test-table-operate"></table>

                    <script type="text/html" id="test-table-operate-barDemo">
                        <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
                        <a class="layui-btn layui-btn-xs" lay-event="agree0">同意</a>
                        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="refuse0">拒绝</a>
                    </script>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/layuiadmin/layui/layui.js"></script>
<script>
    layui.config({
        base: '${pageContext.request.contextPath}/layuiadmin/' //静态资源所在路径
    }).extend({
        index: 'lib/index' //主入口模块
    }).use(['index', 'table','laytpl'], function(){
        var table = layui.table
            ,admin = layui.admin
            ,laytpl = layui.laytpl;

        table.render({
            elem: '#test-table-operate'
            ,url: "${pageContext.request.contextPath}/applyController/getAllApply"
            ,parseData:function (res) {
                return{
                    "code":res.status,
                    "count":res.payload.total,
                    "data":res.payload.list
                };
            }
            ,method:'post'
            ,width: admin.screen() > 1 ? 875 : ''
            ,height: 475
            ,cols: [[
                {type:'checkbox', fixed: 'left'}
                ,{field:'id', width:80, title: 'ID', sort: true, fixed: 'left'}
                ,{field:'username', width:80, title: '用户名',templet:function (d) {
                    return d.user.username;
                }}
                ,{field:'tid', width:120, title: '物品标题',templet:function (d) {
                    return d.wuping.title;
                }}
                ,{field:'content', width:120, title: '申领内容'}
                ,{field:'reason', width: 160, title: '申领原因'}
                ,{field:'flag', width:80, title: '状态',fixed: 'right',templet:function (d) {
                    if (d.flag==1){
                        return '<button class="layui-btn layui-btn-normal layui-btn-xs">已同意</button>';
                    }
                    if (d.flag==2){
                        return '<button class="layui-btn layui-btn-danger layui-btn-xs">已拒绝</button>'
                    }
                    return '<button class="layui-btn layui-btn-primary layui-btn-xs">未审核</button>';
                }}
                ,{width:178, align:'center', title:'操作',fixed: 'right', toolbar: '#test-table-operate-barDemo'}
            ]]
            ,page: true
            ,request:{
                pageName:'pageNow'
                ,limitName:'pageSize'
            }
        });

        //监听表格复选框选择
        table.on('checkbox(test-table-operate)', function(obj){
            console.log(obj)
        });
        //监听工具条
        table.on('tool(test-table-operate)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail'){
                layer.open({
                    type:2
                    ,title:'申请详细信息'
                    ,content:'/applyForm'
                    ,maxmin:true
                    ,area:['500px','450px']
                    ,success:function (layero,index) {
                        var othis=layero.find('iframe').contents().find('#layuiadmin-form-useradmin').click();
                        othis.find('input[name="id"]').val(data.id);
                        othis.find('input[name="username"]').val(data.user.username);
                        othis.find('input[name="title"]').val(data.wuping.title);
                        othis.find('textarea[name="content"]').val(data.content);
                        othis.find('textarea[name="reason"]').val(data.reason);
                        othis.find('input[name="status"]').val(data.flag==='0'?'未审核':'已审核');
                    }
                })
            } else if(obj.event === 'agree0'){
               $.ajax({
                   url:'${pageContext.request.contextPath}/applyController/changeFlag',
                   type:'get',
                   data:{flag:1,id:data.id},
                   success:function (data) {
                       obj.update({
                           flag:1
                       });
                       layer.msg('已同意申请！')
                   }
               })
            }else if(obj.event === 'refuse0'){
                $.ajax({
                    url:'${pageContext.request.contextPath}/applyController/changeFlag',
                    type:'get',
                    data:{flag:2,id:data.id},
                    success:function (data) {
                        obj.update({
                            flag:2
                        });
                        layer.msg('已拒绝申请！')
                    }
                })
            }
        });

        var $ = layui.$, active = {
            getCheckData: function(){ //获取选中数据
                var checkStatus = table.checkStatus('test-table-operate')
                    ,data = checkStatus.data;
                layer.alert(JSON.stringify(data));
            }
            ,getCheckLength: function(){ //获取选中数目
                var checkStatus = table.checkStatus('test-table-operate')
                    ,data = checkStatus.data;
                layer.msg('选中了：'+ data.length + ' 个');
            }
            ,isAll: function(){ //验证是否全选
                var checkStatus = table.checkStatus('test-table-operate');
                layer.msg(checkStatus.isAll ? '全选': '未全选')
            }
        };

        $('.test-table-operate-btn .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

    });
</script>
</body>
</html>
