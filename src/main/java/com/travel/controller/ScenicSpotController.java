package com.travel.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import com.travel.entity.ScenicSpot;
import com.travel.service.IScenicSpotService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.naming.directory.SearchControls;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.TreeMap;

//scenicSpot/buy
@Controller
@RequestMapping("scenicSpot")
public class ScenicSpotController {
    @Autowired
    private IScenicSpotService iScenicSpotService;

    @RequestMapping("showSpotPic")
    public String showSpotPic(ModelMap map) {
        //国内路线
        List<ScenicSpot> ChinaSS = iScenicSpotService.getSpotPicByType(1);
        //国外路线
        List<ScenicSpot> abroad = iScenicSpotService.getSpotPicByType(0);
        //特价路线
        List<ScenicSpot> discount = iScenicSpotService.getSpotPicByPublish(2);
        //今日特惠
        List<ScenicSpot> today = iScenicSpotService.getSpotPicByPublish(3);
        map.put("ChinaSS", ChinaSS);
        //System.out.println(ChinaSS.size());
        map.put("abroad", abroad);
        map.put("discount", discount);
        map.put("today", today);
        return "index";
    }

    //国内线路的 ，前端遍历时，先遍历范围表，在遍历景点
    @RequestMapping("chinaline")
    public String chinaline(ModelMap map) {
        List<ScenicSpot> china = iScenicSpotService.getSpotPicByType(1);
        TreeMap<String, List<ScenicSpot>> TreeMap = new TreeMap<>();
        List<ScenicSpot> list = new ArrayList<>();
        for (ScenicSpot s : china) {
            list.add(s);
            //System.out.println("");
            TreeMap.put(s.getArrange(), list);
            if (list.size() >= 2) {
                list = new ArrayList<>();
            }
        }
        map.put("china", china);
        map.put("TreeMap", TreeMap);
        return "pre/domestic_index";
    }

    @RequestMapping("abroadline")
    public String abroadline(ModelMap map) {
        List<ScenicSpot> abroad = iScenicSpotService.getSpotPicByType(0);
        TreeMap<String, List<ScenicSpot>> TreeMap = new TreeMap<>();
        List<ScenicSpot> list = new ArrayList<>();
        for (ScenicSpot a : abroad) {
            list.add(a);
            TreeMap.put(a.getArrange(), list);
            if (list.size() >= 2) {
                list = new ArrayList<>();
            }
        }
        map.put("abroad", abroad);
        map.put("TreeMap", TreeMap);
        return "pre/dimestic_index2";
    }

    @RequestMapping("quyu")
    public String getByquyu(PageInfo<ScenicSpot> pageInfo, String arrang, ModelMap map) {

        PageInfo<ScenicSpot> list = iScenicSpotService.getSpotPicByArrang(pageInfo, arrang);
        map.put("pageInfo", list);
        map.put("arrang", arrang);
        HashMap<String, String> hashmap = new HashMap<>();
        hashmap.put("arrang", arrang);
        map.put("params", new Gson().toJson(hashmap));
        map.put("url", "scenicSpot/quyu");
        return "pre/domesticList";
    }

    @RequestMapping("buy/{id}")
    public String buy(@PathVariable("id") int id, ModelMap map) {
        ScenicSpot scenicSpot = iScenicSpotService.selectByPrimaryKey(id);
        map.put("info", scenicSpot);
        return "pre/preferInfo";
    }

    @RequestMapping("search")
    public String search(Integer county,PageInfo pageInfo,String special,ModelMap map){
    PageInfo<ScenicSpot> info=iScenicSpotService.search(pageInfo,county,special);
     map.put("pageInfo",info);
     map.put("special",special);
     map.put("url","scenicSpot/search");
     HashMap hashMap=new HashMap();
     hashMap.put("special",special);
     hashMap.put("county",county);
     map.put("params",new Gson().toJson(hashMap));
     return "/pre/search";
    }


}
