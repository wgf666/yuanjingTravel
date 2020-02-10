<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2019/12/9
  Time: 16:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<base href="${pageContext.request.contextPath}/">
<link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
<head>
    <title>国内线路</title>
</head>
<body id="authorization">
<table class="table table-border table-bordered table-bg">
    <thead>
    <tr>
        <th scope="col" colspan="9">国内线路列表</th>
    </tr>
    <tr class="text-c">
        <th width="25"><input type="checkbox" name="" value=""></th>
        <th width="40">ID</th>
        <th width="40">城市</th>
        <th width="90">线路介绍</th>
        <th width="90">图片</th>
        <th width="90">票价</th>
        <th width="90">活动时间</th>
        <th width="90">折扣</th>
        <th width="100">操作</th>
    </tr>
    </thead>
    <tbody>

    <c:forEach items="${pageInfo.list}" var="inland">
        <tr class="text-c">
            <td><input type="checkbox" value="1" name=""></td>
            <td>${inland.id}</td>
            <td>${inland.scenicName}</td>
            <td>${inland.scenicIntroduction}</td>
            <td><img src="${inland.image}" width="50" height="50"/></td>
            <td>${inland.ticketPrice}</td>
            <td>
                <fmt:formatDate value="${inland.time}" pattern="yyyy-MM-dd"></fmt:formatDate>
            </td>
            <td>${inland.discount}</td>
            <td class="td-manage">
                <a style="text-decoration:none" onClick="admin_stop(this,'10001')" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>
                <a title="编辑" href="javascript:;" onclick="foreign_edit('国内线路编辑','back/scenicSpot/updateForeignById/${inland.id}','900','650')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
                <a title="删除" href="javascript:;" onclick="foreign_del(this,${inland.id})" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<%--引入page.jsp--%>
<jsp:include page="/common/page.jsp">
    <jsp:param name="bodyId" value="authorization"></jsp:param>
</jsp:include>
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
    /*境外线路-编辑*/
    function foreign_edit(title,url,w,h){
        layer_show(title,url,w,h);
    }
    /*管理员-停用*/
    function admin_stop(obj,id){
        layer.confirm('确认要停用吗？',function(index){
            //此处请求后台程序，下方是成功后的前台处理……

            $(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_start(this,id)" href="javascript:;" title="启用" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">已禁用</span>');
            $(obj).remove();
            layer.msg('已停用!',{icon: 5,time:1000});
        });
    }

    /*管理员-启用*/
    function admin_start(obj,id){
        layer.confirm('确认要启用吗？',function(index){
            //此处请求后台程序，下方是成功后的前台处理……


            $(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_stop(this,id)" href="javascript:;" title="停用" style="text-decoration:none"><i class="Hui-iconfont">&#xe631;</i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
            $(obj).remove();
            layer.msg('已启用!', {icon: 6,time:1000});
        });
    }


    //境外线路-删除
    function foreign_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){

            $.ajax({
                url:"back/scenicSpot/delete",
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
