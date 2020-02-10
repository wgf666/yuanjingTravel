<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    <script type="text/javascript" src="Scripts/MSClass.js"></script>
    <script type="text/javascript" language="javascript">
        var nav= '01'
    </script>
    <script type="text/javascript">
        function $(id){return document.getElementById(id)};
    </script>
    <script type="text/javascript">
        $(function () {
            $("#search").click(function () {
                var select=$("#select").val();
                $("#county").attr("value",select);
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
                <li class="menu05"><a id="nav05" href="scenicSpot/todayline"><em>特惠路线</em></a></li>
                <li class="menu06"><a id="nav06" href="scenicSpot/attract"><em>景点推荐</em></a></li>
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
    <!--左-->
    <div class="Index_left">
        <div class="space10"></div>
        <div class="Floortop">
            <div class="left"><img src="images/index_lefticon.jpg" border="0" usemap="#Map" />
                <map name="Map" id="Map">
                    <area shape="rect" coords="3,11,179,80" href="/plane" />
                    <area shape="rect" coords="4,101,181,170" href="grogshop/getGrogShop" />
                    <area shape="rect" coords="-1,187,180,252" href="#" />
                </map>
            </div>
            <div class="right">
                <div class="QQarea">
                    <span class="total">/ 5</span>
                    <a href="javascript:void(0)" id="QQpre"></a>
                    <a href="javascript:void(0)" id="QQnext"></a>
                    <div class="QQbed">

                        <div id="QQMarquee">
                            <ul id="QQMarqueeCoutent">
                                <c:forEach items="${ChinaSS}" var="info">
                                <li>
                                    <span class="bg"></span>
                                    <p>${info.scenicIntroduction}</p>
                                    <a href="scenicSpot/buy/${info.id}"><IMG height=360 src=${info.image} width=540></a>
                                </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="QQnavbar"><ul id="QQTab"><li class="active">1</li><li>2</li><li>3</li><li>4</li><li>5</li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li><li></li></ul></div>
                    </div>
                </div>

                <script language="JavaScript">

                    /*********div + CSS开始等待、间歇滚动、TAB点击切换、点击控制左右滑动实例(缓动)***************/
                    var QQMarqueeControl=new Marquee(["QQMarquee","QQMarqueeCoutent","QQTab","mouseover"],2,0.5,570,270,20,3000,3000,0,2) //div + CSS开始等待、间歇滚动、TAB点击切换、点击控制左右滑动实例(缓动)
                    $("QQpre").onclick=function(){QQMarqueeControl.Run(3)}; //跳过等待时间向右滚动后保持原向运动
                    $("QQnext").onclick=function(){QQMarqueeControl.Run(2)}; //跳过等待时间向左滚动后保持原向运动
                </script>
            </div>
        </div>

        <div class="space10"></div>
        <!--特价路线-->
        <div class="Special_routes">
            <div class="leftLoop">
                <div class="hd">
                    <font><a href="#">更多 >></a></font>
                    <span>特价路线</span>
                    <ul><li>1</li><li>2</li><li>3</li><li>4</li><li>5</li></ul>
                </div>
                <div class="bd">
                    <ul class="picList">
                        <c:forEach items="${discount}" var="info">
                            <li>
                                <div class="pic"><a href="scenicSpot/buy/${info.id}"><img src="${info.image}" /></a></div>
                                <div class="title"><a href="scenicSpot/buy/${info.id}"><font>【${info.scenicName}】</font>${info.scenicIntroduction}</a><p><span>￥</span>${info.ticketPrice}</p></div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <script type="text/javascript">jQuery(".leftLoop").slide({ mainCell:".bd ul",effect:"leftLoop",vis:4,scroll:4,autoPlay:true});</script>
        </div>
        <!--特价路线 end-->
        <div class="space10"></div>
        <!--国内线路-->
        <div class="GNline">
            <h5><span><a href="#">华东</a> | <a href="#">华南</a> | <a href="#">华中</a> | <a href="#">华北</a> | <a href="#">西南</a> | <a href="#">西北</a> | <a href="#">东南</a> | <a href="#">东北</a> | <a href="#">周边</a></span><font>国内线路</font></h5>
            <ul class="picList">
                <c:forEach items="${ChinaSS}" var="info" begin="0" end="7" >
                <li>
                    <div class="pic"><a href="scenicSpot/buy/${info.id}"><img src="${info.image}" width="70" height="70" /></a></div>
                    <div class="title"><a href="scenicSpot/buy/${info.id}"><font>【${info.scenicName}】</font>${info.scenicIntroduction}</a><p><span>￥</span>${info.ticketPrice}</p></div>
                </li>
                </c:forEach>
            </ul>
            <dl class="yellowlist">
                <dd><span><font>￥</font> 78</span><a href="#">春节自驾游海螺沟三天团 </a></dd>
                <dd><span><font>￥</font> 78</span><a href="#">双流黄龙溪古镇游</a></dd>
                <dd><span><font>￥</font> 78</span><a href="#">广州至珠海拱北关口单人套票</a></dd>
                <dd><span><font>￥</font> 78</span><a href="#">阳朔3天2夜全景豪华纯玩团</a></dd>
                <dd><span><font>￥</font> 78</span><a href="#">香港精彩海洋公园两日品...</a></dd>
                <dd><span><font>￥</font> 78</span><a href="#">【九寨沟牟尼沟+乐山峨眉山5日游】纯玩团赠藏民</a></dd>
            </dl>
        </div>
        <!--国内线路end-->
        <div class="space10"></div>
        <div class="ad02"><img src="images/ad_h01.jpg" /></div>
        <div class="space10"></div>
        <!--境外线路-->
        <div class="GNline">
            <h5><span><a href="#">欧洲</a> | <a href="#">美洲</a> | <a href="#">澳洲</a> | <a href="#">非洲</a> | <a href="#">拉丁美洲</a> | <a href="#">亚洲</a> | <a href="#">港澳</a></span><font>境外线路</font></h5>
            <ul class="picList">
               <c:forEach items="${abroad}" var="info" begin="0" end="7">
                <li>
                    <div class="pic"><a href="scenicSpot/buy/${info.id}"><img src=${info.image} /></a></div>
                    <div class="title"><a href="scenicSpot/buy/${info.id}"><font>【${info.scenicName}】</font>${info.scenicIntroduction}</a><p><span>￥</span>${info.ticketPrice}</p></div>
                </li>
            </c:forEach>
            </ul>
            <dl class="yellowlist">
                <dd><span><font>￥</font> 78</span><a href="#">【西岭雪山旅游】西岭雪山温泉、成都到西岭 </a></dd>
                <dd><span><font>￥</font> 78</span><a href="#">【九寨沟牟尼沟+乐山峨眉山5日游】纯玩团赠藏民</a></dd>
                <dd><span><font>￥</font> 78</span><a href="#">黄龙汽车铂金纯玩三日游（九寨沟/黄龙旅游线路）</a></dd>
                <dd><span><font>￥</font> 78</span><a href="#">库尔勒巴音布鲁克草原简介</a></dd>
                <dd><span><font>￥</font> 78</span><a href="#">峨眉全山纯玩二日游/纯玩团4星送乌木及欢乐彝家 </a></dd>
                <dd><span><font>￥</font> 78</span><a href="#">成都出发到凌云山、周子古镇二日游 </a></dd>
            </dl>
        </div>
        <!--境外线路end-->
    </div>
    <!--右-->
    <div class="Index_right">
        <div class="tippic"></div>
        <div class="space20"></div>
        <ul>
            <c:forEach items="${today}" var="info" begin="0" end="2">
            <li>
                <p>
                    <a href="scenicSpot/buy/${info.id}">
                        <img src="${info.image}" />
                        <span>还剩11天8小时15分4.8秒</span>
                        <font>${info.scenicIntroduction}</font>
                    </a>
                </p>
                <div class="Discount">
                    原价：${info.ticketPrice}<br />
                    折扣： <fmt:formatNumber type="number"
                     value="${info.discount/info.ticketPrice}" pattern="0.00" maxFractionDigits="2"/>
                </div>
                <h1>￥${info.discount}</h1>
                <div class="BUY">
                    <span>108</span>人抢购
                    <a href="scenicSpot/buy/${info.id}"><img src="images/buyicon.jpg" /></a>
                </div>
            </li>
            </c:forEach>
        </ul>

        <div class="space10"></div>
        <!---->
        <div class="Tab">
            <div id="AutoTable1">
                <h2><span><b>本周预订排行</b></span><span><font>最热销线路推荐</font></span></h2>
                <div name="AutoContent">
                    <!--本周预订排行-->
                    <div class="Num">
                        <dl>
                            <dt><a href="#">元旦厦门专线：厦门鼓浪屿</a></dt>
                            <dt><a href="#">凤凰古城五天四夜火车纯玩</a></dt>
                            <dt><a href="#">单张图片保存功能目前只支持</a></dt>
                            <dt><a href="#">流溪香雪赏梅—摘桔休闲纯</a></dt>
                            <dt><a href="#">单张图片保存功能目前只支持</a></dt>
                            <dt><a href="#">从化石门森林公园、溪头村...</a></dt>
                            <dt><a href="#">单张图片保存功能目前只支持</a></dt>
                            <dt><a href="#">从化石门森林公园、溪头村</a></dt>
                            <dt><a href="#">南沙湿地公园看千鸟齐飞</a></dt>
                            <dt><a href="#">从化石门森林公园、溪头村... </a></dt>
                        </dl>
                    </div>
                    <!--最热销线路推荐-->
                    <div class="Num">
                        <dl>
                            <dt><a href="#">单张图片保存功能目前只支持</a></dt>
                            <dt><a href="#">流溪香雪赏梅—摘桔休闲纯</a></dt>
                            <dt><a href="#">单张图片保存功能目前只支持</a></dt>
                            <dt><a href="#">元旦厦门专线：厦门鼓浪屿</a></dt>
                            <dt><a href="#">凤凰古城五天四夜火车纯玩</a></dt>
                            <dt><a href="#">从化石门森林公园、溪头村...</a></dt>
                            <dt><a href="#">单张图片保存功能目前只支持</a></dt>
                            <dt><a href="#">从化石门森林公园、溪头村</a></dt>
                            <dt><a href="#">南沙湿地公园看千鸟齐飞</a></dt>
                            <dt><a href="#">从化石门森林公园、溪头村... </a></dt>
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
        <!--旅游资讯-->
        <div class="Index_travel_news">
            <h1><a href="news.html">更多 >></a>旅游资讯</h1>
            <dl>
                <dt><a href="newsInfo.html"><img src="images/rpic02.jpg" /></a></dt>
                <dd><a href="#">我的2012美白重磅弹21天写就</a></dd>
                <dd><a href="#">施华洛世奇全新广告 </a></dd>
                <dd><a href="#">互动赢美白精华液</a></dd>
                <dd><a href="#">我的2012美白重磅弹21天写就</a></dd>
                <dd><a href="#">施华洛世奇全新广告 </a></dd>
                <dd><a href="#">互动赢美白精华液</a></dd>
                <dd><a href="#">我的2012美白重磅弹21天写就</a></dd>
            </dl>
        </div>
        <!---->
        <div class="space10"></div>
        <!---->
        <div class="ad01"><img src="images/ad_r01.jpg" /></div>
        <!---->
        <div class="space10"></div>
        <!--旅游宝典-->
        <div class="tourbook">
            <h1>旅游宝典</h1>
            <p>
                <a href="#">火车时刻表</a>
                <a href="#">动车时刻表</a>
                <a href="#">天气预报</a>
                <a href="#">电子地图</a>
                <a href="#">美食查询</a>
                <a href="#">公交查询</a>
                <a href="#">旅游网址</a>
                <a href="#">邮编查询</a>
            </p>
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
</body>
</html>
