package com.travel.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class AriTicketOrder {
    private Integer id;

    private Integer userId;

    private String startCity;

    private String endCity;


    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date start_time;

    private String ariline;

    private String shippingSpace;

    private String remark;



    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getStartCity() {
        return startCity;
    }

    public void setStartCity(String startCity) {
        this.startCity = startCity == null ? null : startCity.trim();
    }

    public String getEndCity() {
        return endCity;
    }

    public void setEndCity(String endCity) {
        this.endCity = endCity == null ? null : endCity.trim();
    }



    public String getAriline() {
        return ariline;
    }

    public void setAriline(String ariline) {
        this.ariline = ariline == null ? null : ariline.trim();
    }

    public String getShippingSpace() {
        return shippingSpace;
    }

    public void setShippingSpace(String shippingSpace) {
        this.shippingSpace = shippingSpace == null ? null : shippingSpace.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Date getStart_time() {
        return start_time;
    }

    public void setStart_time(Date start_time) {
        this.start_time = start_time;
    }

    @Override
    public String toString() {
        return "AriTicketOrder{" +
                "id=" + id +
                ", userId=" + userId +
                ", startCity='" + startCity + '\'' +
                ", endCity='" + endCity + '\'' +
                ", start_time=" + start_time +
                ", ariline='" + ariline + '\'' +
                ", shippingSpace='" + shippingSpace + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }
}