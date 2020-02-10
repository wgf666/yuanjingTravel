package com.travel.entity;

import java.util.Date;

public class Orders {
    private Integer id;
    private Integer bank;

    private Integer scenicId;

    private Integer userId;

    private Date startTime;

    private Integer ticketCount;

    private String explain;

    private Double ticketPrice;

    private Double total;

    private Date createTime;

    private Integer state;

    private String uid;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public ScenicSpot getScenicSpot() {
        return scenicSpot;
    }

    public void setScenicSpot(ScenicSpot scenicSpot) {
        this.scenicSpot = scenicSpot;
    }

    private User user;
    private ScenicSpot scenicSpot;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getScenicId() {
        return scenicId;
    }

    public void setScenicId(Integer scenicId) {
        this.scenicId = scenicId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Integer getTicketCount() {
        return ticketCount;
    }

    public void setTicketCount(Integer ticketCount) {
        this.ticketCount = ticketCount;
    }

    public String getExplain() {
        return explain;
    }

    public void setExplain(String explain) {
        this.explain = explain == null ? null : explain.trim();
    }

    public Double getTicketPrice() {
        return ticketPrice;
    }

    public void setTicketPrice(Double ticketPrice) {
        this.ticketPrice = ticketPrice;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid == null ? null : uid.trim();
    }

    public Integer getBank() {
        return bank;
    }

    public void setBank(Integer bank) {
        this.bank = bank;
    }

    @Override
    public String toString() {
        return "Orders{" +
                "id=" + id +
                ", bank=" + bank +
                ", scenicId=" + scenicId +
                ", userId=" + userId +
                ", startTime=" + startTime +
                ", ticketCount=" + ticketCount +
                ", explain='" + explain + '\'' +
                ", ticketPrice=" + ticketPrice +
                ", total=" + total +
                ", createTime=" + createTime +
                ", state=" + state +
                ", uid='" + uid + '\'' +
                ", user=" + user +
                ", scenicSpot=" + scenicSpot +
                '}';
    }
}