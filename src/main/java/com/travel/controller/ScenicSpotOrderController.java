package com.travel.controller;

import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import com.travel.entity.Orders;
import com.travel.entity.ScenicSpot;
import com.travel.entity.Traveller;
import com.travel.entity.User;
import com.travel.service.IOrderService;
import com.travel.service.IScenicSpotService;
import com.travel.service.ITravellerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("ScenicSpotOrder")
public class ScenicSpotOrderController {
    @Autowired
    private IScenicSpotService iScenicSpotService;
    @Autowired
    private ITravellerService iTravellerService;
    @Autowired
    private IOrderService iOrderService;

   //跳转到报名页面，填写详细信息，生成订单
    @RequestMapping("baoming")
    public String baoming(int id, ModelMap map, HttpServletRequest request){
        ScenicSpot scenicSpot = iScenicSpotService.selectByPrimaryKey(id);
        map.put("info",scenicSpot);
        if(!"".equals(id)){
            //生成订单
            User user = (User) request.getSession().getAttribute("user");
            Orders o = new Orders();
            String s = UUID.randomUUID().toString();
            o.setUid(s);
            o.setState(0);
            Date date = new Date(System.currentTimeMillis());
            o.setCreateTime(date);
            o.setUserId(user.getId());
            o.setScenicId(id);
            o.setStartTime(scenicSpot.getTime());
            o.setTicketPrice(scenicSpot.getDiscount());
            iOrderService.insert(o);
            Orders orders = iOrderService.selectByuid(o);
            map.put("order",orders);
        }
        return "/pre/baoming";
    }
    //订单生成后，未支付
    @RequestMapping("tobaoming")
    public String tobaoming(String uid, ModelMap map){
        Orders orders=new Orders();
        orders.setUid(uid);
        //System.out.println(orders);
        orders = iOrderService.selectByuid(orders);
        //System.out.println(orders.getScenicId());
        ScenicSpot scenicSpot = iScenicSpotService.selectByPrimaryKey(orders.getScenicId());
        //System.out.println(scenicSpot);
            map.put("info",scenicSpot);
            map.put("order",orders);
        return "/pre/baoming";
    }
   //订单完成信息填写，跳转到支付页面
    @RequestMapping("topay")
    public String topay(Orders orders,ModelMap map){
        int i= iOrderService.updateByuid(orders);
          Orders order=iOrderService.selectByuid(orders);
          Integer id = order.getId();
          List<Traveller>  list= iTravellerService.selectByorderid(id);
          map.put("list",list);
          map.put("order",order);
          return "/pre/pay";
    }

    //添加旅客信息
    @RequestMapping("traveller")
    @ResponseBody
    public Integer traveller(Traveller traveller){
        int i=iTravellerService.insert(traveller);
         int result=0;
        if(i>0){
             result=200;
        }
        return result;
    }
    //支付页面，完成，跳转成功界面
    @RequestMapping("pay")
    public String pay(Orders orders,ModelMap map){

        orders.setState(1);
        int i = iOrderService.updateByPrimaryKeySelective(orders);
        if(i>0){
             Orders order = iOrderService.selectByPrimaryKey(orders.getId());
             map.put("order",order);
        }
        return "/pre/baomingSuccess";
    }


    //管理员 查询， 通过和没通过的订单
    @RequestMapping("chaxun")
    public String chaxun(int state, PageInfo<Orders> pageInfo,ModelMap map){
       PageInfo<Orders> orders=iOrderService.getBystate(state,pageInfo);
        map.put("url","ScenicSpotOrder/chaxun");
        Map<String,Integer> hashmap=new HashMap<>();
        hashmap.put("state",state);
        map.put("params",new Gson().toJson(hashmap));
        map.put("pageInfo",orders);



        return "/back/scenicSpot/orderInfo";
    }

    //拒绝提交的订单，没交钱是0，交钱是1，同意是2，不同意是3，同意是4
     @RequestMapping("refuse")
        public String reguse(Integer id){
        Orders orders=new Orders();
        orders.setState(3);
        orders.setId(id);
         int i = iOrderService.updateByPrimaryKeySelective(orders);
         return "forward:/ScenicSpotOrder/chaxun?state=1";
    }
    @RequestMapping("pass")
    public String pass(Integer id){
        Orders orders=new Orders();
        orders.setState(4);
        orders.setId(id);
        int i = iOrderService.updateByPrimaryKeySelective(orders);
        return "forward:/ScenicSpotOrder/chaxun?state=1";
    }

    @RequestMapping("detail")
    public String detail(Integer id,ModelMap map){
        Map<String,String> m=iOrderService.getBydetail(id);
        map.put("info",m);
        for(Map.Entry<String, String> stringStringEntry : m.entrySet()) {
            System.out.println(stringStringEntry.getKey()+" "+stringStringEntry.getValue());
        }
        return "/ScenicSpotOrder/chaxun";
    }

    @RequestMapping("update")
    public String add(int id,int state){
      int  i =iOrderService.updateState(id,state);

     return "forward:/ScenicSpotOrder/chaxun?state="+state;
    }

    @RequestMapping("orders")
    public  String orders(Integer id,PageInfo<Orders> pageInfo,ModelMap map){
        PageInfo<Orders> orders=iOrderService.orders(id,pageInfo);

        Map<String,Integer> hashmap=new HashMap<>();
        hashmap.put("id",id);
        map.put("params",new Gson().toJson(hashmap));
        map.put("pageInfo",orders);
        map.put("url","ScenicSpotOrder/orders");

        return  "/pre/orders";
    }

}
