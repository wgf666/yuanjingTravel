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
    <link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
    <title>酒店信息管理</title>
</head>
<body id="hotelbody">
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 酒店信息管理 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">

    <div class="text-c">
        <div class="row cl ">
            <div class="formControls col-3">
                城市: <input type="text" class="input-text" style="width: 250px" id="cityName" value="${cityName}"/>
            </div>
        </div>
        <div class="row cl">
            <div class="cl pd-5">
                <button type="button"
                        class="btn btn-success radius" onclick="selectByCondition()">
                    <i class="Hui-iconfont">&#xe665;</i> 搜城市
                </button>
            </div>
        </div>
    </div>

    <div class="cl pd-5 bg-1 bk-gray">
        <span class="l">
            <a href="javascript:;" id="batchId" class="btn btn-danger radius">
                <i class="Hui-iconfont">&#xe6e2;</i> 批量删除
            </a>
            <a class="btn btn-primary radius" href="javascript:;" onclick="hotel_add('添加酒店','back/hotel/addHotel.jsp','800','500')">
                <i class="Hui-iconfont">&#xe600;</i> 添加酒店
            </a> </span></span>
    </div>

    <table class="table table-border table-bordered table-hover table-bg">
        <thead>
        <tr>
            <th scope="col" colspan="6">酒店信息管理</th>
        </tr>
        <tr class="text-c">
            <th width="25"><input type="checkbox" value="" id="all"></th>
            <th width="40">ID</th>
            <th width="200">城市</th>
            <th>酒店名字</th>
            <th width="300">酒店地址</th>
            <th width="70">操作</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach items="${pageInfo.list}" var="hotel">
        <tr class="text-c">
            <td><input type="checkbox" value="${hotel.id}" name="single"></td>
            <td>${hotel.id}</td>
            <td>${hotel.city}</td>
            <td>${hotel.grogshopName}</td>
            <td>${hotel.address}</td>
            <td class="f-14">
                <a title="编辑" href="javascript:;" onclick="hotel_edit('酒店编辑','grogshop/updateById/${hotel.id}')" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
                <a title="删除" href="javascript:;" onclick="hotel_del(this,${hotel.id})" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
            </td>
        </tr>
        </c:forEach>

        </tbody>
    </table>

<jsp:include page="/common/page.jsp">
    <jsp:param name="bodyId" value="hotelbody"/>
</jsp:include>
</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script type="text/javascript">
    $(function(){
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
                url:"grogshop/batchDelId",
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
    /*按条件查询用户信息*/
    function selectByCondition(){
        //获取输入的用户名
        var cityName = $("#cityName").val();
        //发送请求地址到后端，按条件查询用户信息
        //给<body>标签去加载一个页面的数据
        $("#hotelbody").load("grogshop/selectByCondition",{"cityName":cityName});//requeset content application/json
    }

    /*酒店-编辑*/
    function hotel_edit(title,url,id,w,h){
        location.href=url;
    }

    /*酒店-add*/
    function hotel_add(title,url,w,h){
        layer_show(title,url,w,h);
    }
    /*酒店-删除*/
    function hotel_del(obj,id){
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
