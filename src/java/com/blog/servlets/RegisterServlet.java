/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.blog.servlets;

import com.blog.dao.UserDao;
import com.blog.entities.User;
import com.blog.helper.ConnectionProvider;
import com.blog.helper.SendEmail;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Pankaj-Rathor
 */
@MultipartConfig
public class RegisterServlet extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

            String name = request.getParameter("user_name");
            String email = request.getParameter("user_email");
            String password = request.getParameter("user_password");
            String gender = request.getParameter("gender");

            SendEmail sm = new SendEmail();

            String code = sm.getRandom();

            //Create User Object
            User user = new User(name, email, password, gender, code);

            if (sm.sendEmail(user)) {
                HttpSession s = request.getSession();
                s.setAttribute("auth", user);
                out.println("done");
            //response.sendRedirect("verify.jsp");
            } else {
                out.println("Failed to send verification email");
            }
           
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
