/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.blog.helper;

import java.sql.*;

/**
 *
 * @author Pankaj-Rathor
 */
public class ConnectionProvider {

    private static Connection con;

    //Build Connection with Driver
    public static Connection getConnection() throws SQLException {
        try {
            if (con == null) {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog", "root", "");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return con;
    }
    
}
