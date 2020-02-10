
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
    <title>酒店信息管理</title>

</head>
<body id="orderbody">
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 酒店信息管理 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">

    <div class="text-c">
            <div class="layui-input-block">
                <select id="chaxun" name="authorization">
                    <option value="">查看订单</option>
                    <option value="3">拒绝订单</option>
                    <option value="2">已通过订单</option>
                    <option value="1">等待通过订单</option>

                </select>
                <button type="button"
                        class="btn btn-success radius" onclick="selectByCondition()">
                    <i class="Hui-iconfont">&#xe665;</i> 搜索订单
                </button>
            </div>
    </div>


    <div class="cl pd-5 bg-1 bk-gray">
        <span class="l">
            <a href="javascript:;" onclick="datadel()" class="btn btn-danger radius">
                <i class="Hui-iconfont">&#xe6e2;</i> 批量通过
            </a>
            <a class="btn btn-primary radius" href="javascript:;" onclick="admin_role_add('添加酒店','back/hotel/addHotel.jsp','800','500')">
                <i class="Hui-iconfont">&#xe600;</i> 批量拒绝
            </a> </span></span>
    </div>

    <table class="table table-border table-bordered table-hover table-bg">
        <thead>

        </thead>
        <tbody>



        </tbody>
    </table>

    <jsp:include page="/common/page.jsp">
        <jsp:param name="bodyId" value="orderbody"/>
    </jsp:include>
</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script type="text/javascript">
//     $("#chaxun").change(function () {
//         var chaxun=$(this).val();
//         $.ajax({
//             url:"ScenicSpotOrder/chaxun",
//             type:"post",
//             data:"state="+chaxun,
//             success:function (data) {
//
//             }
//         })
//
//     })



    /*按条件查询用户信息*/
    function selectByCondition(){
        //获取输入的用户名
        var chaxun=$("#chaxun").val();
        //发送请求地址到后端，按条件查询用户信息
        //给<body>标签去加载一个页面的数据
        $("#orderbody").load("ScenicSpotOrder/chaxun",{"state":chaxun});//requeset content application/json
    }

    /*管理员-角色-编辑*/
    function admin_role_edit(title,url,id,w,h){
        location.href=url;
    }

    /*管理员-角色-add*/
    function admin_role_add(title,url,w,h){
        layer_show(title,url,w,h);
    }
    /*管理员-角色-删除*/
    function admin_role_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            //此处请求后台程序，下方是成功后的前台处理……
            $.ajax({
                url:"grogshop/deleteById",
                type:"GET",
                data:"id="+id,
                success:function(data){
                    if(data>0){
                        $(obj).parents("tr").remove();
                        layer.msg('已删除酒店!',{icon:6,time:1000});
                    }else{
                        layer.msg('酒店删除失败!',{icon:5,time:1000});
                    }
                }

            })

        });
    }
</script>
</body>
</html>
