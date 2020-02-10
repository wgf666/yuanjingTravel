<%--
  Created by IntelliJ IDEA.
  User: wgf1997
  Date: 2019/12/18
  Time: 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=7" />
    <meta name="Author" content="" />
    <title>财富旅行</title>
    <link href="css/css_whir.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="Scripts/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" language="javascript">
        var nav= '07'
        var right= '02'
    </script>
    <script type="text/javascript">
        $(function () {
            $("select[class='input01']").change(function(){
                var id=$(this).val();
                var myDate=new Date();
                var year=myDate.getFullYear();
                var month=myDate.getMonth()+1;
                var date=myDate.getDate()+1;
                var now=year+"-"+month+"-"+date;
                $("input[name='grogshopId']").val(id);

                $.ajax({
                    url:"grogshop/getGrogShopById",
                    type:"GET",
                    data:"id="+id,
                    success:function(data){
                        //alert(data.address);
                        $("input[name='startTime']").val(now)
                        $("input[name='address']").val(data.address)
                        $("input[name='grogshopName']").val(data.grogshopName)
                    }
                })
            })

            $("input[type='button']").click(function(){
                if("${user}"==null||"${user}"==undefined||"${user}"==''){
                    alert("您还未登录，请登录后再操作！！！");
                    location.href="pre/login.jsp";
                    return;
                }
                var id=$("input[name='grogshopId']").val();
                var name = $("input[name='name']").val();
                var start = $("input[name='startTime']").val();
                var end = $("input[name='endTime']").val();
                var phone = $("input[name='phone']").val();
                if(id==null || id==''){
                    alert("请选择城市");
                    return;
                }
                if(end==null || end==''){
                    alert("请正确的日期！！！");
                    return;
                }
                if(name==null || name==''){
                    alert("请输入姓名！！");
                    return;
                }
                if(phone==null || phone==''){
                    alert("请输入电话！！");
                    return;
                }
                $("form").submit();
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
                您好，<a href="/pre/member_index.jsp" class="a3">${user.name}
            </a> | <a href="/user/logout" class="a4">退 出</a></em>
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
    <div class="Current">您当前的位置：<a href="#">首页</a> > 机票酒店</div>

        <!--左-->

    <div class="Index_left">
        <div class="space20"></div>
        <div class="Hotelbook">
            <h1>酒店推荐</h1>
            <div class="space10"></div>
            <form action="HotelOrder/add" method="post">
                <input type="hidden" name="grogshopId"/>
            <table cellpadding="0" cellspacing="0" border="0" width="100%" class="table1">
                <tr>
                    <td align="right">入住城市：</td>
                    <td colspan="3">

                        <select class="input01">
                            <option selected="selected">请选择</option>
                            <c:forEach items="${list}" var="grogShop" varStatus="status">
                                <option value="${grogShop.id}">${grogShop.city}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr><td align="right">入住日期：</td>
                    <td><input type="date" class="input01" name="startTime" value="" /></td>
                    <td align="right">退房日期：</td>
                    <td><input type="date" class="input01" name="endTime" value="" /></td>
                </tr>
                <tr>
                    <td align="right">酒店位置：</td>
                    <td><input type="text" name="address" class="input01" /></td>
                    <td width="100" align="right">酒店名称：</td>
                    <td><input type="text" name="grogshopName" class="input01" /></td>
                </tr>
                <tr><td align="right">姓    名：</td>
                    <td><input type="text" name="name" class="input01" value="${user.name}"/></td>
                    <td width="100" align="right">联系电话：</td>
                    <td><input type="text" name="phone" class="input01" value="${user.phone}"/></td>
                </tr>
                <tr><td align="right">电子邮箱：</td>
                    <td colspan="3">
                        <input type="text" name="eMail" class="input01" value="${user.eMail}"/></td>
                </tr>
                <tr><td align="right" valign="top">备   注：</td>
                    <td colspan="3"><textarea name="remark"></textarea></td>
                </tr>
                <tr><td></td><td colspan="3">
                    <input type="button" class="btn" />
                </td></tr>
            </table>
            </form>
        </div>
    </div>


    <!--右-->
    <div class="Index_right">
        <!---->
        <div class="Sidemenu">
            <h1><img src="images/title_jipiao.jpg" /></h1>
            <dl>
                <dd><a id="right01" href="/plane">机票预订</a></dd>
                <dd><a id="right02" href="grogshop/getGrogShop">酒店推荐</a></dd>
            </dl>
            <!--选中菜单-->
            <script language="javascript" type="text/javascript">
                try{
                    document.getElementById("right" + right).className= "aon";
                }catch(ex){}
            </script>
            <!--选中菜单-->
        </div><!---->
    </div>

</div>
<!--内容end-->
<div class="clear"></div>
<div class="space20"></div>
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
