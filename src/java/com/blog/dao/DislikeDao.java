package com.blog.dao;
import java.sql.*;

/**
 *
 * @author Pankaj-Rathor
 */
public class DislikeDao {

    private final Connection con;

    public DislikeDao(Connection con) {
        this.con = con;
    }

    public boolean insertDislike(int pid, int uid) {
        boolean f = false;
        try {
            PreparedStatement p = con.prepareStatement("insert into disliked(pid, uid) values(?,?)");
            p.setInt(1, pid);
            p.setInt(2, uid);
            p.executeUpdate();
            f = true;
        } catch (SQLException e) {
        }
        return f;
    }

    public int countDislikeOnPost(int pid) {
        int count = 0;
        try {
            PreparedStatement p = con.prepareStatement("select count(*) from disliked where pid=?");
            p.setInt(1, pid);
            ResultSet rs = p.executeQuery();
            if (rs.next()) {
                count = rs.getInt("count(*)");
            }
        } catch (SQLException e) {
        }

        return count;
    }

    public boolean isDislikedByUser(int pid, int uid) {
        boolean f = false;
        try {
            PreparedStatement p = con.prepareStatement("select * from disliked where pid=? AND uid=?");
            p.setInt(1, pid);
            p.setInt(2, uid);
            ResultSet rs = p.executeQuery();
            if (rs.next()) {
                f = true;
            }
        } catch (SQLException e) {
        }

        return f;
    }

    public boolean deleteDislike(int pid, int uid) {
        boolean f = false;
        try {
            PreparedStatement p = this.con.prepareStatement("delete from disliked where pid=? and uid=?");
            p.setInt(1, pid);
            p.setInt(2, uid);
            p.executeUpdate();
            f = true;
        } catch (SQLException e) {
        }

        return f;
    }

}
