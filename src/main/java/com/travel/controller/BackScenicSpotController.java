package com.travel.controller;

import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import com.travel.entity.ScenicSpot;
import com.travel.service.IBackScenicSpotService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.*;

/**
 * @author:吴小富
 * @Date: 2019/12/21
 */
@Controller
@RequestMapping("back/scenicSpot")
public class BackScenicSpotController {

    @Autowired
    private IBackScenicSpotService backScenicSpotService;

    //查国内线路
    @RequestMapping("getArrangeByInland")
    public String getArrange(ModelMap map){
        //System.out.println("22222");
        List<ScenicSpot> scenicSpotList=backScenicSpotService.getArrangeByInland(1);
        Set<String> set=new TreeSet<>();
        for (ScenicSpot scenicSpot : scenicSpotList) {
            set.add(scenicSpot.getArrange());
        }
        map.put("set", set);
        return "back/scenicSpot/inland";
    }


    //地区查国内线路
    @RequestMapping("getSpecialByArrange")
    @ResponseBody
    public String getSpecialByArrange(String arrange){
        try {
            arrange = URLDecoder.decode(arrange, "utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        List<ScenicSpot> scenicSpotList=backScenicSpotService.getSpecialByArrange(arrange);

        Map<Integer,String> map=new TreeMap<>();
        for (int i = 0; i < scenicSpotList.size(); i++) {
            map.put(scenicSpotList.get(i).getId(), scenicSpotList.get(i).getSpecial());
        }
        return new Gson().toJson(map);
    }

    //地区和省份查国内线路
    @RequestMapping("getList")
    public String getList(int id, String arrange, PageInfo<ScenicSpot> pageInfo,ModelMap map){
        //System.out.println(id+"---"+arrange);
        PageInfo<ScenicSpot> list=null;
        map.put("arrange", arrange);
        map.put("id",id);
        if(id==-1){
            list=backScenicSpotService.getListByArrange(pageInfo,arrange);
            //System.out.println("地区");
            map.put("params",new Gson().toJson(map));
            map.put("url", "back/scenicSpot/getList");
            map.put("pageInfo",list);
            return "back/scenicSpot/inlandInfo";
        }

        list = backScenicSpotService.getListById(pageInfo, id);
        //System.out.println("id");
        map.put("params", new Gson().toJson(map));
        map.put("url", "back/scenicSpot/getList");
        map.put("pageInfo",list);
        return "back/scenicSpot/inlandInfo";
    }

    //id查国内线路对象
    @RequestMapping("updateById/{id}")
    public String updateById(@PathVariable("id") int id,ModelMap map){
        //System.out.println(id);
        ScenicSpot scenicSpot = backScenicSpotService.selectByPrimaryKey(id);
        map.put("scenicSpot",scenicSpot);
        return "back/scenicSpot/updataScenicSpot";
    }

    //修改国内、境外线路
    @RequestMapping("update")
    public void update(ScenicSpot scenicSpot){
        //System.out.println(1);
        backScenicSpotService.updateByPrimaryKeySelective(scenicSpot);
    }

    //添加国内线路
    @RequestMapping("add")
    public String add(ScenicSpot scenicSpot){
        scenicSpot.setCounty(1);
        System.out.println(scenicSpot);
        backScenicSpotService.insert(scenicSpot);
        return "redirect:/back/scenicSpot/getArrangeByInland";
        //return "";
    }

    //删除国内、境外线路
    @RequestMapping("delete")
    @ResponseBody
    public int delete(int id){
        //System.out.println(id);
        return backScenicSpotService.deleteByPrimaryKey(id);
    }

    //查境外线路
    @RequestMapping("getArrangeByForeign")
    public String getArrangeByForeign(ModelMap map){
        //System.out.println("22222");
        List<ScenicSpot> scenicSpotList=backScenicSpotService.getArrangeByInland(0);
        Set<String> set=new TreeSet<>();
        for (ScenicSpot scenicSpot : scenicSpotList) {
            set.add(scenicSpot.getArrange());
        }
        map.put("set", set);
        return "back/scenicSpot/foreign";
    }

    //大洲和国家查境外线路
    @RequestMapping("getForeignList")
    public String getForeignList(int id, String arrange, PageInfo<ScenicSpot> pageInfo,ModelMap map){
        //System.out.println(id+"---"+arrange);
        PageInfo<ScenicSpot> list=null;
        map.put("arrange", arrange);
        map.put("id",id);
        if(id==-1){
            list=backScenicSpotService.getListByArrange(pageInfo,arrange);
            //System.out.println("地区");
            map.put("params",new Gson().toJson(map));
            map.put("url", "back/scenicSpot/getList");
            map.put("pageInfo",list);
            return "back/scenicSpot/inlandInfo";
        }

        list = backScenicSpotService.getListById(pageInfo, id);
        //System.out.println("id");
        map.put("params", new Gson().toJson(map));
        map.put("url", "back/scenicSpot/getList");
        map.put("pageInfo",list);
        return "back/scenicSpot/foreignInfo";
    }

    //id查境外线路对象
    @RequestMapping("updateForeignById/{id}")
    public String updateForeignById(@PathVariable("id") int id,ModelMap map){
        //System.out.println(id);
        ScenicSpot scenicSpot = backScenicSpotService.selectByPrimaryKey(id);
        map.put("scenicSpot",scenicSpot);
        return "back/scenicSpot/updataScenicSpot1";
    }
    //添加境外线路
    @RequestMapping("addForeign")
    public String addForeign(ScenicSpot scenicSpot){
        scenicSpot.setCounty(0);
        //System.out.println(scenicSpot);
        backScenicSpotService.insert(scenicSpot);
        return "redirect:/back/scenicSpot/getArrangeByForeign";
    }
}
