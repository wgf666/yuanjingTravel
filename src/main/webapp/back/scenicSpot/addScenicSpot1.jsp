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
    <form action="back/scenicSpot/addForeign" method="post" class="form form-horizontal" id="form-admin-add">

        <div class="row cl">
            <label class="form-label col-2"></label>
            <label class="form-label col-2">地区：</label>
            <div class="formControls col-1">
                <select class="select" size="0" name="arrange">
                    <option value="-1">请选择</option>
                    <option value="亚洲">亚洲</option>
                    <option value="拉丁美洲">拉丁美洲</option>
                    <option value="欧洲">欧洲</option>
                    <option value="港澳">港澳</option>
                    <option value="澳洲">澳洲</option>
                    <option value="美洲">美洲</option>
                    <option value="非洲">非洲</option>
                </select>
            </div>

            <label class="form-label col-">国家：</label>
            <div class="formControls col-1">
                <select class="select" size="1" name="special">
                    <option value="请选择市区">请选择国家</option>
                    <option value="中国">中国</option>
                    <option value="美国">美国</option>
                    <option value="俄罗斯">俄罗斯</option>
                    <option value="日本">日本</option>
                    <option value="英国">英国 </option>
                    <option value="澳大利亚">澳大利亚</option>
                    <option value="墨西哥">墨西哥</option>
                    <option value="法国">法国</option>
                    <option value="泰国">泰国 </option>
                    <option value="缅甸">缅甸</option>
                    <option value="菲律宾">菲律宾</option>
                    <option value="韩国">韩国</option>
                    <option value="朝鲜">朝鲜</option>
                    <option value="巴西">巴西</option>
                    <option value="德国">德国 </option>
                    <option value="意大利">意大利</option>
                    <option value="阿根廷">阿根廷</option>
                    <option value="阿拉巴斯坦">阿拉巴斯坦</option>
                    <option value="土耳其">土耳其</option>
                    <option value="巴基斯坦">巴基斯坦</option>
                    <option value="印度">印度 </option>
                    <option value="柬埔寨">柬埔寨</option>
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
