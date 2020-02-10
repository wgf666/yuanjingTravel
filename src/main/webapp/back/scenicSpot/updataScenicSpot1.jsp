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
    <title>修改景点信息</title>
</head>
<body>
<div class="pd-20">
    <form action="back/scenicSpot/update" method="post" class="form form-horizontal" id="form-admin-add">
        <input type="hidden" name="id" value="${scenicSpot.id}"/>

        <div class="row cl">
            <label class="form-label col-3"></label>
            <label class="form-label col-2">城市：</label>
            <div class="formControls col-4">
                <input type="text" name="scenicName" class="input-text" value="${scenicSpot.scenicName}" placeholder="">
            </div>
        </div>


        <div class="row cl">
            <label class="form-label col-3"></label>
            <label class="form-label col-2">线路介绍：</label>
            <div class="formControls col-4">
            <textarea  name="scenicIntroduction" cols="" rows="" class="textarea" dragonfly="true"
                       onKeyUp="textarealength(this,100)">${scenicSpot.scenicIntroduction}</textarea>
            </div>
        </div>


        <div class="row cl">
            <label class="form-label col-3"></label>
            <label class="form-label col-2">图片：</label>
            <div class="formControls col-4">
                <input type="file" alt="未"/>
                <img src="${scenicSpot.image}" width="100" height="100"/>
            </div>
            <div class="col-4"></div>
        </div>


        <div class="row cl">
            <label class="form-label col-3"></label>
            <label class="form-label col-2">票价：</label>
            <div class="formControls col-4">
                <input type="text" name="ticketPrice" class="input-text" value="${scenicSpot.ticketPrice}" placeholder="">
            </div>
            <div class="col-4"></div>
        </div>


        <div class="row cl">
            <label class="form-label col-3"></label>
            <label class="form-label col-2">活动时间：</label>
            <div class="formControls col-4">
                <input type="text" name="time" class="input-text" value="${scenicSpot.time}" placeholder="">
            </div>
            <div class="col-4"></div>
        </div>


        <div class="row cl">
            <label class="form-label col-3"></label>
            <label class="form-label col-2">折扣价：</label>
            <div class="formControls col-4">
                <input type="text" name="discount" class="input-text" value="${scenicSpot.discount}" />
            </div>
        </div>


        <div class="row cl">
            <div class="col-8 col-offset-5">
                <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
    $(function(){

        //日期转换
        var a=$("input[name='time']").val();
        var date = new Date(a)
        var m=(date.getMonth() + 1);
        var d=date.getDate();
        if((date.getMonth() + 1)<10){
            m="0"+(date.getMonth() + 1);
        }
        if(date.getDate()<10){
            d="0"+date.getDate();
        }
        var Str=date.getFullYear() + '-' +
            m + '-' +
            d
        $("input[name='time']").val(Str)
        //alert(Str);

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

        $("input[type='submit']").click(function () {

            parent.location.href="back/scenicSpot/getArrangeByForeign"
        })
    });
</script>
</body>
</html>
