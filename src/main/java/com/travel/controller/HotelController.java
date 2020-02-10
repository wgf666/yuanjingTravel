package com.travel.controller;

import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import com.travel.entity.Grogshop;
import com.travel.service.IGrogShopService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author:吴小富
 * @Date: 2019/12/18
 */
@Controller
@RequestMapping("grogshop")
public class HotelController {

    @Autowired
    private IGrogShopService grogShopService;


    //酒店列表
    @RequestMapping("getGrogShop")
    public String getGrogShop(ModelMap map){
        List<Grogshop> list=grogShopService.getGrogShop();
        map.put("list", list);
        return "/pre/hotel";
    }

    //id查酒店
    @RequestMapping("getGrogShopById")
    @ResponseBody
    public Grogshop getGrogShopById(@Param("id") int id){
        //System.out.println(id);
        Grogshop grogshop=grogShopService.selectByPrimaryKey(id);
        return grogshop;
    }


    //city查酒店
    @RequestMapping("selectByCondition")
    public String selectByCondition(PageInfo<Grogshop> pageInfo,String cityName,ModelMap map){
        PageInfo<Grogshop> grogshop=grogShopService.selectByCondition(pageInfo,cityName);
        map.put("pageInfo", grogshop);
        map.put("cityName", cityName);
        map.put("params", new Gson().toJson(map));
        map.put("url", "grogshop/selectByCondition");
        return "/back/hotel/hotelList";
    }

    //分页查酒店
    @RequestMapping("getHotelList")
    public String getHotelList(PageInfo<Grogshop> pageInfo, ModelMap map){
        PageInfo<Grogshop> grogShop = grogShopService.getHotelList(pageInfo);
        map.put("url","grogshop/getHotelList");
        map.put("pageInfo", grogShop);
        return "/back/hotel/hotelList";
    }

    //id查询修改对象
    @RequestMapping("updateById/{id}")
    private String updateById(@PathVariable("id") int id, ModelMap map){
        Grogshop grogshop = grogShopService.selectByPrimaryKey(id);
        map.put("grogshop",grogshop);
        return "back/hotel/updataHotel";
    }

    //修改
    @RequestMapping("update")
    private String update(Grogshop grogshop){
        //System.out.println(grogshop);
        grogShopService.updateByPrimaryKeySelective(grogshop);
        return "redirect:/grogshop/getHotelList";
    }

    //添加
    @RequestMapping("add")
    private String add(Grogshop grogshop){
        //System.out.println(grogshop);
        int insert = grogShopService.insert(grogshop);
        return "redirect:/grogshop/getHotelList";
    }

    //id删除
    @RequestMapping("deleteById")
    @ResponseBody
    private int deleteById(int id){
        //System.out.println(id);
        return grogShopService.deleteByPrimaryKey(id);
    }

    //批量删除
    @RequestMapping("batchDelId")
    @ResponseBody
    private int batchDelId(@RequestParam("param") List<Integer> param){
        //System.out.println(id);
        return grogShopService.batchDelId(param);
    }


}
