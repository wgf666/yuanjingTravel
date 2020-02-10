<%--
  Created by IntelliJ IDEA.
  User: wgf1997
  Date: 2019/12/18
  Time: 21:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/H-ui.login.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
    <title>后台登录 - H-ui.admin v2.3</title>
</head>
<body>
<input type="hidden" id="TenantId" name="TenantId" value="" />
<div class="header"></div>
<div class="loginWraper">
    <div id="loginform" class="loginBox">
        <form id="form" class="form form-horizontal" action="back/login" method="post">
            <div class="row cl">
                <label class="form-label col-3"><i class="Hui-iconfont">&#xe60d;</i></label>
                <div class="formControls col-8">
                    <input id="name" name="name" type="text" placeholder="账户" class="input-text size-L">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-3"><i class="Hui-iconfont">&#xe60e;</i></label>
                <div class="formControls col-8">
                    <input id="password" name="password" type="password" placeholder="密码" class="input-text size-L">
                </div>
            </div>

            <div class="row cl">
                <div class="formControls col-8 col-offset-3">
                    <input class="input-text size-L" id="CODE" name="CODE" type="text" placeholder="验证码" onblur="if(this.value==''){this.value='验证码:'}" onclick="if(this.value=='验证码:'){this.value='';}" value="验证码:" style="width:150px;">
                    <img id="cc" onclick="checkCodeFunction()" src="checkCode/back"> <a onclick="checkCodeFunction()" href="javascript:;">看不清，换一张</a> </div>
            </div>

            <div class="row">
                <div class="formControls col-8 col-offset-3">
                    <label for="online">
                        <input type="checkbox" name="rememberMe" id="online">
                        使我保持登录状态</label>
                </div>
            </div>

            <div class="row">
                <div class="formControls col-7 col-offset-3">
                    <input type="button" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input name="" type="reset" class="btn btn-default radius size-L" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
                </div>
            </div>
        </form>
    </div>
</div>
<div class="footer">Copyright 你的公司名称 by H-ui.admin.v2.3</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript">

    $(function(){

        $("#name").blur(function () {
            var name = $("#name").val();
            if(name==null || name==''){
                alert("用户名不能为空！！！");
                return;
            }
        })

        $("input[type='button']").click(function(){
            //alert();

            var name = $("#name").val();
            var password = $("#password").val();
            var CODE = $("#CODE").val();
            if(name==null || name==''){
                alert("请输入用户名！！！");
                return;
            }
            if(password.length==0){
                alert("请输入密码！！");
                return;
            }
            if(CODE=="验证码:"){
                alert("请输入验证码！！");
                return;
            }
            $.ajax({
                url:"/back/checkLogin",
                type:"GET",
                data:"CODE="+CODE,
                success:function(data){
                    //alert(data);
                    if(data==0){
                        alert("验证码错误！！！");
                        return;
                    }else{
                        $("#form").submit();
                    }

                }
            })

        })
    })
    function checkCodeFunction() {
        //alert();
        $.ajax({
            url:"checkCode/back",
            type:"GET",
            success:function(){
                //alert();
                $("#cc").attr("src","checkCode/back");
            }
        })
    }


</script>


</body>
</html>
