/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.blog.servlets;

import com.blog.dao.UserDao;
import com.blog.entities.Message;
import com.blog.entities.User;
import com.blog.helper.ConnectionProvider;
import com.blog.helper.Helper;
import com.google.gson.Gson;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Pankaj-Rathor
 */
@MultipartConfig
public class EditServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            String userName = request.getParameter("user_name");
            String userEmail = request.getParameter("user_email");
            String userAbout = request.getParameter("user_about");

            Part part = request.getPart("user_profile");
            String imageName = part.getSubmittedFileName();

            //get Old user session
            HttpSession s = request.getSession();
            Cookie[] cookies = request.getCookies();
            String cUser = "";
            Gson gson = new Gson();
            for (Cookie cookie : cookies) {
                if (cookie.getName().equalsIgnoreCase("currentUser")) {
                    cUser = cookie.getValue();
                }
            }
            String jsonUser = URLDecoder.decode(cUser, "UTF-8");
            User user = gson.fromJson(jsonUser, User.class);

            user.setName(userName);
            user.setEmail(userEmail);
            user.setAbout(userAbout);
            String oldImgFile = user.getProfile();
            boolean profileDel;
            if (imageName.trim() == "") {
                user.setProfile(oldImgFile);
                profileDel = false;
            } else {
                user.setProfile(imageName);
                profileDel = true;
            }
            //Update data to DB
            UserDao userdao = new UserDao(ConnectionProvider.getConnection());

            if (userdao.updateUser(user)) {
                out.println("Updated to DB");

                String path = request.getRealPath("/") + "userImg" + File.separator + user.getProfile();
                String oldFilePath = request.getRealPath("/") + "userImg" + File.separator + oldImgFile;

                //old profile delete
                if (profileDel) {
                    if (!oldImgFile.equals("default.png")) {
                        Helper.deleteFile(oldFilePath);
                    }
                }

                //update profile save
                if (imageName.trim() != "") {
                    if (Helper.saveFile(part.getInputStream(), path)) {
                        out.println("Profile pic Updated");
                    } else {
                        out.println("Profile pic Not Updated");
                    }
                }

                Cookie c = new Cookie("currentUser", URLEncoder.encode(gson.toJson(user), "UTF-8"));
                c.setMaxAge(3600);
                response.addCookie(c);
                Message msg = new Message("Profile Updated", "success", "alert-success");
                s.setAttribute("msg", msg);
                response.sendRedirect("profile.jsp");

            } else {
                out.println("Not Updated to DB");

                Message msg = new Message("Profile Updated", "success", "alert-success");
                s.setAttribute("msg", msg);
                response.sendRedirect("profile.jsp");
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(EditServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(EditServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
