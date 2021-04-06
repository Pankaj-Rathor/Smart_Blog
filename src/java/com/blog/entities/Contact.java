package com.blog.entities;
import java.sql.*;
public class Contact {
    private int id;
    private String name;
    private String email;
    private String message;
    private Timestamp cdate;

    public Contact() {
    }

    public Contact(int id, String name, String email, String message, Timestamp cdate) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.message = message;
        this.cdate = cdate;
    }

    public Contact(String name, String email, String message, Timestamp cdate) {
        this.name = name;
        this.email = email;
        this.message = message;
        this.cdate = cdate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Timestamp getCdate() {
        return cdate;
    }

    public void setCdate(Timestamp cdate) {
        this.cdate = cdate;
    }
    
    
}
