package com.blog.dao;

import com.blog.entities.Category;
import com.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDao {

    private final Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getAllCategories() {

        ArrayList<Category> list = new ArrayList<>();

        try {
            String q = "select * from categories";
            Statement st = this.con.createStatement();
            ResultSet rs = st.executeQuery(q);

            while (rs.next()) {
                int cid = rs.getInt("cid");
                String name = rs.getString("cName");
                String discription = rs.getString("cDiscription");
                String cImg = rs.getString("cImg");
                Category c = new Category(cid, name, discription, cImg);
                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean savePost(Post p) throws SQLException {
        boolean f = false;
        try {
            String query = "insert into posts(title,content,image,cid,userId) values(?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, p.getTitle());
            pstmt.setString(2, p.getContent());
            pstmt.setString(3, p.getImage());
            pstmt.setInt(4, p.getCid());
            pstmt.setInt(5, p.getUserId());

            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public List<Post> getAllPost() {
        List<Post> list = new ArrayList<>();

        //fetch all posts
        try {
            String query = "select * from posts order by id desc";
            PreparedStatement p = this.con.prepareStatement(query);

            ResultSet rs = p.executeQuery();

            while (rs.next()) {
                int pid = rs.getInt("id");
                String title = rs.getString("title");
                String content = rs.getString("content");
                String image = rs.getString("image");
                int cid = rs.getInt("cid");
                int userId = rs.getInt("userId");
                Timestamp pDate = rs.getTimestamp("pDate");

                Post post = new Post(pid, title, content, image, pDate, cid, userId);
                list.add(post);

            }
        } catch (SQLException e) {
        }

        return list;
    }

    public List<Post> getPostByCid(int cid) {
        List<Post> list = new ArrayList<>();

        try {
            String query = "select * from posts where cid=?";
            PreparedStatement p = con.prepareStatement(query);
            p.setInt(1, cid);
            ResultSet rs = p.executeQuery();

            while (rs.next()) {
                int pid = rs.getInt("id");
                String title = rs.getString("title");
                String content = rs.getString("content");
                String image = rs.getString("image");
                int userId = rs.getInt("userId");
                Timestamp pDate = rs.getTimestamp("pDate");

                Post post = new Post(pid, title, content, image, pDate, cid, userId);
                list.add(post);
            }
        } catch (SQLException e) {
        }

        return list;
    }

    public Post getPostByPostId(int postId) throws SQLException {
        Post post = null;
        String query = "select * from posts where id=?";

        PreparedStatement p = con.prepareStatement(query);
        p.setInt(1, postId);
        ResultSet rs = p.executeQuery();

        while (rs.next()) {
            int pid = rs.getInt("id");
            String title = rs.getString("title");
            String content = rs.getString("content");
            String image = rs.getString("image");
            int userId = rs.getInt("userId");
            int cid = rs.getInt("cid");
            Timestamp pDate = rs.getTimestamp("pDate");

            post = new Post(pid, title, content, image, pDate, cid, userId);
        }
        return post;
    }

   
    }
