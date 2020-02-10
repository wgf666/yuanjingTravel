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
    <link href="css/H-ui.min.css" rel="stylesheet" type="text/css"/>
    <link href="css/H-ui.admin.css" rel="stylesheet" type="text/css"/>
    <link href="lib/icheck/icheck.css" rel="stylesheet" type="text/css"/>
    <link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css"/>
    <!--[if IE 6]>
    <script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js"></script>
    <script>DD_belatedPNG.fix('*');</script>
    <![endif]-->
    <title>修改景点信息</title>
</head>
<body>
<div class="pd-20">
    <form action="back/scenicSpot/add" method="post" class="form form-horizontal" id="form-admin-add">

        <div class="row cl">
            <label class="form-label col-2"></label>
            <label class="form-label col-2">地区：</label>
            <div class="formControls col-1">
                <select class="select" size="0" name="arrange">
                    <option value="-1">请选择</option>
                    <option value="华东">华东</option>
                    <option value="华南">华南</option>
                    <option value="华北">华北</option>
                    <option value="华中">华中</option>
                    <option value="西南">西南</option>
                    <option value="西北">西北</option>
                    <option value="东北">东北</option>
                </select>
            </div>

            <label class="form-label col-">省份：</label>
            <div class="formControls col-1">
                <select class="select" size="1" name="special">
                    <option value="请选择市区">请选择省份</option>
                    <option value="北京市">北京市</option>
                    <option value="天津市">天津市</option>
                    <option value="上海市">上海市</option>
                    <option value="重庆市">重庆市</option>
                    <option value="河北省">河北省 </option>
                    <option value="山西省">山西省</option>
                    <option value="辽宁省">辽宁省</option>
                    <option value="吉林省">吉林省</option>
                    <option value="黑龙江省">黑龙江省 </option>
                    <option value="江苏省">江苏省</option>
                    <option value="浙江省">浙江省</option>
                    <option value="安徽省">安徽省</option>
                    <option value="福建省">福建省</option>
                    <option value="江西省">江西省</option>
                    <option value="山东省">山东省 </option>
                    <option value="河南省">河南省</option>
                    <option value="湖北省">湖北省</option>
                    <option value="湖南省">湖南省</option>
                    <option value="广东省">广东省</option>
                    <option value="海南省">海南省</option>
                    <option value="四川省">四川省 </option>
                    <option value="贵州省">贵州省</option>
                    <option value="云南省">云南省</option>
                    <option value="陕西省">陕西省</option>
                    <option value="甘肃省">甘肃省</option>
                    <option value="青海省">青海省</option>
                    <option value="台湾省">台湾省</option>
                    <option value="广西壮族自治区">广西壮族自治区</option>
                    <option value="内蒙古自治区">内蒙古自治区</option>
                    <option value="西藏自治区">西藏自治区</option>
                    <option value="宁夏回族自治区">宁夏回族自治区</option>
                    <option value="新疆维吾尔自治区">新疆维吾尔自治区</option>
                    <option value="香港特别行政区">香港特别行政区</option>
                    <option value="澳门特别行政区">澳门特别行政区</option>
                </select>
            </div>
        </div>


        <div class="row cl">
            <label class="form-label col-2"></label>
            <label class="form-label col-2">城市：</label>
            <div class="formControls col-3">
                <input type="text" name="scenicName" class="input-text" value="">
            </div>
        </div>


        <div class="row cl">
            <label class="form-label col-2"></label>
            <label class="form-label col-2">线路介绍：</label>
            <div class="formControls col-3">
            <textarea name="scenicIntroduction" cols="" rows="" class="textarea" dragonfly="true"
                      onKeyUp="textarealength(this,100)"></textarea>
            </div>
        </div>


        <div class="row cl">
            <label class="form-label col-2"></label>
            <label class="form-label col-2">图片：</label>
            <div class="formControls col-3">
                <input type="file" alt="未"/>
                <img src=""/>
            </div>
            <div class="col-4"></div>
        </div>


        <div class="row cl">
            <label class="form-label col-2"></label>
            <label class="form-label col-2">票价：</label>
            <div class="formControls col-3">
                <input type="text" name="ticketPrice" class="input-text" value="">
            </div>
            <div class="col-4"></div>
        </div>


        <div class="row cl">
            <label class="form-label col-2"></label>
            <label class="form-label col-2">活动时间：</label>
            <div class="formControls col-3">
                <input type="text" name="time" class="input-text" value="" placeholder="">
            </div>
            <div class="col-4"></div>
        </div>


        <div class="row cl">
            <label class="form-label col-2"></label>
            <label class="form-label col-2">折扣价：</label>
            <div class="formControls col-3">
                <input type="text" name="discount" class="input-text" value=""/>
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
    $(function () {
        // var a = $("input[name='time']").val();
        // var date = new Date(a)
        // var m = (date.getMonth() + 1);
        // var d = date.getDate();
        // if ((date.getMonth() + 1) < 10) {
        //     m = "0" + (date.getMonth() + 1);
        // }
        // if (date.getDate() < 10) {
        //     d = "0" + date.getDate();
        // }
        // var Str = date.getFullYear() + '-' +
        //     m + '-' +
        //     d
        // $("input[name='time']").val(Str)
        // //alert(Str);

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
