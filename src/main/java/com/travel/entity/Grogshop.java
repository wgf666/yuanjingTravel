package com.travel.entity;

public class Grogshop {
    private Integer id;

    private String city;

    private String grogshopName;

    private String address;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city == null ? null : city.trim();
    }

    public String getGrogshopName() {
        return grogshopName;
    }

    public void setGrogshopName(String grogshopName) {
        this.grogshopName = grogshopName == null ? null : grogshopName.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    @Override
    public String toString() {
        return "Grogshop{" +
                "id=" + id +
                ", city='" + city + '\'' +
                ", grogshopName='" + grogshopName + '\'' +
                ", address='" + address + '\'' +
                '}';
    }
}