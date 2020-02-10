package com.travel.controller;

import com.travel.entity.Admin;
import com.travel.service.IAdminService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * @author:吴小富
 * @Date: 2019/12/19
 */
@Controller
@RequestMapping("back")
public class AdminLoginController {

    @Autowired
    private IAdminService adminService;

    //验证验证码
    @RequestMapping("checkLogin")
    @ResponseBody
    public int checkLogin(String CODE, HttpServletRequest request){
        //System.out.println(CODE);
        Object object = request.getSession().getAttribute("imgCodeBack");
        String imgCode=object.toString();
        if(!CODE.equals(object)){
            return 0;
        }
        return 1;
    }

    //后台登录
    @RequestMapping("login")
    public String login(Admin admin,boolean rememberMe, HttpServletRequest request){
        //System.out.println(rememberMe);
        Subject currentUser = SecurityUtils.getSubject();
        if(!currentUser.isAuthenticated()){
            UsernamePasswordToken token = new UsernamePasswordToken(admin.getName(), admin.getPassword());
            token.setRememberMe(rememberMe);
            try {
                currentUser.login(token);
                System.out.println("认证成功！！");
            }catch (AuthenticationException e){
                System.out.println("认证失败！！");
                return "back/login";
            }
        }
        request.getSession().setAttribute("admin", admin.getName());
        return "back/index";
    }
}
