/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.blog.dao;

import com.blog.entities.User;
import java.sql.*;

public class UserDao {

    private final Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    //method use for insert userdata to database
    public boolean saveUser(User user) {
        boolean f = false;
        try {
            String query = "insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            if(user.getAbout()== null)
            {
                user.setAbout("I'm New User");
            }
            pstmt.setString(5, user.getAbout());
            pstmt.execute();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    //Login Module
    public User getUserByEmailAndPassword(String email, String password) throws SQLException {
        User user = null;

        String query = "select * from user where email = ? and password = ?";

        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, email);
        pstmt.setString(2, password);

        ResultSet set = pstmt.executeQuery();

        if (set.next()) {
            user = new User();

            //data from db
            user.setId(set.getInt("id"));
            user.setName(set.getString("name"));
            user.setEmail(set.getString("email"));
            user.setPassword(set.getString("password"));
            user.setGender(set.getString("gender"));
            user.setDateTime(set.getTimestamp("rdate"));
            user.setProfile(set.getString("profile"));
            user.setAbout(set.getString("about"));
        }
        return user;
    }

    //update user 
    public boolean updateUser(User user) {
        boolean f = false;
        try {
            String query = "UPDATE user SET name=?, email=?, password=?, gender=?, profile=?, about=? WHERE id=?";

            PreparedStatement p = con.prepareStatement(query);
            p.setString(1, user.getName());
            p.setString(2, user.getEmail());
            p.setString(3, user.getPassword());
            p.setString(4, user.getGender());
            p.setString(5, user.getProfile());
            p.setString(6, user.getAbout());
            p.setInt(7, user.getId());

            p.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
     public User getUserById(int userId) {
        User user = null;
        try {
            String query = "select * from user where id=?";
            PreparedStatement p = con.prepareStatement(query);
            p.setInt(1, userId);
            ResultSet set = p.executeQuery();

            while (set.next()) {
                user = new User();

                //data from db
                user.setId(set.getInt("id"));
                user.setName(set.getString("name"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));
                user.setAbout(set.getString("about"));
            }
        }catch(Exception ex){}
            return user;
        }

}
