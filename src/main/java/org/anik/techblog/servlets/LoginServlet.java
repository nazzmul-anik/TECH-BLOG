package org.anik.techblog.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.anik.techblog.dao.UserDao;
import org.anik.techblog.entities.Message;
import org.anik.techblog.entities.User;
import org.anik.techblog.helper.ConnectionProvider;

import java.io.IOException;
import java.io.PrintWriter;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        UserDao userDao = new UserDao(ConnectionProvider.getConnection());
        User user = userDao.getUserByEmailAndPassword(email, password);

        if(user == null){
            Message message = new Message("Invalid Details! Try with another.", "error", "alert-danger");

            HttpSession session = req.getSession();
            session.setAttribute("message", message);
            resp.sendRedirect("login_page.jsp");

        }else{
            HttpSession session = req.getSession();
            session.setAttribute("currentUser", user);
            resp.sendRedirect("profile.jsp");
        }
    }
}
