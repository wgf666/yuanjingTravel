package com.travel.controller;

import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import com.travel.entity.User;
import com.travel.service.IBackUserService;
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
@RequestMapping("back/user")
public class BackUserController {

    @Autowired
    private IBackUserService backUserService;


    //分页查询
    @RequestMapping("getUserList")
    private String getUserList(PageInfo<User> pageInfo, ModelMap map) {
        PageInfo<User> list = backUserService.getUserList(pageInfo);
        map.put("url", "back/user/getUserList");
        map.put("pageInfo", list);
        return "/back/user/userList";
    }

    //真实姓名查询
    @RequestMapping("selectByCondition")
    private String selectByCondition(PageInfo<User> pageInfo, String name, ModelMap map) {
        PageInfo<User> list = backUserService.selectByCondition(pageInfo, name);
        map.put("pageInfo", list);
        map.put("name", name);
        map.put("params", new Gson().toJson(map));
        map.put("url", "back/user/selectByCondition");
        map.put("checkName", name);
        return "/back/user/userList";
    }

    //id获取对象（搜索）
    @RequestMapping("getUserById/{id}")
    private String getUserById(@PathVariable("id") int id, ModelMap map) {
        //System.out.println(id);
        User user = backUserService.selectByPrimaryKey(id);
        map.put("user", user);
        return "/back/user/check";
    }

    //id获取对象（修改）
    @RequestMapping("updateById/{id}")
    private String updateById(@PathVariable("id") int id, ModelMap map) {
        //System.out.println(id);
        User user = backUserService.selectByPrimaryKey(id);
        map.put("user", user);
        return "/back/user/updataUser";
    }

    //修改
    @RequestMapping("update")
    private String update(User user) {
        //System.out.println(user);
        backUserService.updateByPrimaryKeySelective(user);
        return "/back/user/getUserList";
    }


    //id删除
    @RequestMapping("deleteById")
    @ResponseBody
    private int updateById(int id) {
        //System.out.println(id);
        return backUserService.deleteByPrimaryKey(id);
    }

    //id删除
    @RequestMapping("batchDelId")
    @ResponseBody
    private int batchDelId(@RequestParam("param") List<Integer> param) {
        //System.out.println(param.size());
        return backUserService.batchDelId(param);
    }

    //id获取对象（修改密码）
    @RequestMapping("changeById/{id}")
    private String changeById(@PathVariable("id") int id, ModelMap map) {
        //System.out.println(id);
        User user = backUserService.selectByPrimaryKey(id);
        map.put("user", user);
        return "/back/user/updatePassword";
    }

    //修改密码
    @RequestMapping("changePassword")
    @ResponseBody
    private int changeById(User user) {
        //System.out.println(user);
        return backUserService.updateByPrimaryKeySelective(user);
    }
}
