package com.blog.entities;

import java.sql.*;
public class Post {
    private int pId;
    private String title;
    private String content;
    private String image;
    private Timestamp pDate;
    private int cid;
    private int userId;

    public Post() {
    }

    public Post(int pId, String pTitle, String pContent, String pImage, Timestamp pDate, int cId, int userId) {
        this.pId = pId;
        this.title = pTitle;
        this.content = pContent;
        this.image = pImage;
        this.pDate = pDate;
        this.cid = cId;
        this.userId = userId;
    }

    public Post(String pTitle, String pContent, String pImage, Timestamp pDate, int cId, int userId) {
        this.title = pTitle;
        this.content = pContent;
        this.image = pImage;
        this.pDate = pDate;
        this.cid = cId;
        this.userId = userId;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Timestamp getpDate() {
        return pDate;
    }

    public void setpDate(Timestamp pDate) {
        this.pDate = pDate;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    
}
