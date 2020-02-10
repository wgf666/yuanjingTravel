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
    <title>Title</title>
</head>
<body id="userBody">
<div class="pd-20">
    <div class="text-c">
        <div class="row cl ">
            <div class="formControls col-3">
                用户名: <input type="text" class="input-text" style="width: 250px" id="username" value="${userName}"/>
            </div>
        </div>
        <div class="row cl">
            <div class="cl pd-5">
                <button type="button"
                        class="btn btn-success radius" onclick="selectByCondition()">
                    <i class="Hui-iconfont">&#xe665;</i> 搜用户
                </button>
            </div>
        </div>
    </div>
    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l">
            <a href="javascript:;" onclick="batchAddUser()" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 批量授权</a>
        </span>
    </div>
    <table class="table table-border table-bordered table-bg">
        <thead>
        <tr>
            <th scope="col" colspan="9">员工列表</th>
        </tr>
        <tr class="text-c">
            <th width="25"><input type="checkbox" name="" value=""></th>
            <th width="40">ID</th>
            <th width="150">用户名</th>
            <th width="90">手机</th>
            <th width="150">邮箱</th>
            <th width="150">生日</th>
            <th width="130">个人简介</th>
            <th width="100">操作</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach items="${pageInfo.list}" var="sysUser">
            <tr class="text-c">
                <td><input type="checkbox" value="${sysUser.userId}" class="checkedBox"></td>
                <td>${sysUser.userId}</td>
                <td>${sysUser.userName}</td>
                <td>${sysUser.phone}</td>
                <td>${sysUser.email}</td>
                <td>
                    <fmt:formatDate value="${sysUser.birthday}" pattern="yyyy-MM-dd"></fmt:formatDate>
                </td>
                <td>${sysUser.introduce}</td>
                <td class="td-manage"><a style="text-decoration:none" onClick="admin_stop(this,'10001')" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a> <a title="编辑" href="javascript:;" onclick="admin_edit('管理员编辑','admin-add.html','1','800','500')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a> <a title="删除" href="javascript:;" onclick="admin_del(this,'1')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <%--引入page.jsp--%>
   <%-- <%@include file="/common/page.jsp"%>--%>
    <jsp:include page="/common/page.jsp">
        <jsp:param name="bodyId" value="userBody"></jsp:param>
    </jsp:include>
</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script type="text/javascript">
    /*按条件查询用户信息*/
    function selectByCondition(){
        //获取输入的用户名
        var userName = $("#username").val();
        //发送请求地址到后端，按条件查询用户信息
        //给<body>标签去加载一个页面的数据
        $("#userBody").load("auth/getNoAuthUserByRoleId",{"userName":userName,"roleId":${roleId}});//requeset content application/json
    }

    function batchAddUser(){
            //找到所有的被选中的复选框
        var checkedBox =$(".checkedBox:checked");

        if(checkedBox.length==0){
            layer.msg("请选择授权用户",{"icon":5});
            return;
        }

        //数组用来装选中用户id
        var ids = [];
        for(var i=0;i<checkedBox.length;i++){
            ids.push(checkedBox[i].value);
        }

        //发送异步请求，把数据带到后端，往角色用户关系表中添加数据
        $.ajax({
            url:"auth/batchAddUser",
            type:"GET",
            data:"ids="+ids+"&roleId="+${roleId},
            success:function(data){
                //给予操作提示
                //{"result":true,"data":""}
                if(data.result){
                    //操作成功
                    layer.msg("批量授权用户成功!",{"icon":6},function(){
                        parent.$(".layui-laypage-refresh")[0].click();
                        //当你在iframe页面关闭自身时
                        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                        parent.layer.close(index); //再执行关闭
                    });
                }else{
                    //操作失败
                    layer.msg("批量授权用户失败!",{"icon":5});
                }
            }
        })
    }
</script>
</body>
</html>
