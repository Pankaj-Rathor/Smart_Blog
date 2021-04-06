package com.blog.dao;
import java.sql.*;

/**
 *
 * @author Pankaj-Rathor
 */
public class LikeDao {

    private final Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }

    public boolean insertLike(int pid, int uid) {
        boolean f = false;
        try {
            PreparedStatement p = con.prepareStatement("insert into liked(pid, uid) values(?,?)");
            p.setInt(1, pid);
            p.setInt(2, uid);
            p.executeUpdate();
            f = true;
        } catch (SQLException e) {
        }
        return f;
    }

    public int countLikeOnPost(int pid) {
        int count = 0;
        try {
            PreparedStatement p = con.prepareStatement("select count(*) from liked where pid=?");
            p.setInt(1, pid);
            ResultSet rs = p.executeQuery();
            if (rs.next()) {
                count = rs.getInt("count(*)");
            }
        } catch (SQLException e) {
        }

        return count;
    }

    public boolean isLikedByUser(int pid, int uid) {
        boolean f = false;
        try {
            PreparedStatement p = con.prepareStatement("select * from liked where pid=? AND uid=?");
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

    public boolean deleteLike(int pid, int uid) {
        boolean f = false;
        try {
            PreparedStatement p = this.con.prepareStatement("delete from liked where pid=? and uid=?");
            p.setInt(1, pid);
            p.setInt(2, uid);
            p.executeUpdate();
            f = true;
        } catch (SQLException e) {
        }

        return f;
    }

}
