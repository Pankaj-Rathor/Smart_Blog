package com.blog.dao;
import com.blog.entities.Contact;
import java.sql.*;

public class ContactDao {
    private final Connection con;

    public ContactDao(Connection con) {
        this.con = con;
    }

    public boolean contact(Contact user) {
        boolean f = false;
        try {
            String query = "insert into contact(name,email,message) values(?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getMessage());
            pstmt.execute();
            f = true;
        } catch (SQLException e) {
        }
        
        return f;
    }

}
