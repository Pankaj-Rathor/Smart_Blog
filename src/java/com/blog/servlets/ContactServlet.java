package com.blog.servlets;

import com.blog.dao.ContactDao;
import com.blog.entities.Contact;
import com.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@MultipartConfig
public class ContactServlet extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

            String name = request.getParameter("user_name");
            String email = request.getParameter("user_email");
            String msg = request.getParameter("user_msg");

            //Create User Object
            Contact c = new Contact(name, email, msg, null);

            //Create Dao Object
            ContactDao dao = new ContactDao(ConnectionProvider.getConnection());

            //submit data on Database
            if (dao.contact(c)) {
                out.println("done");
            } else {
                out.println("error");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
