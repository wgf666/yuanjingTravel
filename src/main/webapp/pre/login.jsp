<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <title>财富旅行</title>
    <link href="css/css_whir.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="lib/jquery/1.9.1/jquery.js"></script>

    <script type="text/javascript">
        //输出验证码
        function checkCodeFunction() {
            //alert();
            $.ajax({
                url:"checkCode/pre",
                type:"GET",
                success:function(){
                    //alert();
                    $("#cc").attr("src","checkCode/pre");
                }
            })
        }
        

        $(function () {
            //校验用户名
            $("#name").blur(function () {
                var name = $(this).val();
                if(name==null || name==''){
                    $("#name+span").empty();
                    $("#name+span").css("color","red");
                    $("#name+span").html("*用户名不能为空");
                    return;
                }
                $.ajax({
                    url:"checkLogin",
                    type:"GET",
                    data:"name="+name,
                    success:function (data) {
                        if(data==0){
                            //alert("该用户名未注册！！！")
                            $("#name+span").empty();
                            $("#name+span").css("color","red");
                            $("#name+span").html("*该用户名未注册");
                        }else{
                            //alert("用户名可以使用！！！")
                            $("#name+span").empty();
                            $("#name+span").css("color","green");
                            $("#name+span").html("*用户名可以使用");
                        }
                    }
                })
            })

            //校验密码
            $("#password").blur(function () {
                var password = $(this).val();
                if(password==null || password==''){
                    $("#password+span").empty();
                    $("#password+span").css("color","red");
                    $("#password+span").html("*密码不能为空");
                    return;
                }
                $("#password+span").empty();
            })

            //校验表单
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
                    url:"checkCode",
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
        
    </script>


</head>

<body>
<!--头部-->
<div class="Header">
    <div class="Top">
        <div class="Top_one">
            <div class="Login">
                <c:if test="${empty sessionScope.user}">
                您好，欢迎光临。<a href="pre/login.jsp" class="a1">登录</a><span>
                | </span><a href="pre/register.jsp" class="a2">注册</a><em>
                </c:if>
                <c:if test="${not empty sessionScope.user}">
                <a href="/pre/member_index.jsp" class="a3">${user.name}</a>
                    <a href="/user/logout" class="a4">退 出</a></em>
                </c:if>
            </div>
            <h1>
                <em>
                    <c:if test="${empty sessionScope.user}">
                        <a href="pre/login.jsp">订单查询</a>|
                        <a href="pre/login.jsp" class="amy">我的账户</a>
                        <div class="amylist">我的账户</div>
                    </c:if>
                    <c:if test="${not empty sessionScope.user}">
                        <a href="ScenicSpotOrder/orders?id=${user.id}">订单查询</a>
                        <a href="pre/member_index.jsp" class="amy">我的账户</a>
                        <div class="amylist">我的账户</div>
                    </c:if>
                </em>|
                <em><a href="404.jsp">在线留言</a>|<a href="404.jsp">收藏</a></em>|
                <em><a href="scenicSpot/showSpotPic" class="amy">网站导航</a></em>
            </h1>

        </div>

        <div class="area"></div>
        <div class="Menu">
            <ul>
                <li class="menu01"><a id="nav01" href="scenicSpot/showSpotPic"><em>首页</em></a></li>
                <li class="menu02"><a id="nav02" href="scenicSpot/chinaline"><em>国内线路</em></a></li>
                <li class="menu03"><a id="nav03" href="scenicSpot/abroadline"><em>境外线路</em></a></li>
                <li class="menu04"><a id="nav04" href="404.jsp"><em>专题</em></a></li>
                <li class="menu05"><a id="nav05" href="404.jsp"><em>特惠路线</em></a></li>
                <li class="menu06"><a id="nav06" href="404.jsp"><em>景点推荐</em></a></li>
                <li class="menu07"><a id="nav07" href="grogshop/getGrogShop"><em>机票酒店</em></a></li>
                <li class="menu08"><a id="nav08" href="404.jsp"><em>旅游资讯</em></a></li>
                <li class="menu09"><a id="nav09" href="404.jsp"><em>关于我们</em></a></li>
            </ul>
        </div>
        <div class="Hot">
            <div class="Search">
                <div class="selectlist">
                    <select id="select" style="display:none" name="select">
                        <option value="1" selected="selected">线路</option>
                        <option value="2">国内线路</option>
                        <option value="3">境内线路</option>
                        <option value="4">特惠线路</option>
                    </select>
                </div>
                <script src="Scripts/jQselect.js" type="text/javascript"></script>
                <script type="text/javascript">
                    $(document).ready(function() {
                        $("#select").selectbox();
                    });
                </script>
                <!---->
                <div class="Inputbtn">
                    <input type="text" class="input" value="请输入目的地名称或线路名称" onfocus="this.value=''"><input type="button" class="btn" onClick="location.href='search.html'" onfocus="this.blur()">
                </div>
                <!---->
            </div>
            <div class="Hotword"><span>热搜：</span><a href="#">成都旅游</a><a href="#">旅游城市</a><a href="#">鼓浪屿三亚旅游景点排行榜 </a></div>
            <!-- JiaThis Button BEGIN -->
            <div class="jiathis_style">
                <span>分享到：</span>
                <a class="jiathis_button_qzone"></a>
                <a class="jiathis_button_tsina"></a>
                <a class="jiathis_button_tqq"></a>
                <a class="jiathis_button_renren"></a>
                <a class="jiathis_button_kaixin001"></a>
                <a href="http://www.jiathis.com/share" class="jiathis jiathis_txt jtico jtico_jiathis" target="_blank"></a>
                <a class="jiathis_counter_style"></a>
            </div>
            <script type="text/javascript" src="http://v3.jiathis.com/code/jia.js?uid=1350527610574236" charset="utf-8"></script>
            <!-- JiaThis Button END -->
        </div>
    </div>
</div>
<!--选中菜单-->
<script language="javascript" type="text/javascript">
    try{
        document.getElementById("nav" + nav).className= "acur";
    }catch(ex){}
</script>
<!--选中菜单-->

<!--[if IE 6]>
<script type="text/javascript" src="Scripts/DD_belatedPNG.js" ></script>
<script type="text/javascript">
    DD_belatedPNG.fix('.tippic,.tips,.newsIcon,.Menu');
</script>
<![endif]--><!--头部 end-->
<!--内容-->
<div class="Content">
    <div class="space20"></div>

    <div class="mod">
        <div class="title">
            <h1 class="hide_word">
                用户登陆</h1>
            <span>或<a href="pre/register.jsp">注册</a></span>
        </div>

        <table cellpadding="0" cellspacing="0" border="0">
           

            <form id="form" action="/login" method="post">
            <tr>
                <td>
                    用户名：
                </td>
                <td>
                    <input type="text" maxlength="30" id="name" name="name" class="input username">
                    <span></span>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    密&emsp;码：
                </td>
                <td>
                    <input type="password" maxlength="30" id="password" name="password" class="input password">
                    <span></span>
                </td>
                <td>
                </td>
            </tr>

            <tr>
                <td>
                </td>
                <td colspan="3" style="align-items: center">
                    <input id="CODE" type="text" placeholder="验证码" onblur="if(this.value==''){this.value='验证码:'}" onclick="if(this.value=='验证码:'){this.value='';}" value="验证码:" style="width:100px;height: 30px;align-items: center;">
                    <img id="cc" onclick="checkCodeFunction()" src="checkCode/pre" style="align-items: center;">
                    <a onclick="checkCodeFunction()" href="javascript:;">看不清，换一张</a>
                </td>
            </tr>

            <tr>
                <td>
                </td>
                <td>
                    <input type="radio" id="checkbox1" value="true" name="RememberMe" class="checkbox"><label for="checkbox1">记住我的登录状态</label>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <input type="button" class="submit"><a href="found_password.html" class="forget">忘记密码？</a>
                </td>
                <td>
                </td>
            </tr>
            </form>
        </table>
        <div class="tips2">
            <h2>
                温馨提示：</h2>
            <p>
                1、请输入您的远景网用户名及密码进行登录；</p>
            <p>
                2、如果还未注册成为远景网用户，请使用您常用的电子邮箱或手机号码进行注册，帐号激活成功后即可开始享受远景网带给您的最便捷的旅游服务。</p>
        </div>
    </div>

</div>
<!--内容end-->
<!--底部信息-->
<div class="Bottom">
    <div class="space20"></div>
    <div class="BottomInfo">
        <dl>
            <dt>
                <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=123456789&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:123456789:41" alt="点击这里给我发消息" title="点击这里给我发消息"></a><a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=123456789&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:123456789:41" alt="点击这里给我发消息" title="点击这里给我发消息"></a>
            </dt>
            <dd>
                <img src="images/pic_xszd.jpg" />
                <p>
                    <a href="help.html">常见问题</a>
                    <a href="#">如何注册</a>
                    <a href="#">订购流程</a>
                    <a href="#">付款流程</a>
                </p>
            </dd>
            <dd>
                <img src="images/pic_zffs.jpg" />
                <p>
                    <a href="#">支付宝支付</a>
                    <a href="#">银行付款</a>
                    <a href="#">门市支付</a>
                    <a href="#">上门服务</a>
                </p>
            </dd>
            <dd class="end">
                <img src="images/pic_gywm.jpg" />
                <p>
                    <a href="about.html">远景旅社</a>
                    <a href="#">联系我们</a>
                    <a href="#">核心优势</a>
                    <a href="#">商家合作</a>
                </p>
            </dd>
        </dl>
    </div>
    <div class="space20"></div>
    <h5><a href="#">流量统计</a> | <a href="sitemap.html">网站地图</a> | <a href="#">法律申明</a> | <a href="links.html">友情链接</a> | <a href="#">在线客服</a> | <a href="help.html">帮助中心</a></h5>
    <h4>版权所有 © 2012-2018 我的虚拟世界店铺<br />技术支持： 旅游许可证号：L-GD00000 网站备案号：粤ICP备00000000号</h4>
</div><!--底部信息 end-->

</body>
</html>
