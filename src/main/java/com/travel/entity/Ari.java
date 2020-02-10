package com.travel.entity;

public class Ari {
    private Integer id;

    private String ariName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAriName() {
        return ariName;
    }

    public void setAriName(String ariName) {
        this.ariName = ariName == null ? null : ariName.trim();
    }

    @Override
    public String toString() {
        return "Ari{" +
                "id=" + id +
                ", ariName='" + ariName + '\'' +
                '}';
    }
}