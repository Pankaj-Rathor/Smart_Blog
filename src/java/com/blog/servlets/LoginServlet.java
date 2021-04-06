package com.blog.servlets;

import com.blog.dao.UserDao;
import com.blog.entities.Message;
import com.blog.entities.User;
import com.blog.helper.ConnectionProvider;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@MultipartConfig
public class LoginServlet extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            String user_email = request.getParameter("user_email");
            String user_password = request.getParameter("user_password");
            //create userdao object and provide connection
            UserDao dao = new UserDao(ConnectionProvider.getConnection());
            //create user Object
            User u = dao.getUserByEmailAndPassword(user_email, user_password);
            HttpSession s = request.getSession();
            Message msg = null;
            //Check user are valid
            if (u != null) {
                //login success
                msg = new Message("Login Success", "success", "alert-success");
                //use Gson Api
                Gson gson = new Gson();
                //Create Cookies Object
                Cookie c = new Cookie("currentUser", URLEncoder.encode(gson.toJson(u),"UTF-8"));
                c.setMaxAge(3600);
                response.addCookie(c);
                out.println("done");
                //response.sendRedirect("profile.jsp");
            } else {
                //error
                // create msg object 
                msg = new Message("Login Failed", "error", "alert-danger");
                out.print("error");
                response.sendRedirect("login_page.jsp");
            }
            s.setAttribute("msg", msg);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }
}
