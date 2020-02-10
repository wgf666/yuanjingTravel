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
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />

    <title>航空信息管理</title>
</head>
<body id="airBody">
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 航空信息管理 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">

    <div class="text-c">
        <div class="row cl ">
            <div class="formControls col-3">
                航空公司名: <input type="text" class="input-text" style="width: 250px" id="ariName" value="${checkName}"/>
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

    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l">
            <a href="javascript:;" id="batchId" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
            <a href="javascript:;" onclick="air_add('添加航空公司','back/air/addAir.jsp','','210')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加航空公司</a></span>
    </div>

        <table id="policyListTable" class="table table-border table-bordered table-hover table-bg">
            <thead>
            <tr>
                <th scope="col" colspan="6">航空信息管理</th>
            </tr>
            <tr class="text-c">
                <th width="25"><input type="checkbox" value="" id="all"></th>
                <th width="40">ID</th>
                <th width="200">航空公司</th>
                <th width="70">操作</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach items="${pageInfo.list}" var="air">
                <tr class="text-c">
                    <td><input type="checkbox" value="${air.id}" name="single"></td>
                    <td>${air.id}</td>
                    <td>${air.ariName}</td>
                    <td class="f-14">
                        <a title="编辑" href="javascript:;" onclick="air_edit('用户编辑','back/air/updateById/${air.id}','','200')" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
                        <a title="删除" href="javascript:;" onclick="air_del(this,${air.id})" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
                    </td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    <jsp:include page="/common/page.jsp">
        <jsp:param name="bodyId" value="airBody"/>
    </jsp:include>
    </div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script type="text/javascript">
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
                url:"back/air/batchDelId",
                type:"GET",
                data:"param="+arr,
                success:function (data) {
                    if(data>0){
                        layer.msg('批量删除成功！！!',{icon:6,time:2000});
                        //location.reload();
                    }else{
                        layer.msg('批量删除失败！！!',{icon:5,time:1000});
                    }

                }
            })
        })

    })

    //模糊查询
    function selectByCondition() {
        var ariName=$("#ariName").val();
        $("#airBody").load("back/air/getAirByName",{"ariName":ariName});
    }

    /*航空-添加*/
    function air_add(title,url,w,h){
        layer_show(title,url,w,h);
    }

    /*航空-编辑*/
    function air_edit(title,url,w,h){
        /*location.href=url;*/
        layer_show(title,url,w,h);
    }
    /*航空-删除*/
    function air_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){

            $.ajax({
                url:"back/air/deleteById",
                type:"GET",
                data:"id="+id,
                success:function(data){
                    if(data>0){
                        $(obj).parents("tr").remove();
                        layer.msg('已删除!',{icon:6,time:1000});
                    }else{
                        layer.msg('删除失败!',{icon:5,time:1000});
                    }
                }
            })
        });
    }
</script>
</body>
</html>
