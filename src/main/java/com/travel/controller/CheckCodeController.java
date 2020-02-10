package com.travel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

/**
 * @author:吴小富
 * @Date: 2019/12/20
 */
@Controller
public class CheckCodeController {

    //后台验证码
    @RequestMapping("checkCode/back")
    public void BackCheckCode(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int width = 110;
        int height = 56;
        Random random = new Random();
        int ra = random.nextInt(4);
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

        Graphics graphics = image.getGraphics();
        if(ra==0){
            graphics.setColor(Color.BLACK);
            graphics.fillRect(0, 0, width, height);
            graphics.setColor(Color.WHITE);
            graphics.setFont(new Font("宋体", Font.BOLD, 25));
        }else if(ra==1){
            graphics.setColor(Color.WHITE);
            graphics.fillRect(0, 0, width, height);
            graphics.setColor(Color.RED);
            graphics.setFont(new Font("宋体", Font.BOLD, 25));
        }else if(ra==2){
            graphics.setColor(Color.WHITE);
            graphics.fillRect(0, 0, width, height);
            graphics.setColor(Color.BLACK);
            graphics.setFont(new Font("宋体", Font.BOLD, 25));
        }else {
            graphics.setColor(Color.BLUE);
            graphics.fillRect(0, 0, width, height);
            graphics.setColor(Color.YELLOW);
            graphics.setFont(new Font("宋体", Font.BOLD, 25));
        }

        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < 4; i++) {
            int num = random.nextInt(10);
            graphics.drawString(num + "", 20 + i * 20, 35);
            sb.append(num);
        }

        request.getSession().setAttribute("imgCodeBack", sb.toString());

        for (int i = 0; i < 10; i++) {
            graphics.drawLine(random.nextInt(width), random.nextInt(height), random.nextInt(width), random.nextInt(height));

        }
        ImageIO.write(image, "jpg", response.getOutputStream());
    }

    //前台验证码
    @RequestMapping("checkCode/pre")
    public void PreheckCode(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int width = 80;
        int height = 36;
        Random random = new Random();
        int ra = random.nextInt(4);
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

        Graphics graphics = image.getGraphics();
        if(ra==0){
            graphics.setColor(Color.BLACK);
            graphics.fillRect(0, 0, width, height);
            graphics.setColor(Color.WHITE);
            graphics.setFont(new Font("宋体", Font.BOLD, 25));
        }else if(ra==1){
            graphics.setColor(Color.WHITE);
            graphics.fillRect(0, 0, width, height);
            graphics.setColor(Color.RED);
            graphics.setFont(new Font("宋体", Font.BOLD, 25));
        }else if(ra==2){
            graphics.setColor(Color.WHITE);
            graphics.fillRect(0, 0, width, height);
            graphics.setColor(Color.BLACK);
            graphics.setFont(new Font("宋体", Font.BOLD, 25));
        }else {
            graphics.setColor(Color.ORANGE);
            graphics.fillRect(0, 0, width, height);
            graphics.setColor(Color.RED);
            graphics.setFont(new Font("宋体", Font.BOLD, 25));
        }

        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < 4; i++) {
            int num = random.nextInt(10);
            graphics.drawString(num + "", 15 + i * 15, 25);
            sb.append(num);
        }

        request.getSession().setAttribute("imgCodePre", sb.toString());

        for (int i = 0; i < 10; i++) {
            graphics.drawLine(random.nextInt(width), random.nextInt(height), random.nextInt(width), random.nextInt(height));

        }
        ImageIO.write(image, "jpg", response.getOutputStream());
    }
}
