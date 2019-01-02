<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>招领启事</title>
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
                <div class="layui-card-header">招领启事纵览</div>
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
    }).use(['index', 'table','layer','laytpl'], function(){
        var table = layui.table
            ,admin = layui.admin
            ,layer = layui.layer
            ,laytpl=layui.laytpl;

        table.render({
            elem: '#test-table-operate'
            ,url: "${pageContext.request.contextPath}/wupingController/getWupingByPages/1"
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
            ,width: admin.screen() > 1 ? 1046 : ''
            ,height: 475
            ,cols: [[
                {type:'checkbox', fixed: 'left'}
                ,{field:'id', width:80, title: 'ID', sort: true, fixed: 'left'}
                ,{field:'username', width:80, title: '用户名',templet:function (d) {
                    return d.user.username;
                }}
                ,{field:'title', width:120, title: '标题', sort: true}
                ,{field:'content', width: 160, title: '内容'}
                ,{field:'types', width:80, title: '类型'}
                ,{field:'losttime', width:135, title: '丢失时间', sort: true}
                ,{field:'updatetime', width:120, title: '上传时间', sort: true, fixed: 'right'}
                ,{field:'state', width:80, title: '状态', sort: true, fixed: 'right'}
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
            if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    obj.del();
                    layer.close(index);
                });
            }else if(obj.event === 'detail'){
                layer.open({
                    type:2
                    ,title:'启事详细信息'
                    ,content:'/wupingform'
                    ,maxmin:true
                    ,area:['500px', '450px']
                    ,success:function (layero,index) {
                        var othis=layero.find('iframe').contents().find('#layuiadmin-form-useradmin').click();
                        othis.find('input[name="id"]').val(data.id);
                        othis.find('input[name="username"]').val(data.user.username);
                        othis.find('input[name="title"]').val(data.title);
                        othis.find('textarea[name="content"]').val(data.content);
                        othis.find('input[name="losttime"]').val(data.losttime);
                        othis.find('input[name="updatetime"]').val(data.updatetime);
                        console.log(data.status);
                        othis.find('input[name="status"]').val(data.state==='2'?'未领取':'已领取');
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

