layui.define([ 'layer',  'table','common','util'], function (exports) {
    var $ = layui.jquery,
        layer = layui.layer,
        common = layui.common,

        util = layui.util,
        table  = layui.table ;


    table.render({
        elem: '#reource'
        ,height: 'full-200'
        ,method:'GET'
        ,url: '/user/list' //数据接口
        ,page: true //开启分页
        ,cols: [[ //表头
            {field: 'num', align:'center', title: '名称',unresize:true}
            ,{field: 'name', align:'center', title: '用户名',unresize:true}
            ,{field: 'phone', align:'center', title: '电话',unresize:true}
            ,{field: 'sex', align:'center', title: '性别',unresize:true}
            ,{field: 'email', align:'center', title: '邮箱',unresize:true}
            ,{field: 'role', align:'center', title: '类型',unresize:true,templet: '#status'}
            // ,{field: 'time', align:'center', title: '创建时间',unresize:true,}
            ,{fixed: 'right', title:'操作',align:'center',width:'200',toolbar: '#operator',unresize:true}
        ]]
    });

    //监听工具条
    table.on('tool(table)', function(obj){
        var data = obj.data;
        if(obj.event === 'del'){
            del(data.id);
        } else if(obj.event === 'edit'){
            common.frame_show('编辑','/user/form?id='+data.id);
        }
    });


    //输出接口，主要是两个函数，一个删除一个编辑
    var datalist = {
        deleteData: function (id) {
            layer.confirm('确定删除？', {
                btn: ['确定', '取消'] //按钮
            }, function () {
                del(id);
            }, function () {
            });
        },
        editData: function (id) {
            common.frame_show('编辑','/user/form?id='+id);
        }
    };

    //添加数据
    $('#addResource').click(function () {
        var index = layer.load(1);
        setTimeout(function () {
            layer.close(index);
            common.frame_show('添加','/user/form');
    }, 500);
    });

    function del(id) {
        layer.confirm('真的删除行么', function (index) {
            $.ajax({
                type: "DELETE",
                dataType: "json",
                url: "/user/del/" + id,
                success: function (ret) {
                    if (ret.isOk) {
                        layer.msg("操作成功", {time: 2000}, function () {
                            layer.close(index);
                            window.location.href = "/admin/user/index";
                        });
                    } else {
                        layer.msg(ret.msg, {time: 2000});
                    }
                }
            });
        });
    }
    exports('admin/user/index', datalist);
});