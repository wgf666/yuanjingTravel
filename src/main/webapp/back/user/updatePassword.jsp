<%--
  Created by IntelliJ IDEA.
  User: wgf1997
  Date: 2019/12/26
  Time: 9:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <link href="css/H-ui.min.css" rel="stylesheet" type="text/css"/>
    <link href="css/H-ui.admin.css" rel="stylesheet" type="text/css"/>
    <title>Title</title>
</head>
<body>
<div class="pd-20">
    <form action="back/user/changePassword" method="post" class="form form-horizontal" id="form-change-password">
        <input type="hidden" name="id" value="${user.id}">
        <div class="row cl">
            <label class="form-label col-5"><span class="c-red">*</span>账户：</label>
            <div class="formControls col-4"> ${user.fullName} </div>
            <div class="col-4"></div>
        </div>
        <div class="row cl">
            <label class="form-label col-5"><span class="c-red">*</span>新密码：</label>
            <div class="formControls col-4">
                <input type="password" class="input-text" autocomplete="off" placeholder="不修改请留空" name="password"
                       id="new-password" datatype="*6-18" ignore="ignore">
            </div>
            <div class="col-4"></div>
        </div>
        <div class="row cl">
            <label class="form-label col-5"><span class="c-red">*</span>确认密码：</label>
            <div class="formControls col-4">
                <input type="password" class="input-text" autocomplete="off" placeholder="不修改请留空" name="new-password2"
                       id="new-password2" recheck="new-password" datatype="*6-18" errormsg="您两次输入的密码不一致！"
                       ignore="ignore">
            </div>
            <div class="col-4"></div>
        </div>
        <div class="row cl">
            <div class="col-8 col-offset-5">
                <input class="btn btn-primary radius" type="button" value="&nbsp;&nbsp;保存&nbsp;&nbsp;">
            </div>
        </div>
    </form>
</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/Validform/5.3.2/Validform.min.js"></script>
<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script>
    $(function () {
        /*$("#form-change-password").Validform({
            tiptype:2,
            callback:function(form){
                form[0].submit();
                var index = parent.layer.getFrameIndex(window.name);
                parent.layer.close(index);
            }
        });*/

        $("input[type='button']").click(function () {
            //alert();
            var pass = $("#new-password").val();
            var pass1 = $("#new-password2").val();
            if (pass != pass1) {
                //alert(123);
                layer.msg('密码不一致!', {icon: 5, time: 1000});
                return;
            }
            if (pass.length == 0 && pass == pass1) {
                //alert(123);
                parent.location.href = "back/user/getUserList";
                return;
            }

            /*$("#form-change-password").submit();
            layer.confirm('密码修改完成', function (index) {
                parent.location.href = "back/user/getUserList";
            })*/


                var formData = $("#form-change-password").serialize()
                $.ajax({
                    url: "back/user/changePassword",
                    type: 'post',
                    data: formData,
                    success: function (data) {
                        layer.confirm('密码修改完成', function (index) {
                            //layer.closeAll();
                            parent.location.href = "back/user/getUserList";
                        })
                    }
                })
        })

    });
</script>
</body>
</html>
