<%--
  Created by IntelliJ IDEA.
  User: Rocky Murphy
  Date: 2019/12/20
  Time: 15:57
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="${pageContext.request.contextPath}/">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=7" />
    <meta name="Author" content="" />
    <title>财富旅行</title>
    <link href="css/css_whir.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="Scripts/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="Scripts/jquery.SuperSlide.js"></script>
    <script type="text/javascript" language="javascript">
        var nav= '02'
    </script>
    <script type="text/javascript">
        $(function () {
            $("input[type='button']").click(function () {
                var select=$("#select").val();
                $("#county").attr("value",select);
                $("form").submit();
            })
        })
    </script>

</head>

<body id="linebody">
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
                        <option value="" selected="selected">线路</option>
                        <option value="0">国内线路</option>
                        <option value="1">国外线路</option>
                    </select>
                </div>
                <script src="Scripts/jQselect.js" type="text/javascript"></script>
                <script type="text/javascript">
                    $(document).ready(function() {
                        $("#select").selectbox();
                    });
                </script>
                <!---->
                <form action="/scenicSpot/search" >
                    <div class="Inputbtn">
                        <input type="hidden" name="county" id="county" >
                        <input type="text" name="special" class="input" value="请输入目的地名称或线路名称" onfocus="this.value=''">
                        <input type="button" id="search" class="btn" >
                    </div>
                </form>
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
    <div class="Current">您当前的位置：<a href="index.jsp">首页</a> > 国内线路</div>
    <!--特价路线-->

    <!--特价路线 end-->
    <div class="space10"></div>
    <!--左-->
    <div class="Index_left">

        <div class="domesticlist2">

            <h1><em>${special}</em></h1>
            <c:forEach items="${pageInfo.list}" var="info">
                <ul>
                    <li>
                        <div class="pices"><font>${info.discount}</font> 元起<br /><span>￥${info.ticketPrice}</span></div>
                        <a href="scenicSpot/buy?id=${info.id}"><img src=${info.image} /></a><p><a href="scenicSpot/buy?id=${info.id}">${info.scenicIntroduction}</a></p>
                    </li>
                </ul>
            </c:forEach>
            <!--Pages-->
            <div class="Pages">
                <jsp:include page="/common/page.jsp">
                    <jsp:param name="bodyId" value="linebody"/>
                </jsp:include>
            </div>
            <!--Pages-->
        </div>

    </div>
    <!--右-->
    <div class="Index_right">
        <!---->
        <div class="Tab">
            <div id="AutoTable1">
                <h2><span><b>本周预订排行</b></span><span><font>最热销线路推荐</font></span></h2>
                <div name="AutoContent">
                    <!--本周预订排行-->
                    <div class="Num">
                        <dl>
                            <dt><a href="scenicSpot/buy">元旦厦门专线：厦门鼓浪屿</a></dt>
                            <dt><a href="scenicSpot/buy">凤凰古城五天四夜火车纯玩</a></dt>
                            <dt><a href="scenicSpot/buy">单张图片保存功能目前只支持</a></dt>
                            <dt><a href="scenicSpot/buy">流溪香雪赏梅—摘桔休闲纯</a></dt>
                            <dt><a href="scenicSpot/buy">单张图片保存功能目前只支持</a></dt>
                            <dt><a href="scenicSpot/buy">从化石门森林公园、溪头村...</a></dt>
                            <dt><a href="scenicSpot/buy">单张图片保存功能目前只支持</a></dt>
                            <dt><a href="scenicSpot/buy">从化石门森林公园、溪头村</a></dt>
                            <dt><a href="scenicSpot/buy">南沙湿地公园看千鸟齐飞</a></dt>
                            <dt><a href="scenicSpot/buy">从化石门森林公园、溪头村... </a></dt>
                        </dl>
                    </div>
                    <!--最热销线路推荐-->
                    <div class="Num">
                        <dl>
                            <dt><a href="scenicSpot/buy">单张图片保存功能目前只支持</a></dt>
                            <dt><a href="scenicSpot/buy">流溪香雪赏梅—摘桔休闲纯</a></dt>
                            <dt><a href="scenicSpot/buy">单张图片保存功能目前只支持</a></dt>
                            <dt><a href="scenicSpot/buy">元旦厦门专线：厦门鼓浪屿</a></dt>
                            <dt><a href="scenicSpot/buy">凤凰古城五天四夜火车纯玩</a></dt>
                            <dt><a href="scenicSpot/buy">从化石门森林公园、溪头村...</a></dt>
                            <dt><a href="scenicSpot/buy">单张图片保存功能目前只支持</a></dt>
                            <dt><a href="scenicSpot/buy">从化石门森林公园、溪头村</a></dt>
                            <dt><a href="scenicSpot/buy">南沙湿地公园看千鸟齐飞</a></dt>
                            <dt><a href="scenicSpot/buy">从化石门森林公园、溪头村... </a></dt>
                        </dl>
                    </div>


                </div>
            </div>
        </div>
        <script type="text/javascript" src="Scripts/tab.js"></script>
        <script type="text/javascript">
            AutoTables("AutoTable1");
        </script><!---->
        <div class="space10"></div>
        <!---->
        <div class="GZYJ">
            <h2>关注我们</h2>
            <a href="#" class="a1">新浪微博</a>
            <a href="#" class="a2">腾讯微博</a>
            <a href="#" class="a3">豆瓣小组</a>
            <a href="#" class="a4">开心主页</a>
            <a href="#" class="a5">新浪客服微博</a>
        </div><!---->
        <div class="space10"></div>
        <!---->
        <div class="ad03"><img src="images/ad_r03.jpg" /></div>
        <!---->
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

