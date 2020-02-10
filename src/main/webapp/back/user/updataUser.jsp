<%--
  Created by IntelliJ IDEA.
  User: wgf1997
  Date: 2019/12/19
  Time: 19:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <link href="css/H-ui.min.css" rel="stylesheet" type="text/css"/>
    <link href="css/H-ui.admin.css" rel="stylesheet" type="text/css"/>
    <link href="lib/icheck/icheck.css" rel="stylesheet" type="text/css"/>
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css"/>
    <!--[if IE 6]>
    <script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js"></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <title>添加管理员</title>
</head>
<body>
<div class="pd-20">
    <form action="back/user/update" method="post" class="form form-horizontal" id="form-admin-add">
        <input type="hidden" name="id" value="${user.id}"/>

        <div class="row cl">
            <label class="form-label col-3"></label>
            <label class="form-label col-1">姓名：</label>
            <div class="formControls col-4">
                <input type="text" name="fullName" class="input-text" value="${user.fullName}" placeholder="">
            </div>
        </div>


        <div class="row cl">
            <label class="form-label col-3"></label>
            <label class="form-label col-1">账号：</label>
            <div class="formControls col-4">
                <input type="text" name="name" class="input-text" value="${user.name}" placeholder="">
            </div>
            <div class="col-4"></div>
        </div>


        <div class="row cl">
            <label class="form-label col-3"></label>
            <label class="form-label col-1">性别：</label>
            <div class="formControls col-5 skin-minimal">
                <c:if test="${user.sex==1 || user.sex eq null}">
                    <div class="radio-box">
                        <input type="radio" id="sex-1" name="sex" value="1" checked="checked" style=" width:15%"/>
                        <label for="sex-1">男</label>
                    </div>
                    <div class="radio-box">
                        <input type="radio" id="sex-2" name="sex" value="0" style=" width:15%"/>
                        <label for="sex-2">女</label>
                    </div>
                </c:if>
                <c:if test="${user.sex==0}">
                    <div class="radio-box">
                        <input type="radio" id="sex-3" name="sex" value="1" style=" width:15%"/>
                        <label for="sex-3">男</label>
                    </div>
                    <div class="radio-box">
                        <input type="radio" id="sex-4" name="sex" value="0" checked="checked" style=" width:15%"/>
                        <label for="sex-4">女</label>
                    </div>
                </c:if>
            </div>
            <%--<div class="formControls col-3">
                年龄：
                <input type="text" name="age" class="input-text" value="${user.age}" style=" width:25%"/>
            </div>--%>
        </div>

        <div class="row cl">
            <label class="form-label col-3"></label>
            <label class="form-label col-1">年龄：</label>
            <div class="formControls col-4">
                <input type="text" name="age" class="input-text" value="${user.age}" style=" width:25%"/>
            </div>
            <div class="col-4"></div>
        </div>

        <div class="row cl">
            <label class="form-label col-2"></label>
            <label class="form-label col-2">证件类型：&nbsp;&nbsp;</label>
            <div class="formControls col-4"><span class="select-box">
                <select class="select" size="1" name="idType" datatype="*" nullmsg="请选择所在城市！">
                    <c:if test="${user.idType==1 || user.idType eq null}">
                        <option value="1" selected="selected">身份证</option>
                        <option value="0">护照</option>
                    </c:if>
                    <c:if test="${user.idType==0}">
                        <option value="1">身份证</option>
                        <option value="0" selected="selected">护照</option>
                    </c:if>
                </select>
            </span>
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-3"></label>
            <label class="form-label col-1">证件号：</label>
            <div class="formControls col-4">
                <input type="text" name="idCard" class="input-text" value="${user.idCard}"/>
            </div>
        </div>


        <div class="row cl">
            <label class="form-label col-3"></label>
            <label class="form-label col-1">电话：</label>
            <div class="formControls col-4">
                <input type="text" name="phone" class="input-text" value="${user.phone}"/>
            </div>
        </div>


        <div class="row cl">
            <label class="form-label col-3"></label>
            <label class="form-label col-1">邮箱：</label>
            <div class="formControls col-4">
                <input type="text" name="eMail" class="input-text" value="${user.eMail}"/>
            </div>
        </div>


        <div class="row cl">
            <label class="form-label col-3"></label>
            <label class="form-label col-1">住址：</label>
            <div class="formControls col-4">
            <textarea name="remark" cols="" rows="" class="textarea" dragonfly="true"
                      onKeyUp="textarealength(this,100)">${user.remark}</textarea>
            </div>
        </div>


        <div class="row cl">
            <div class="col-6 col-offset-4">
                <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a onclick="window.parent.location.reload();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</a>
            </div>
        </div>

    </form>
</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/icheck/jquery.icheck.min.js"></script>
<script type="text/javascript" src="lib/Validform/5.3.2/Validform.min.js"></script>
<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="js/H-ui.js"></script>
<script type="text/javascript" src="js/H-ui.admin.js"></script>
<script type="text/javascript">
    $(function () {
        $('.skin-minimal input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });

        $("#form-admin-add").Validform({
            tiptype: 2,
            callback: function (form) {
                debugger
                form[0].submit();
                var index = parent.layer.getFrameIndex(window.name);
                parent.$('.btn-refresh').click();
                parent.layer.close(index);
            }
        });

    });
</script>
</body>
</html>
