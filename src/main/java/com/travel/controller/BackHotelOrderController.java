package com.travel.controller;

import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import com.travel.entity.GrogshopOrder;
import com.travel.service.IGrogShopOrderService;
import com.travel.service.IGrogShopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author:吴小富
 * @Date: 2019/12/24
 */
@Controller
@RequestMapping("back/hotel")
public class BackHotelOrderController {

    @Autowired
    private IGrogShopOrderService grogShopOrderService;

    //根据状态分页查询
    @RequestMapping("getList/{status}")
    public String getList(PageInfo<GrogshopOrder> pageInfo,@PathVariable int status, ModelMap map){
        PageInfo<GrogshopOrder> list=grogShopOrderService.getList(pageInfo,status);
        map.put("status",status);
        //map.put("params", new Gson().toJson(map));
        map.put("url", "back/hotel/getList/"+status);
        map.put("pageInfo", list);
        return "back/hotel/hotelOrder";
    }

    //id查询详细信息
    @RequestMapping("getHotelById/{id}")
    public String getHotelById(@PathVariable int id, ModelMap map){
        //System.out.println(id);
        GrogshopOrder grogshopOrder=grogShopOrderService.getHotelById(id);
        map.put("grogshopOrder",grogshopOrder);
        return "back/hotel/check";
    }


    //删除
    @RequestMapping("deleteById")
    @ResponseBody
    public int deleteById(int id){
        //System.out.println(id);
        return grogShopOrderService.deleteByPrimaryKey(id);
    }

    //根据状态模糊查询
    @RequestMapping("selectByCondition")
    public String selectByCondition(PageInfo<GrogshopOrder> pageInfo, String Hname,int status, ModelMap map){
        //System.out.println("后台："+Hname+"---"+status);
        PageInfo<GrogshopOrder> grogshop=grogShopOrderService.selectByCondition(pageInfo,Hname,status);
        map.put("pageInfo", grogshop);
        map.put("Hname", Hname);
        map.put("params", new Gson().toJson(map));
        map.put("url", "back/hotel/selectByCondition");
        return "back/hotel/hotelOrder";
    }

    //id处理订单
    @RequestMapping("updateByStatus")
    @ResponseBody
    public int updateByStatus(int id){
        //System.out.println("后台："+id);
        return grogShopOrderService.updateByStatus(id);
    }

    //批量删除
    @RequestMapping("batchDelId")
    @ResponseBody
    public int batchDelId(@RequestParam("param") List<Integer> param){
        //System.out.println(param.size());
        return grogShopOrderService.batchDelId(param);
    }
}
