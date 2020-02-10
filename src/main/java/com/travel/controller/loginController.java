package com.travel.controller;


import com.travel.entity.User;

import com.travel.service.IUserService;
import com.travel.utils.mysalt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;


@Controller
public class loginController {

    @Autowired
    private IUserService iuserService;

    //校验用户名
    @RequestMapping("checkLogin")
    @ResponseBody
    public int checkLogin(String name) {
        //System.out.println(name);
        User user = iuserService.login(name);
        if (user==null) {
           return 0;
        }
        return 1;
    }

    //校验验证码
    @RequestMapping("checkCode")
    @ResponseBody
    public int checkCode(String CODE, HttpServletRequest request) {
        //System.out.println(CODE);
        Object object = request.getSession().getAttribute("imgCodePre");
        String imgCode=object.toString();
        if(!CODE.equals(object)){
            return 0;
        }
        return 1;
    }

    //登录
    @RequestMapping("login")
    public String login(User user, boolean RememberMe, HttpServletRequest request, ModelMap map) {
        User user1 = iuserService.login(user.getName());
        if(user.getPassword().equals(user1.getPassword())){
            request.getSession().setAttribute("user", user1);
            User user2 = (User) request.getSession().getAttribute("user");
            map.put("user", user1);
            return "/pre/member_index";
        }else{
            if(user1.getPassword().length()>15){
                String password = mysalt.encryption(user.getName(), user.getPassword());
                if (password.equals(user1.getPassword())) {
                    request.getSession().setAttribute("user", user1);
                    map.put("user", user1);
                    return "/pre/member_index";
                }
            }
        }

        return "/pre/login";
    }

}