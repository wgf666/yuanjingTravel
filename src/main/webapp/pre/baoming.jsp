<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        var nav= '04'
        var right= '03'
    </script>
    <script type="text/javascript">
        $(function () {
            $("#topay").click(function () {
                    var flag;
                if($("#agreement").attr("checked")&&$("#contract").attr("checked")){
                            flag=true;
                        }
                if(!flag) { alert("请先同意协议"); return false;}
                $("#myform").submit();
            })


          /* 购买数量的加减*/
          $("#sub").click(function () {
               var shuliang =parseInt($("#shuliang").val());
              if(shuliang>1){
                  shuliang-=1;
              }
              $("#shuliang").val(shuliang);
              $("#zs").text(shuliang);
              $("#zj").text(shuliang*${info.discount});
              $("#lk").text(shuliang);
              $("#qq").text(shuliang);
              $("#ww").text(shuliang*${info.discount});
              $("#qq1").text(shuliang);
              $("#ww1").text(shuliang*${info.discount});
              $("#ticketCount").attr("value",shuliang);
              $("#total").attr("value",shuliang*${info.discount});
                  $("#ll a:last").not($("#yincang1")).remove();
                  $("#ll div:last").not($("#yincang2")).remove();

          })

            $("#add").click(function () {
                var shuliang = parseInt($("#shuliang").val());
               if(shuliang<48){
                   shuliang+=1;
               }
                $("#shuliang").val(shuliang);
                $("#zs").text(shuliang);
                $("#zj").text(shuliang*${info.discount});
                $("#lk").text(shuliang);
                $("#qq").text(shuliang);
                $("#ww").text(shuliang*${info.discount});
                $("#qq1").text(shuliang);
                $("#ww1").text(shuliang*${info.discount});
                $("#ticketCount").attr("value",shuliang);
                $("#total").attr("value",shuliang*${info.discount});


                for (var i =2; i <=shuliang; i++) {
                    var a='<a  id="yincang1"  href="javascript:void(0)" class="FillIn">第 <font>'+i+'</font> 位旅客信息 （成人　等待添加旅客信息） [添加旅客信息]</a>\n' +
                        '                    <div id="yincang2" class="fillin_table">\n' +
                        '                        <h3><span><input type="button" class="surebtn" value="取消" /></span>第 '+i+'位旅客信息<input type="button" class="surebtn" value="常用旅客" /></h3>\n' +
                        '                        <!---->\n' +
                        '                        <form   class="tra">\n' +
                        '                            <input type="hidden" name="orderId" value="${order.id}">\n' +
                        '                        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="table1">\n' +
                        '\n' +
                        '                            <tr><td align="right"><i>*</i>姓名：</td><td><input type="text" name="name" class="input01" /></td><td width="120" align="right"></tr>\n' +
                        '                            <tr><td align="right"><i>*</i>性别：</td><td colspan="3">\n' +
                        '                                <label>\n' +
                        '                                    <input type="radio" name="sex" value="0" id="sex_0" />\n' +
                        '                                    男</label>\n' +
                        '                                <label>\n' +
                        '                                    <input type="radio" name="sex" value="1" id="sex_1" />\n' +
                        '                                    女</label></td></tr>\n' +
                        '                            <tr><td align="right" width="120"><i>*</i>出生日期：</td><td colspan="3"><input type="date" name="birthdate" class="input03" value="2012-12-22" /></td></tr>\n' +
                        '                            <tr><td align="right" width="120"><i>*</i>证件号码：</td><td><input type="text" name="type" class="input01" /></td></tr>\n' +
                        '                            <tr><td align="right"><i>*</i>请选择上车地点：</td><td colspan="3"> <select  name="number" >\n' +
                        '                                <option value="07:30，梅东路（地铁1、5号线杨箕站D/E出口，中国银行大门前）" selected="selected">07:30，梅东路（地铁1、5号线杨箕站D/E出口，中国银行大门前）</option>\n' +
                        '                                <option value="08:30，佛山南海广场对面公交车站">08:30，佛山南海广场对面公交车站</option>\n' +
                        '                            </select></td></tr>\n' +
                        '                            <tr><td></td><td colspan="3"><input type="button" value="确认旅客信息" class="sure" /> 确认后自动保存为常用旅客</td></tr>\n' +
                        '                        </table>\n' +
                        '                        </form>\n' +
                        '                        <!---->\n' +
                        '                    </div>';
                }
                $("#ll").append(a);
            })
            /* 商品的总数和总价 */
        })
    </script>

    <script type="text/javascript">
        $(function () {
            $(".FillIn").live("click",function(){
                $(this).next(".fillin_table").show();
                $(this).hide();
            })
            $(".surebtn").live("click",function(){
                $(this).parent().parent().parent().prev(".FillIn").show();
                $(this).parent().parent().parent().hide();

            })
            $(".sure").live("click",function () {
                 var  id= $(this).parent().parent().parent().parent().parent();
               var  div = $(this).parent().parent().parent().parent().parent().parent();
                $.ajax({
                     type:"post",
                     url:"ScenicSpotOrder/traveller",
                     dataType: "json",
                     data: id.serialize(),
                     success:function (result) {
                          if(result==200){
                             div.prev(".FillIn").show();
                             div.hide();
                          }else {
                              alert("提交失败")
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
    <div class="Current">您当前的位置：<a href="#">首页</a> > 预约验证</div>

    <div id="idstep03"></div>
    <div class="space20"></div>
    <!--左-->
    <div class="Index_left">

        <div class="step">
            <h5>如过了购买截止时间仍未付款，订单会自动关闭，所以请及时付款，以免错过！</h5>

            <table cellpadding="0" cellspacing="0" border="0" width="100%" class="table1">
                <tr>
                    <td align="right">出发日期：</td>
                    <td colspan="3"><b class="color"><fmt:formatDate value="${info.time}" pattern="yyyy-MM-dd HH:mm" /></b>  </td>
                </tr>
                <tr>
                    <td align="right">购买数量：</td>
                    <td><input type="button" id="sub" class="btn01"  value="-"/><input type="text" id="shuliang" class="input05"  value="1"/><input type="button" id="add" class="btn01"  value="+"/>
                        <span class="yuan">票价：<b class="color">${info.discount}</b>元/人</span></td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="3">
                        <b style="font-size:12px;">备注：本线路最多可购买 48 份。<br />
                            12周岁以下（不含12周岁）客人免费，一位成年人只能带一名儿童，部分景区超高自理。</b>
                    </td></tr>
                <tr>
                    <td></td>
                    <td colspan="3">
                        总人数： <b class="color size"><span id="zs">1</span> </b>人     金额总计：<b class="color size">￥<span id="zj">${info.discount}</span></b>
                    </td></tr>

            </table>

            <div class="space20"></div>
            <h5>填写资料</h5>

            <div class="To">
                <!--联系人资料-->
                <div class="Tolist">
                    <h2>1.联系人资料 <A href="#">【修改】</A></h2>

                    姓名：${user.name}　手机：${user.phone}　　邮箱：${user.eMail}
                </div>
                <!--添加旅客信息-->
                <div id="ll" class="Tolist" >
                    <h2>2.旅客资料<span>旅客人数：<b><span id="lk">1</span></b>人</span></h2>

                    <a  id="yincang1"  href="javascript:void(0)" class="FillIn">第 <font>1</font> 位旅客信息 （成人　等待添加旅客信息） [添加旅客信息]</a>
                    <div id="yincang2" class="fillin_table">
                        <h3><span><input type="button" class="surebtn" value="取消" /></span>第 1 位旅客信息<input type="button" class="surebtn" value="常用旅客" /></h3>
                        <!---->
                        <form   class="tra">
                            <input type="hidden" name="orderId" value="${order.id}">
                        <table cellpadding="0" cellspacing="0" border="0" width="100%" class="table1">

                            <tr><td align="right"><i>*</i>姓名：</td><td><input type="text" name="name" class="input01" /></td><td width="120" align="right"></tr>
                            <tr><td align="right"><i>*</i>性别：</td><td colspan="3">
                                <label>
                                    <input type="radio" name="sex" value="0" id="sex_0" />
                                    男</label>
                                <label>
                                    <input type="radio" name="sex" value="1" id="sex_1" />
                                    女</label></td></tr>
                            <tr><td align="right" width="120"><i>*</i>出生日期：</td><td colspan="3"><input type="date" name="birthdate" class="input03" value="2012-12-22" /></td></tr>
                            <tr><td align="right" width="120"><i>*</i>证件号码：</td><td><input type="text" name="type" class="input01" /></td></tr>
                            <tr><td align="right"><i>*</i>请选择上车地点：</td><td colspan="3"> <select  name="number" >
                                <option value="07:30，梅东路（地铁1、5号线杨箕站D/E出口，中国银行大门前）" selected="selected">07:30，梅东路（地铁1、5号线杨箕站D/E出口，中国银行大门前）</option>
                                <option value="08:30，佛山南海广场对面公交车站">08:30，佛山南海广场对面公交车站</option>
                            </select></td></tr>
                            <tr><td></td><td colspan="3"><input type="button" value="确认旅客信息" class="sure" /> 确认后自动保存为常用旅客</td></tr>
                        </table>
                        </form>
                        <!---->
                    </div>



                </div>

                <!--附加说明-->
                <div class="Tolist" style="position:relative; height:auto !important;height:50px;  min-height:50px;">

                    <div class="aa">
                        <div class="ac">
                            <h2>3.附加说明 </h2>
                            <div class="bb">如有留言，请填写，200字内。</div>
                        </div>
                        <div class="showmore"><a href="#">【<span class="open">修改</span>】</a></div>
                        <div class="ab">
                            <p>你需要留言吗？</p>
                            <textarea id="mm" style="width:500px; height:90px;"></textarea>
                            <p>*剩余字数： 200 </p>
                            <input id="mm1" type="button" class="surebtn" value="确认信息" />
                        </div>
                    </div>
                    <script>
                        $("#mm1").click(function () {
                            var area=$("#mm").val();
                            $("#hidden1").attr("value",area);
                            $(".showmore").next().hide();
                            $(".open").text("修改");
                            $(".bb").text("如有留言，请填写，200字内。");
                        })
                        $(".showmore a span").toggle(
                            function () {
                                $(this.parentNode.parentNode).next().show();
                                $(".open").text("关闭");
                                $(".bb").text("");
                            },
                            function () {
                                $(this.parentNode.parentNode).next().hide();
                                $(".open").text("修改");
                                $(".bb").text("如有留言，请填写，200字内。");
                            }

                        );
                    </script>
                </div>
                <!--订单清单-->
                <div class="Tolist" style="border-bottom:0;">
                    <h2>4.订单清单 </h2>
                    <form id="myform" action="ScenicSpotOrder/topay" method="post">
                    <table cellpadding="0" cellspacing="0" border="0" width="100%" class="table2">
                      <input type="hidden" id="hidden1" name="explain" />
                      <input type="hidden" id="ticketCount" name="ticketCount" value="1" />
                      <input type="hidden" id="total" name="total" value="${info.discount}" />
                      <input type="hidden"  name="uid" value="${order.uid}" />



                        <tr>
                            <th width="30%">名称</th>
                            <th width="20%">单价<br />（元/人）</th>
                            <th width="5%"> 人数</th>
                            <th width="20%">小计</th>
                        </tr>
                        <tr>
                            <td width="30%" align="center"><a href="#">${info.scenicIntroduction}</a><br />出发时间：<fmt:formatDate value="${info.time}" pattern="yyyy-MM-dd"></fmt:formatDate> </td>
                            <td width="20%" align="center">￥${info.discount} </td>
                            <td id="qq" width="5%" align="center">1</td>
                            <td id="ww" width="20%" align="center"><em>￥${info.discount}</em> </td>
                        </tr>
                        <tr><td colspan="6" align="right">

                            总人数：<em><span id="qq1">1</span></em>人
                            <br />
                            订单金额：<em>￥<span id="ww1">${info.discount}</span></em> 元
                        </td></tr>
                    </table>
                </div>
            </div>


            <div class="wrap">
                <p> <input type="checkbox" id="agreement" name="agreement"><label for="agreement">我已经仔细阅读并同意</label><a class="" href="#">《远景网线上协议》</a></p>
                <p>
                    <input type="checkbox" id="contract" name="contract"><label for="contract">我已经仔细阅读并同意</label><a href="#">《广东省国内旅游组团合同》</a></p>
                <p>
                    <input id="topay" type="button"class="sure" value="确认无误 提交订单"  />
                </p>
            </div>
            </form>
        </div>



    </div>
    <!--右-->
    <div class="Index_right">
        <!---->
        <div class="booK">
            <h2>您所选的团购是</h2>
            <h3>
                <a href="scenicspot/buy?${info.id}"><img src=${info.image} /></a>
                <p><a href="scenicspot/buy?${info.id}">【${info.scenicName}】${info.scenicIntroduction}</a></p>
            </h3>
            <h4>出发日期：<strong><fmt:formatDate value="${info.time}" pattern="yyyy-MM-dd HH:mm" /></strong></h4>
        </div>

        <!---->
        <div class="space20"></div>
        <div class="booKtips">
            <h2>温馨提示</h2>
            <div class="main">

                1. 出游日期：2013年2月11日（大年初二）、2013年2月12日（大年初三）早上出发（仅2期）
                2. 咨询电话： 020-61138246（10条分线）（周一至周日，上班时间：上午9：00-下午18：00）；
                3. 预约资料：请填写姓名、性别、出团日期、人数和身份证号（办理个人旅游意外险），如不申明或实际参团人与预约时填写的姓名不一致，则视为自动放弃个人旅游意外伤害险；
                4. 预约后，提前4天以上（含4天）可申请取消出行，若临时（离出行日期2天以内）取消行程，我们将会扣除该团的实际损失费后，在扣除5%的手续费，剩下的钱会汇款到您所指定的账号上；
                5. 行程内时间为约数，以当天实际时间为准，黄金周期间人多，请尽早预约。此优惠不可与店内其他优惠同时享受。
                6. 此单1.2米以下不占床位350元/人（详情咨询商家），含车位及保险，如超高门票自理，1.2米以上按成人价收费。
                7. 集中上车点：7:30梅东路（地铁1、5号线杨箕站D/E出口，中国银行大门前）集合，8:30佛山南海广场对面公交车站（若南海上车点人数不足8人，需自行到广州上车），认"畅游阳朔"导游旗；
                8. 请一定要带上身份证,入住需要登记,如无身份证无法办理入住手续。
                9. 请用户准时候车，若未准时集中视为主动放弃并不退款，请谅解；
                10. 如人数不足40人旅行社会提前24小时电话通知取消或者推迟，届时客人有权选择改期或退款。
                11. 投诉监督热线：020-38934034 (接受游客对行程的投诉与监督，并将及时给予答复和解决方案)。
                12. 以上时间为出发大约时间，我司有权根据实际情况，在保证行程景点游览的前提下，有权对景点游览的先后顺序作合理的调整。
                13. 如遇塌方、大雪封山、塞车或航班延误等因素造成的行程延误或不能完成景点游览，不视为旅行社违约，按《广东省国内旅游组团合同》第三条第7款处理。
                14. 特别须知：如遇国家政策性调价或人力不可抗拒因素所产生的费用由客人自理。
                15. 建议双人出行，若出现单男单女，无人拼房，出发需补房差100元/晚，若3人挤一间标双房，酒店住宿不退款；

            </div>
        </div>
        <!---->
        <div class="space10"></div><!---->
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

