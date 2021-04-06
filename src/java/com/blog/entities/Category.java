package com.blog.entities;

public class Category {
    private int cid;
    private String name;
    private String Discription;
    private String cImg;
    
    public Category() {
    }

    public Category(int cid, String name, String Discription, String cImg) {
        this.cid = cid;
        this.name = name;
        this.Discription = Discription;
        this.cImg = cImg;
    }

    public Category(String name, String Discription, String cImg) {
        this.name = name;
        this.Discription = Discription;
        this.cImg = cImg;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDiscription() {
        return Discription;
    }

    public void setDiscription(String Discription) {
        this.Discription = Discription;
    }

    public String getcImg() {
        return cImg;
    }

    public void setcImg(String cImg) {
        this.cImg = cImg;
    }
    
    
}
