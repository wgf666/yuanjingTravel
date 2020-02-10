package com.travel.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class ScenicSpot {
    private Integer id;

    private String scenicIntroduction;

    private String scenicName;

    private Double ticketPrice;

    private String image;

    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date time;

    private String special;

    private String arrange;

    private Double discount;

    private Integer county;

    private Integer publish;

    private Integer searchcount;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getScenicIntroduction() {
        return scenicIntroduction;
    }

    public void setScenicIntroduction(String scenicIntroduction) {
        this.scenicIntroduction = scenicIntroduction == null ? null : scenicIntroduction.trim();
    }

    public String getScenicName() {
        return scenicName;
    }

    public void setScenicName(String scenicName) {
        this.scenicName = scenicName == null ? null : scenicName.trim();
    }

    public Double getTicketPrice() {
        return ticketPrice;
    }

    public void setTicketPrice(Double ticketPrice) {
        this.ticketPrice = ticketPrice;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getSpecial() {
        return special;
    }

    public void setSpecial(String special) {
        this.special = special == null ? null : special.trim();
    }

    public String getArrange() {
        return arrange;
    }

    public void setArrange(String arrange) {
        this.arrange = arrange == null ? null : arrange.trim();
    }

    public Double getDiscount() {
        return discount;
    }

    public void setDiscount(Double discount) {
        this.discount = discount;
    }

    public Integer getCounty() {
        return county;
    }

    public void setCounty(Integer county) {
        this.county = county;
    }

    public Integer getPublish() {
        return publish;
    }

    public void setPublish(Integer publish) {
        this.publish = publish;
    }

    public Integer getSearchcount() {
        return searchcount;
    }

    public void setSearchcount(Integer searchcount) {
        this.searchcount = searchcount;
    }

    @Override
    public String toString() {
        return "ScenicSpot{" +
                "id=" + id +
                ", scenicIntroduction='" + scenicIntroduction + '\'' +
                ", image='" + image + '\'' +

                '}';
    }
}