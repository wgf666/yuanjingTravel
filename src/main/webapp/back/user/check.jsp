<%--
  Created by IntelliJ IDEA.
  User: wgf1997
  Date: 2019/12/19
  Time: 19:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
    <link href="lib/icheck/icheck.css" rel="stylesheet" type="text/css" />
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
    <!--[if IE 6]>
    <script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <title>用户详情</title>
    <style type="text/css">
        body{font-size:20px;}
        label{font-size:20px;}
    </style>
</head>
<body>
<div class="pd-20">

        <div class="row cl">
            <label class="form-label col-4"></label>
            <label class="form-label col-1">账号：</label>
            <div class="formControls col-3">
                <input type="text" disabled="disabled" class="input-text" value="${user.name}" placeholder="">
            </div>
            <div class="col-4"></div>
        </div>
        <br/>


        <div class="row cl">
            <label class="form-label col-4"></label>
            <label class="form-label col-1">密码：</label>
            <div class="formControls col-3">
                <input type="text" disabled="disabled" class="input-text" value="${user.password}" placeholder="">
            </div>
            <div class="col-4"></div>
        </div>
        <br/>


        <div class="row cl">
            <label class="form-label col-4"></label>
            <label class="form-label col-">性别：&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <div class="formControls col-5 skin-minimal">
            <div class="radio-box">
                <c:if test="${user.sex==1}"><label for="sex-1">男</label></c:if>
                <c:if test="${user.sex==0}"><label for="sex-1">女</label></c:if>
                <input type="radio" id="sex-1" name="sex" value="单选" checked="checked" style=" width:15%"/>
            </div>
            <div class="radio-box">
                <label for="sex-1">年龄：</label>
                <input type="text" disabled="disabled" class="input-text" value="${user.age}" placeholder="" style=" width:25%"/>
            </div>
        </div>
        </div>
        <br/>

        <div class="row cl">
            <label class="form-label col-4"></label>
            <label class="form-label col-2">证件类型：&nbsp;&nbsp;</label>
            <div class="formControls col-2">
                    <c:if test="${user.idType==1}">
                        <input type="text" class="input-text" value="身份证" disabled="disabled"/>
                    </c:if>
                    <c:if test="${user.idType==0}">
                        <input type="text" class="input-text" value="护照" disabled="disabled"/>
                    </c:if>
            </div>
        </div>
        <br/>

        <div class="row cl">
            <label class="form-label col-4"></label>
            <label class="form-label col-1">证件号：</label>
            <div class="formControls col-3">
                <input type="text" class="input-text" value="${user.idCard}" disabled="disabled"/>
            </div>
        </div>
        <br/>


        <div class="row cl">
            <label class="form-label col-4"></label>
            <label class="form-label col-1">电话：</label>
            <div class="formControls col-3">
                <input type="text" class="input-text" value="${user.phone}" disabled="disabled"/>
            </div>
        </div>

        <br/>
        <div class="row cl">
            <label class="form-label col-4"></label>
            <label class="form-label col-1">邮箱：</label>
            <div class="formControls col-3">
                <input type="text" class="input-text" value="${user.eMail}" disabled="disabled"/>
            </div>
        </div>

        <br/>
        <div class="row cl">
            <label class="form-label col-4"></label>
            <label class="form-label col-1">住址：</label>
            <div class="formControls col-3">
            <textarea disabled="disabled" name="address" cols="" rows="" class="textarea" dragonfly="true"
                      onKeyUp="textarealength(this,100)">${user.remark}</textarea>
            </div>
        </div>

        <br/><br/>
        <div class="row cl">
            <div class="col-8 col-offset-5">
                <a id="back" class="btn btn-primary radius" type="button">&nbsp;&nbsp;返回&nbsp;&nbsp;</a>
            </div>
        </div>
</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/icheck/jquery.icheck.min.js"></script>
<script type="text/javascript" src="lib/Validform/5.3.2/Validform.min.js"></script>
<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script type="text/javascript">
    $(function(){

        $("#back").click(function () {
            parent.location.href="back/user/getUserList";
        })
        $('.skin-minimal input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });

        $("#form-admin-add").Validform({
            tiptype:2,
            callback:function(form){
                debugger
                form[0].submit();
                var index = parent.layer.getFrameIndex(window.name);
                parent.$('.btn-refresh').click();
                parent.layer.close(index);
            }
        });

        $("input[class='btn btn-primary radius']").click(function(){
            layer.confirm('确认要提交吗？',function(index){
                $("#form-admin-add").submit();
            });
        })
    });
</script>
</body>
</html>