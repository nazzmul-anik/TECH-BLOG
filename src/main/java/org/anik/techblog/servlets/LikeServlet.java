package org.anik.techblog.servlets;

import jakarta.servlet.Servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.anik.techblog.dao.LikeDao;
import org.anik.techblog.helper.ConnectionProvider;

import java.io.IOException;
import java.io.PrintWriter;
public class LikeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        PrintWriter out = resp.getWriter();
        String operation = req.getParameter("operation");
        int uid = Integer.parseInt(req.getParameter("userId"));
        int pid = Integer.parseInt(req.getParameter("postId"));

        LikeDao likeDao = new LikeDao(ConnectionProvider.getConnection());
        if(operation.equals("like")){
            boolean isLike = likeDao.insertLike(pid, uid);
            out.println("true");
        }
    }
}
