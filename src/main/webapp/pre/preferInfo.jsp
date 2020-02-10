<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="${pageContext.request.contextPath}/">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=7" />
    <meta name="Author" content="" />
    <title>我的虚拟世界店铺</title>
    <link href="css/css_whir.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="Scripts/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" language="javascript">
        var nav= '05'
    </script>
    <script type="text/javascript">
        $(function () {
            $("#userCheck").click(function () {

              if("${user}"==null||"${user}"==undefined||"${user}"==''){
                  alert("还未登录，请登录后再购买");
                  $("#userCheck").attr("href","pre/login.jsp");
                }
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
    <div class="Current">您当前的位置：<a href="#">首页</a> > 特惠线路</div>
    <div class="buyingInfo preferInfo">
        <h3><span>最新活动：</span>${info.scenicIntroduction}</h3>
        <!--左-->
        <div class="buyLeft">
            <div class="div01">
                <p><em>￥<span>${info.discount}</span></em></p>
                <p>原价：<i>${info.ticketPrice}</i>&nbsp;&nbsp;&nbsp;&nbsp;| &nbsp;&nbsp;&nbsp;&nbsp;折扣：<b>
                    <fmt:formatNumber type="number"
                                      value="${info.discount/info.ticketPrice}" pattern="0.00" maxFractionDigits="2"/>  折</b></p>
                <p><a id="userCheck" href="ScenicSpotOrder/baoming?id=${info.id}"><img src="images/buybtn.jpg" /></a></p>
        </div>
            <div class="div02">
                <font>233</font>人已购买
                <dl>购买成功！<br />还可继续购买</dl>
            </div>
            <div class="div03">
                剩余时间<br />
                <b>1</b>天<b>20</b>小时<b>40</b>分<b>30</b>秒
            </div>

            <div class="buyjia">
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
            <div class="space20"></div>
        </div>
        <!--右-->
        <div class="buyRight">
            <img src="${info.image}" />
        </div>
        <div class="clear"></div>
        <div class="space20"></div>
    </div>

    <div class="space20"></div>
    <!--左-->
    <div class="Index_left">
        <div class="preferInfo">
            <h5>本单详情</h5>
            <div class="Info prefer_Info">
                <div class="space20"></div>
                <div class="Tips">第一天: 广州—阳朔—大榕树景区—漓江精华游—入住酒店—西街；第二天: 十里画廊—图腾古道—月亮山—聚龙潭—西街；第三天: 自由单车游十里画廊—遇龙河——广州</div>
                <!--活动时间-->
                <h3 class="d01">活动时间</h3>
                <div class="mainInfo">天天出发</div>
                <!--行程特色-->
                <h3 class="d02">行程特色</h3>
                <div class="mainInfo">
                    <ul class="xcts">
                        <li>前往乘车时间：09：00正佳广场西门开车→约10：20抵达白水寨、锦绣香江温泉城→约10：30抵达金叶
                            子温泉度假酒店 </li>

                        <li>返程时间：16：30金叶子温泉度假酒店→ 约16：40白水寨景区大门口→16:50锦绣香江温泉城门口上车
                            返程广州。回程终点站：正佳广场西门。 </li>

                        <li>出发前一天晚上，会有专门的工作人员将当天直通车的车牌号及上车地点、时间以短信的形式通知到客
                            人。</li>
                    </ul>


                </div>
                <!--行程安排-->
                <h3 class="d03">行程安排</h3>
                <div class="mainInfo">
                    <h6><span>第一天</span>广州（大约1.5小时）金叶子温泉 </h6>
                    <p>早上于地点集中出发，后前往【金叶子温泉】：拥有广东省内海拔最高的温泉，温泉池区拥有 36 个大小
                        不同的温泉泡池，高山温泉水源来自深藏的地热温泉，水温高达 40 摄氏度 ，色泽透明，是极软的弱碱
                        性温泉，温泉中富含偏硅酸、纳、氟、硫磺、锌、铜、钙、镁等对人体健康有益的微量元素，是保健、
                        治疗、美容型温泉矿泉水的最佳泉水。下午于指定时间集中返回广州，结束愉快行程！</p>
                    <h6><span>第二天</span>广州（大约1.5小时）金叶子温泉 </h6>
                    <p>早上于地点集中出发，后前往【金叶子温泉】：拥有广东省内海拔最高的温泉，温泉池区拥有 36 个大小
                        不同的温泉泡池，高山温泉水源来自深藏的地热温泉，水温高达 40 摄氏度 ，色泽透明，是极软的弱碱
                        性温泉，温泉中富含偏硅酸、纳、氟、硫磺、锌、铜、钙、镁等对人体健康有益的微量元素，是保健、
                        治疗、美容型温泉矿泉水的最佳泉水。下午于指定时间集中返回广州，结束愉快行程！</p>
                </div>
                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td width="50%" valign="top">
                            <!--费用包含-->
                            <h3 class="d04">费用包含</h3>
                            <ul class="mpbh">
                                <li>门票：景点第一大门票。 </li>
                                <li>车：空调旅游车接送游玩。</li>
                                <li>小孩：只占车位。（1.1米以上按成人操作，1.1米以下有成人陪同不占车位免费）</li>
                                <li>保险：旅行社责任险（建议客人在前台报名时购买个人旅游意外险）。</li>
                            </ul>
                        </td>
                        <td width="50%" valign="top">
                            <!--费用不包含-->
                            <h3 class="d05">费用不包含</h3>
                            <ul class="mpbh">
                                <li>门票：景点第一大门票。 </li>
                                <li>车：空调旅游车接送游玩。</li>
                                <li>小孩：只占车位。（1.1米以上按成人操作，1.1米以下有成人陪同不占车位免费）</li>
                                <li>保险：旅行社责任险（建议客人在前台报名时购买个人旅游意外险）。</li>
                            </ul>
                        </td>
                    </tr>
                </table>
                <div class="mainInfo">
                </div>
                <!--温馨提示-->
                <h3 class="d06">温馨提示</h3>
                <div class="mainInfo" style="border-bottom:0;">
                    <ul class="wxts">
                        <li>门票：景点第一大门票。 </li>
                        <li>车：空调旅游车接送游玩。</li>
                        <li>小孩：只占车位。（1.1米以上按成人操作，1.1米以下有成人陪同不占车位免费）</li>
                        <li>保险：旅行社责任险（建议客人在前台报名时购买个人旅游意外险）。</li>
                    </ul>

                </div>

                <h3 class="d07">景点介绍</h3>
                <div class="mainInfo">
                    <ul class="jdjs">
                        <li>
                            <h2><span>01</span>阳朔西街</h2>
                            <div class="about">
                                <img src="images/tehui_pic01.jpg" />
                                有人说，阳朔西街是最具小资情调的地方。走在西街暮色中的石板路上，鞋跟轻轻叩打着路面，你会有一种奇怪的冲动，一种居住的冲动 来自美国的一位游客说："西街的建筑奇巧、精细，单这一项就可使     你花上好几天时间。"如今在西街， 你能看到的外国人比中国人还要多。这条长仅517米的小街，本是最传统的南国小镇街道，石板路面，灰砖骑楼；可它又是最洋气的：几所有的招牌都是英文，小街上至少有近10家商店有"Internet"、"E－Mail"服务，店里有多媒体电脑――这台电脑很可能就放在一张油漆剥落的农家方桌上。西街上几乎只有三种商店，咖啡店、T恤店、工艺品店。所以来阳朔，你不能不来西街。 20世纪80年代，西方一本被背包旅行者奉为"圣经"的《孤独行星》里面介绍了阳朔西街独特的风情。
                            </div>
                        </li>
                        <li>
                            <h2><span>02</span>阳朔西街</h2>
                            <div class="about">
                                <img src="images/tehui_pic01.jpg" />
                                有人说，阳朔西街是最具小资情调的地方。走在西街暮色中的石板路上，鞋跟轻轻叩打着路面，你会有一种奇怪的冲动，一种居住的冲动 来自美国的一位游客说："西街的建筑奇巧、精细，单这一项就可使     你花上好几天时间。"如今在西街， 你能看到的外国人比中国人还要多。这条长仅517米的小街，本是最传统的南国小镇街道，石板路面，灰砖骑楼；可它又是最洋气的：几所有的招牌都是英文，小街上至少有近10家商店有"Internet"、"E－Mail"服务，店里有多媒体电脑――这台电脑很可能就放在一张油漆剥落的农家方桌上。西街上几乎只有三种商店，咖啡店、T恤店、工艺品店。所以来阳朔，你不能不来西街。 20世纪80年代，西方一本被背包旅行者奉为"圣经"的《孤独行星》里面介绍了阳朔西街独特的风情。
                            </div>
                        </li>
                    </ul>

                </div>
                <div class="space20"></div>

                <h3 class="d07">景点介绍</h3>
                <div class="mainInfo" style="border-bottom:0;">
                    <img src="images/tehui_pic.jpg"  width="654"/>
                </div>
                <div class="space20"></div>
                <div class="space20"></div>
            </div>
        </div>
    </div>
    <!--右-->
    <div class="Index_right">
        <!---->
        <div class="ad04"><img src="images/ad_r04.jpg" /></div>
        <div class="space20"></div>
        <!---->
        <div style="position:relative;">
            <div class="tippic" style="top:-10px;"></div>
            <ul>
                <li>
                    <p>
                        <a href="#">
                            <img src="images/rpic01.jpg" />
                            <span>还剩11天8小时15分4.8秒</span>
                            <font>仅118元，原价188元从化超五星级崴格诗温泉庄园...</font>
                        </a>
                    </p>
                    <div class="Discount">
                        原价：188<br />
                        折扣：6.28
                    </div>
                    <h1>￥118</h1>
                    <div class="BUY">
                        <span>108</span>人抢购
                        <a href="#"><img src="images/buyicon.jpg" /></a>
                    </div>
                </li>
                <li>
                    <p>
                        <a href="#">
                            <img src="images/rpic01.jpg" />
                            <span>还剩11天8小时15分4.8秒</span>
                            <font>仅118元，原价188元从化超五星级崴格诗温泉庄园...</font>
                        </a>
                    </p>
                    <div class="Discount">
                        原价：188<br />
                        折扣：6.28
                    </div>
                    <h1>￥118</h1>
                    <div class="BUY">
                        <span>108</span>人抢购
                        <a href="#"><img src="images/buyicon.jpg" /></a>
                    </div>
                </li>
                <li>
                    <p>
                        <a href="#">
                            <img src="images/rpic01.jpg" />
                            <span>还剩11天8小时15分4.8秒</span>
                            <font>仅118元，原价188元从化超五星级崴格诗温泉庄园...</font>
                        </a>
                    </p>
                    <div class="Discount">
                        原价：188<br />
                        折扣：6.28
                    </div>
                    <h1>￥118</h1>
                    <div class="BUY">
                        <span>108</span>人抢购
                        <a href="#"><img src="images/buyicon.jpg" /></a>
                    </div>
                </li>
            </ul>
        </div>
        <!---->
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
