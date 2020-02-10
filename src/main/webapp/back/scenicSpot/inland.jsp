<%--
  Created by IntelliJ IDEA.
  User: wgf1997
  Date: 2019/12/21
  Time: 13:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
    <title>国内线路</title>
</head>
<body id="userBody">
<nav class="breadcrumb">
    <i class="Hui-iconfont">&#xe67f;</i> 首页
    <span class="c-gray en">&gt;</span> 景点管理 <span class="c-gray en">&gt;</span> 国内线路 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">
    <div class="text-c">
        <div class="row cl ">
            <div class="formControls col-6">
                地区:
                <select id="role">
                    <option value="-1">请选择</option>
                    <c:forEach items="${set}" var="arrange">
                        <option value="${arrange}">${arrange}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="formControls col-6">
                省份:
                <select id="type">

                </select>
            </div>
        </div>
        <div class="row cl">
            <div class="cl pd-5">
                <button type="button"
                        class="btn btn-success radius" id="query">
                    <i class="Hui-iconfont">&#xe665;</i> 搜索
                </button>
            </div>
        </div>
    </div>
    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l">
            <a href="javascript:;" onclick="addScenicSpot('添加新景点','back/scenicSpot/addScenicSpot.jsp','800','500')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加新景点</a>
        </span>
        <table class="table table-border table-bordered table-bg" id="authorization">
            <%--动态填充查询的用户/菜单页面信息--%>
        </table>

    </div>
    <script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
    <script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
    <script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="js/H-ui.js"></script>
    <script type="text/javascript" src="js/H-ui.admin.js"></script>
    <script type="text/javascript">
        $(function(){

            //查省份
            $("#query").click(function(){
                //判断是否选择了角色和类型
                var role = $("#role").val();
                var type = $("#type").val();
                if(role==-1){
                    //提示选择地区
                    layer.msg('请选择地区!', {icon: 5,time:2000});
                    return;
                }

                //发送异步请求去查询信息
                    //auth/getAuthUserByRoleId?roleId=2
                    $("#authorization").load("back/scenicSpot/getList",{"id":type,"arrange":role});
                    //选择的菜单
                    //$("#authorization").load("back/scenicSpot/getList",{"arrange":role});
            })

            //异步查城市
            $("#role").change(function(){
                var arrange = $(this).val();
                //alert(arrange);
                $.ajax({
                    url:"back/scenicSpot/getSpecialByArrange",
                    type:"GET",
                    data:"arrange="+encodeURI(encodeURI(arrange)),
                    success:function(data){
                        //alert(data);
                        var a=JSON.parse(data);
                        $("#type").empty();
                        $("#type").append('<option value="-1">请选择</option>');
                        var str = '';
                        for(var i in a) {//循环添加至str中
                            str += '<option value="'+ i +'">'+a[i]+'</option>';
                        }
                        $("#type").append(str);
                    }
                })
            })

        })

        /*添加景点*/
        function addScenicSpot(title,url,w,h){
            location.href=url;
        }


    </script>
</div>
</body>
</html>
