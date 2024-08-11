package org.anik.techblog.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.anik.techblog.entities.Message;

import java.io.IOException;

public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        session.removeAttribute("currentUser");
        Message message = new Message("Logout Successfully!!", "success", "alert-success");
        session.setAttribute("message", message);

        resp.sendRedirect("login_page.jsp");
    }
}
