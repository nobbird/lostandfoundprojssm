<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>用户列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layuiadmin/style/admin.css" media="all">
</head>
<body>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">用户列表</div>
                <div class="layui-card-body">
                    <div class="layui-btn-group test-table-operate-btn" style="margin-bottom: 10px;">
                        <button class="layui-btn" data-type="getCheckData">获取选中行数据</button>
                        <button class="layui-btn" data-type="getCheckLength">获取选中数目</button>
                        <button class="layui-btn" data-type="isAll">验证是否全选</button>
                    </div>

                    <table class="layui-hide" id="test-table-operate" lay-filter="test-table-operate"></table>

                    <script type="text/html" id="test-table-operate-barDemo">
                        <a class="layui-btn layui-btn-xs layui-btn-xs" lay-event="detail">查看</a>
                        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
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
    }).use(['index', 'table','layer'], function(){
        var table = layui.table
            ,admin = layui.admin
            ,layer = layui.layer;

        table.render({
            elem: '#test-table-operate'
            ,url: "${pageContext.request.contextPath}/adminController/getAllUser"
            ,method: 'post'
            ,parseData:function (res) {
                return{
                    "code":res.status,
                    "count":res.payload.total,
                    "data":res.payload.list
                };
            }
            ,request:{
                pageName:'pageNow'
                ,limitName:'pageSize'
            }
            ,width: admin.screen() > 1 ? 776 : ''
            ,height: 475
            ,cols: [[
                {type:'checkbox', fixed: 'left'}
                ,{field:'id', width:80, title: 'ID', sort: true, fixed: 'left'}
                ,{field:'username', width:110, title: '用户名'}
                ,{field:'usernumb', width: 130, title: '学号'}
                ,{field:'usertel', width:135, title: '手机号码'}
                ,{field:'useremail', width:135, title: '邮箱'}
                ,{width:130,title:'操作', align:'center', fixed: 'right', toolbar: '#test-table-operate-barDemo'}
            ]]
            ,page: true
        });

        //监听表格复选框选择
        table.on('checkbox(test-table-operate)', function(obj){
            console.log(obj)
        });
        //监听工具条
        table.on('tool(test-table-operate)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail') {
                layer.open({
                    type: 2
                    , title: '用户详细信息'
                    , content: '/userInfoForm'
                    , maxmin: true
                    , area: ['500px', '450px']
                    ,success:function (layero, index) {
                    var othis = layero.find('iframe').contents().find('#layuiadmin-userform-useradmin').click();
                    othis.find('input[name="id"]').val(data.id);
                    othis.find('input[name="username"]').val(data.username);
                    othis.find('input[name="usernumb"]').val(data.usernumb);
                    othis.find('input[name="usertel"]').val(data.usertel);
                    othis.find('input[name="useremail"]').val(data.useremail);
                }
            })
            } else if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del();
                    layer.close(index);
                });
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

