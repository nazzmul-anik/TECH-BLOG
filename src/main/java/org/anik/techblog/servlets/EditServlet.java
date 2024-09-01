package org.anik.techblog.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.*;
import org.anik.techblog.dao.UserDao;
import org.anik.techblog.entities.Message;
import org.anik.techblog.entities.User;
import org.anik.techblog.helper.ConnectionProvider;
import org.anik.techblog.helper.Helper;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

@MultipartConfig
public class EditServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        PrintWriter out = resp.getWriter();

        // Fetch data from the Edit form of Login page
        String name = req.getParameter("user_name");
        String email = req.getParameter("user_email");
        String password = req.getParameter("user_password");
        String about = req.getParameter("user_about");
        Part part = req.getPart("user_profile");
        String profile = part.getSubmittedFileName();

        System.out.println(name+" "+email+" "+password+" "+about);

        // Get the user from the Session that already have in database
        HttpSession session = req.getSession();
       User user = (User) session.getAttribute("currentUser");
       user.setName(name);
       user.setEmail(email);
       user.setPassword(password);
       user.setAbout(about);

       String oldFile = user.getProfile();

       user.setProfile(profile);
        System.out.println(user.toString());


        UserDao userDao = new UserDao(ConnectionProvider.getConnection());
        boolean ans = userDao.updateUser(user);
        if(ans){
            out.println("Updated to Database");
            String path = req.getRealPath("/")+"Profiles" + File.separator+user.getProfile();

            String pathOldFile = req.getRealPath("/")+"Profiles" + File.separator+oldFile;

            // delete code

            if(!oldFile.equals("default.png")){
                Helper.deleteFile(pathOldFile);
            }

            if(Helper.saveFile(part.getInputStream(), path)){
                out.println("Profile also updated");

                Message message = new Message("Profile Updated...", "success", "alert-success");

                session.setAttribute("message", message);

            }else{
                    out.println("Profile not updated");
                Message message = new Message("Something went wrong.", "error", "alert-danger");
                session.setAttribute("message", message);
            }

        }else{
            out.println("Profile Not updated.");
            Message message = new Message("Something went wrong.", "error", "alert-danger");
            session.setAttribute("message", message);
        }

        resp.sendRedirect("profile.jsp");
    }
}
