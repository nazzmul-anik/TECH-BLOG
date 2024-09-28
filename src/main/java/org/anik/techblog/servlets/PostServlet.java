package org.anik.techblog.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.*;
import org.anik.techblog.dao.PostDao;
import org.anik.techblog.entities.Post;
import org.anik.techblog.entities.User;
import org.anik.techblog.helper.ConnectionProvider;
import org.anik.techblog.helper.Helper;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

@MultipartConfig
public class PostServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        PrintWriter out = resp.getWriter();
        int cid = Integer.parseInt(req.getParameter("cid"));
        String pTitle = req.getParameter("pTitle");
        String pContent = req.getParameter("pContent");
        String pCode = req.getParameter("pCode");
        Part part = req.getPart("pic");
//        Getting User Id

        HttpSession session = req.getSession();
        User user = (User)session.getAttribute("currentUser");

        Post post = new Post(pTitle, pContent, pCode, part.getSubmittedFileName(), null, cid, user.getId());
        PostDao dao = new PostDao(ConnectionProvider.getConnection());
        boolean ans = dao.savePost(post);
        if(ans==true){
            String path = req.getRealPath("/")+"Blog_pic" + File.separator+part.getSubmittedFileName();
            Helper.saveFile(part.getInputStream(), path);
            out.println("done");
        }else{
            System.out.println("I am now in error section");
            out.println("error");
        }
    }
}
