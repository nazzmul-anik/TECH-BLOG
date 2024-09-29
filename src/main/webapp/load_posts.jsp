<%@ page import="org.anik.techblog.dao.PostDao" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="org.anik.techblog.helper.ConnectionProvider" %>
<%@ page import="org.anik.techblog.entities.Post" %>
<%@ page import="java.util.List" %>
<%@ page import="java.io.PrintWriter" %>

<div class="row">


<%
    Thread.sleep(1000);
    PostDao postDao = new PostDao(ConnectionProvider.getConnection());
    int cid = Integer.parseInt(request.getParameter("cid"));
    List<Post> postList = null;
    if(cid == 0){
        postList = postDao.getAllPosts();
    }else{
        postList = postDao.getPostByCatId(cid);
    }
    
    if(postList.size()==0){
        out.println("<h3 class='display-3 text-center'>No posts in this category...</h3>");
        return;
    }

    for(Post post : postList){

        %>
    <div class="col-md-6 mt-2">
        <div class="card">
            <img src="Blog_pic/<%=post.getpPic()%>" class="card-img-top" alt="...">
            <div class="card-body">
                <b><%= post.getpTitle()%></b>
                <p><%= post.getpContent()%></p>
                <pre><%= post.getpCode()%></pre>
            </div>
        </div>
    </div>
        <%
    }
%>
</div>