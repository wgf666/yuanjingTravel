package com.travel.controller;

import com.travel.entity.Ari;
import com.travel.entity.AriTicketOrder;
import com.travel.entity.User;
import com.travel.service.IAriTicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class PlaneController {
     @Autowired
    private IAriTicketService iAriTicketService;

     /***
      * 机票预订初始化页面
      * **/
    @RequestMapping("plane")
    public String plane(ModelMap map, HttpServletRequest request){
        //User user = (User) request.getSession().getAttribute("user");
        List<Ari> ari= iAriTicketService.getAirInfo();
        map.put("ari",ari);
        //map.put("user",user);
        long l = System.currentTimeMillis();
        Date date=new Date(l);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String format = simpleDateFormat.format(date);
        map.put("time",format);
        return "pre/plane";
    }

    @RequestMapping("plane/order")
    public String order(AriTicketOrder ariTicketOrder){
        System.out.println(ariTicketOrder);

        int i = iAriTicketService.insert(ariTicketOrder);
       if(i>0){
           return "/pre/success";
       }
       return "";
    }

}
