<%--
  Created by IntelliJ IDEA.
  User: wgf1997
  Date: 2019/12/19
  Time: 19:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>添加酒店</title>
</head>
<body>
<div class="pd-20">
    <form action="grogshop/add" method="post" class="form form-horizontal" id="form-admin-add">

        <div class="row cl">
            <label class="form-label col-1"></label>
            <label class="form-label col-3"><span class="c-red">*</span> 城市：</label>
            <div class="formControls col-5">
                <input type="text" class="input-text" value="" placeholder="" id="user-name" name="city">
            </div>
            <div class="col-4"> </div>
        </div>

        <div class="row cl"><div class="formControls col-5"></div><div class="col-4"></div></div>
        <div class="row cl"><div class="formControls col-5"></div><div class="col-4"></div></div>


        <div class="row cl">
            <label class="form-label col-1"></label>
            <label class="form-label col-3"><span class="c-red">*</span> 酒店名字：</label>
            <div class="formControls col-5">
                <input type="text" name="grogshopName" autocomplete="off" value="" class="input-text">
            </div>
            <div class="col-4"> </div>
        </div>

        <div class="row cl"><div class="formControls col-5"></div><div class="col-4"></div></div>
        <div class="row cl"><div class="formControls col-5"></div><div class="col-4"></div></div>

        <div class="row cl">
            <label class="form-label col-1"></label>
            <label class="form-label col-3"><span class="c-red">*</span> 酒店地址：</label>
            <div class="formControls col-5">
                <textarea name="address" cols="" rows="" class="textarea" dragonfly="true" onKeyUp="textarealength(this,100)"></textarea>
            </div>
            <div class="col-4"> </div>
        </div>

        <div class="row cl"><div class="formControls col-5"></div><div class="col-4"></div></div>
        <div class="row cl"><div class="formControls col-5"></div><div class="col-4"></div></div>

        <div class="row cl">
            <div class="col-8 col-offset-4">
                <input class="btn btn-primary radius" type="button" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <button onClick="layer_close();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
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
