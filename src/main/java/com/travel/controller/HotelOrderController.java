package com.travel.controller;

import com.travel.entity.GrogshopOrder;
import com.travel.service.IGrogShopOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;

/**
 * @author:吴小富
 * @Date: 2019/12/18
 */
@Controller
@RequestMapping("HotelOrder")
public class HotelOrderController {

    @Autowired
    private IGrogShopOrderService grogShopOrderService;

    //添加订单
    @RequestMapping("add")
    public String add(GrogshopOrder grogshopOrder){
        //System.out.println("111");
        grogShopOrderService.insert(grogshopOrder);
        return "pre/success";
    }


}
