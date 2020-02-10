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
        <label class="form-label col-3"></label>
        <label class="form-label col-2">入住日期：</label>
        <div class="formControls col-2">
            <input type="text" id="start" disabled="disabled" class="input-text" value="${grogshopOrder.startTime}" placeholder="">
        </div>
    </div>
<br/>

    <div class="row cl">
        <label class="form-label col-3"></label>
        <label class="form-label col-2">退房日期：</label>
        <div class="formControls col-2">
            <input type="text" id="end" disabled="disabled" class="input-text" value="${grogshopOrder.endTime}" placeholder="">
        </div>
    </div>
<br/>

        <div class="row cl">
            <label class="form-label col-4"></label>
            <label class="form-label col-1">电话：</label>
            <div class="formControls col-4">
                <input type="text" class="input-text" value="${grogshopOrder.phone}" disabled="disabled"/>
            </div>
        </div>
        <br/>


        <div class="row cl">
            <label class="form-label col-4"></label>
            <label class="form-label col-1">邮箱：</label>
            <div class="formControls col-4">
                <input type="text" class="input-text" value="${grogshopOrder.eMail}" disabled="disabled"/>
            </div>
        </div>

        <br/>
        <div class="row cl">
            <label class="form-label col-3"></label>
            <label class="form-label col-2">酒店名字：</label>
            <div class="formControls col-4">
                <input type="text" class="input-text" value="${grogshopOrder.grogshopList.grogshopName}" disabled="disabled"/>
            </div>
        </div>

        <br/>
        <div class="row cl">
            <label class="form-label col-3"></label>
            <label class="form-label col-2">酒店地址：</label>
            <div class="formControls col-4">
            <textarea disabled="disabled" name="address" class="textarea" dragonfly="true">${grogshopOrder.grogshopList.city}市：${grogshopOrder.grogshopList.address}
            </textarea>
            </div>
        </div>

        <br/>
        <div class="row cl">
            <label class="form-label col-4"></label>
            <label class="form-label col-">备注：</label>
            <div class="formControls col-4">
            <textarea disabled="disabled" name="address" class="textarea" dragonfly="true">${grogshopOrder.remark}
            </textarea>
            </div>
        </div>

        <br/>
        <div class="row cl">
            <div class="col-8 col-offset-5">
                <button onClick="layer_close();" class="btn btn-primary radius" type="button">&nbsp;&nbsp;返回&nbsp;&nbsp;</button>
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
        //日期转换
        var start=$("#start").val();
        var end=$("#end").val();
        var startDate=new Date(start);
        var startyear=startDate.getFullYear();
        var startmonth=startDate.getMonth()+1;
        var startdate=startDate.getDate();

        var endDate=new Date(end);
        var endyear=endDate.getFullYear();
        var endmonth=endDate.getMonth()+1;
        var enddate=endDate.getDate();
        start=startyear+"-"+startmonth+"-"+startdate;
        end=endyear+"-"+endmonth+"-"+enddate;
        $("#start").val(start);
        $("#end").val(end);

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

    });
</script>
</body>
</html>