package org.anik.techblog.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.anik.techblog.dao.UserDao;
import org.anik.techblog.entities.User;
import org.anik.techblog.helper.ConnectionProvider;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.Date;

@MultipartConfig
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        PrintWriter out = resp.getWriter();
        String check = req.getParameter("check");
        if(check == null){
            out.println("Please check 'Terms and condition.'");

        }else{
            String name = req.getParameter("user_name");
            String email = req.getParameter("user_email");
            String password = req.getParameter("user_password");
            String gender = req.getParameter("gender");
            String about = req.getParameter("about");

            Date date = new Date();
            String currentDate = date.toString();

            User user = new User(name, email, password, gender, about, currentDate);

            // Create User Dao object
            UserDao userDao = new UserDao(ConnectionProvider.getConnection());
            if(userDao.saveUser(user)){
                out.println("Save Done!");
            }else{
                out.println("Error!!");
            }
        }

    }
}
