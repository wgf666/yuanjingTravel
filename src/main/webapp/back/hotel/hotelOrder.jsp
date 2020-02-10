<%--
  Created by IntelliJ IDEA.
  User: wgf1997
  Date: 2019/12/19
  Time: 11:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="lib/html5.js"></script>
    <script type="text/javascript" src="lib/respond.min.js"></script>
    <script type="text/javascript" src="lib/PIE_IE678.js"></script>
    <![endif]-->
    <link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
    <!--[if IE 6]>
    <script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <title>酒店订单管理</title>
</head>
<body id="hotelId">
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 酒店订单管理 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">

    <div class="text-c">
        <div class="row cl ">
            <div class="formControls col-4">
                用户名： <input type="text" value="${Hname}" class="input-text" id="Hname" style="width: 250px">
                <input type="hidden" id="status" value="${status}">
            </div>
        </div>
        <div class="row cl">
            <div class="cl pd-5">
                <button type="button"
                        class="btn btn-success radius" onclick="selectByCondition()">
                    <i class="Hui-iconfont">&#xe665;</i> 搜索
                </button>
            </div>
        </div>
    </div>

    <div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l">
        <a href="javascript:;" id="batchId" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
        <a class="btn btn-primary radius" href="back/hotel/getList/0">
                <i class="Hui-iconfont">&#xe601;</i> 已处理订单
            </a>
        <a class="btn btn-primary radius" href="back/hotel/getList/1">
                <i class="Hui-iconfont">&#xe601;</i> 未处理订单
            </a> </span>
    </span> </div>
    <table class="table table-border table-bordered table-bg">
        <thead>
        <tr>
            <th scope="col" colspan="9">酒店订单列表</th>
        </tr>
        <tr class="text-c">
            <th width="25"><input type="checkbox" id="all" value=""></th>
            <th width="40">订单ID</th>
            <th width="210">用户名</th>
            <th width="100">是否已处理</th>
            <th width="40">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pageInfo.list}" var="hotel">

        <tr class="text-c">
            <td><input type="checkbox" value="${hotel.id}" name="single"></td>
            <td>${hotel.id}</td>
            <td>
                <a style="font-size: 17px" onclick="hotel_order_check('${hotel.name}订单详情','back/hotel/getHotelById/${hotel.id}','800','720')">
                        ${hotel.name}</a>
            </td>
            <td class="td-status">
                <c:if test="${hotel.status==1}">
                    <span class="label label-success radius" style="font-size: 10px">未处理</span>
                </c:if>
                <c:if test="${hotel.status==0}">
                    <span class="label label-default radius" style="font-size: 10px">已处理</span>
                </c:if>

            </td>
            <td class="td-manage">
                <c:if test="${hotel.status==1}">
                    <a style="text-decoration:none" onclick="hotel_stop(this,${hotel.id})" href="javascript:;" title="处理"><i class="Hui-iconfont">&#xe631;</i></a>
                </c:if>
                <c:if test="${hotel.status==0}">
                    <a onClick="hotel_start(this,id)" href="javascript:;" title="处理" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>
                </c:if>
                <a title="删除" href="javascript:;" onclick="hotel_del(this,${hotel.id})" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
        </tr>
        </c:forEach>
        </tbody>
    </table>

    <jsp:include page="/common/page.jsp">
        <jsp:param name="bodyId" value="hotelId"/>
    </jsp:include>
</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script type="text/javascript">
    /*
        参数解释：
        title	标题
        url		请求的url
        id		需要操作的数据id
        w		弹出层宽度（缺省调默认值）
        h		弹出层高度（缺省调默认值）
    */

    $(function(){

        //全选
        $("#all").click(function () {
            $("input[name='single']").attr("checked",$(this).prop("checked"));
        })

        $("input[name='single']").click(function () {
            var chLength = $("input[name='single']:checked").length; //单选选中的个数
            var length = $("input[name='single']").length;  //单选的总个数
            if(chLength==length){
                debugger
                //选中个数==总个数，则全选选中；否则全选不选中
                $("#all").prop("checked",true);
            }else{
                $("#all").attr("checked",false);
            }
        })

        //批量删除
        $("#batchId").click(function(){
            //定义数组，遍历得到每个选中的id
            //alert();
            var arr = new Array();
            $("input[name='single']:checked").each(function(){
                arr.push($(this).val());  //存储遍历的每个单选的id
            })
            //判断是否选择数据
            if(arr.length==0){
                layer.msg('请先选择需要删除的数据',{icon:6,time:3000});
                return;
            }
            //异步删除
            $.ajax({
                url:"back/hotel/batchDelId",
                type:"GET",
                data:"param="+arr,
                success:function (data) {
                    if(data>0){
                        layer.msg('批量删除成功！！!',{icon:6,time:2000});
                    }else{
                        layer.msg('批量删除失败！！!',{icon:5,time:1000});
                    }
                    location.reload();
                }
            })
        })

    })

    //模糊查询
    function selectByCondition(){
        //alert();
        //获取输入的用户名
        var Hname = $("#Hname").val();
        var status = $("#status").val();
        //发送请求地址到后端，按条件查询用户信息
        //给<body>标签去加载一个页面的数据
        $("#hotelId").load("/back/hotel/selectByCondition",{"Hname":Hname,"status":status});//requeset content application/json
    }

    //酒店订单详情
    function hotel_order_check(title,url,w,h){
        layer_show(title,url,w,h);
    }


    /*酒店订单-删除*/
    function hotel_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            //此处请求后台程序，下方是成功后的前台处理……
            $.ajax({
                url: "/back/hotel/deleteById",
                type: "GET",
                data: "id=" + id,
                success: function (data) {
                    if(data>0){
                        $(obj).parents("tr").remove();
                        layer.msg('已删除!',{icon:6,time:2000});
                    }else{
                        layer.msg('删除失败！！!',{icon:5,time:1000});
                    }
                }
            })

        });
    }
    /*酒店订单-停用*/
    function hotel_stop(obj,id){
        layer.confirm('您是否已经核对信息，一旦处理成功将不可修改，确认要处理此订单吗？',function(index){
            //此处请求后台程序，下方是成功后的前台处理……
            //alert();

            $.ajax({
                url:"/back/hotel/updateByStatus",
                type:"GET",
                data:"id="+id,
                success:function(data){
                    //alert(data);
                    if(data>0){
                        $(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_start(this,id)" href="javascript:;" title="处理" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>');
                        $(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">已处理</span>');
                        $(obj).remove();
                        layer.msg('该订单已处理完毕!',{icon: 6,time:2000});
                        return;
                    }else{
                        layer.msg('处理失败！！!',{icon: 5,time:1000});
                        return;

                    }
                }

            })

        });
    }

    /*酒店订单-启用*/
    function hotel_start(obj,id){
            layer.msg('该订单已处理，请处理其他订单！', {icon: 5,time:2000});
    }
</script>
</body>
</html>
