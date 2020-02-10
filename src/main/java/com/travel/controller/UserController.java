package com.travel.controller;

import com.travel.entity.User;
import com.travel.service.IUserService;
import com.travel.utils.mysalt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.naming.Name;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/user")
public class UserController {
 @Autowired
 private IUserService iUserService;

    @RequestMapping("toupdate")
    public String toupdate(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        User user1 = iUserService.login(user.getName());
        request.getSession().setAttribute("user",user1);
     return "/pre/member";
    }
    @RequestMapping("update")
    public String update(User user, ModelMap map){
        int i = iUserService.updateByPrimaryKeySelective(user);
        if(i>0){
            User user1 = iUserService.login(user.getName());
            map.put("user",user1);
            return "/pre/member_index";
        }
        return "/pre/member";
    }

    @RequestMapping("selectPassword")
    @ResponseBody
    public int selectPassword(String password,HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
         int result=0;
                 password=mysalt.encryption(user.getName(),password);

        if(user.getPassword().equals(password)){
            result=1;

            return result;
        }
        return result;
    }
    @RequestMapping("updatePassword")
    public String updatePassword(String newpassword,HttpServletRequest request){
         User user= (User) request.getSession().getAttribute("user");
        String password = mysalt.encryption(user.getName(), newpassword);
         user.setPassword(password);
        int i = iUserService.updateByPrimaryKeySelective(user);
        if(i>0){
            User user1 = iUserService.login(user.getName());
            request.getSession().setAttribute("user",user1);

            return "/pre/member_index";
        }

        return "/pre/password";
    }

      @RequestMapping("register")
    public String register(User user){
          String password = mysalt.encryption(user.getName(),user.getPassword());
          user.setPassword(password);
          int insert = iUserService.insert(user);
          if(insert>0){
              return "pre/login";
          }
          return  "/pre/register";
      }

    @RequestMapping("selectname")
    @ResponseBody
    public int selectname(String name){
        System.out.println(name);
        User user =iUserService.login(name);
       int result=0;
       if(user!=null){
           if(name.equals(user.getName())){
               result=1;
               return result;
           }
       }
      return result;
      }
      @RequestMapping("logout")
    public String logout(HttpServletRequest request){
       request.getSession().removeAttribute("user");

      return "/pre/login";
      }


 }
