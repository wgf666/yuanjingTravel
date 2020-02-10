package com.travel.controller;

import com.github.pagehelper.PageInfo;
import com.travel.entity.Ari;
import com.travel.service.IBackAirService;
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
 * @Date: 2019/12/20
 */
@Controller
@RequestMapping("back/air")
public class BackAirController {

    @Autowired
    private IBackAirService backAirService;

    //分页查询
    @RequestMapping("getAirList")
    public String getAirList(PageInfo<Ari> pageInfo, ModelMap map){
        PageInfo<Ari> list=backAirService.getAirList(pageInfo);
        map.put("url","back/air/getAirList");
        map.put("pageInfo", list);
        return "back/air/airList";
    }

    //模糊查询
    @RequestMapping("getAirByName")
    public String getAirByName(PageInfo<Ari> pageInfo,String ariName, ModelMap map){
        PageInfo<Ari> list=backAirService.getAirByName(pageInfo,ariName);
        map.put("url","back/air/getAirList");
        map.put("pageInfo", list);
        map.put("checkName", ariName);
        return "back/air/airList";
    }

    //id查对象
    @RequestMapping("updateById/{id}")
    public String updateById(@PathVariable int id,ModelMap map){
        //System.out.println(id);
        Ari ari = backAirService.selectByPrimaryKey(id);
        map.put("air", ari);
        return "back/air/updateAir";
    }

    //修改
    @RequestMapping("update")
    public void update(Ari ari){
        //System.out.println(id);
        backAirService.updateByPrimaryKeySelective(ari);
    }

    //删除
    @RequestMapping("deleteById")
    @ResponseBody
    public int deleteById(int id){
        //System.out.println(id);
        return backAirService.deleteByPrimaryKey(id);
    }

    //批量删除
    @RequestMapping("batchDelId")
    @ResponseBody
    public int batchDelId(@RequestParam("param")List<Integer> param){
        //System.out.println(param.size());
        return backAirService.batchDelId(param);
    }

    //添加
    @RequestMapping("add")
    public String add(Ari ari){
        //System.out.println(ari);
        backAirService.insert(ari);
        return "redirect:/back/air/getAirList";
    }

}
