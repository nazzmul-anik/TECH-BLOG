<%@ page import="org.anik.techblog.dao.PostDao" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="org.anik.techblog.helper.ConnectionProvider" %>
<%@ page import="org.anik.techblog.entities.Post" %>
<%@ page import="java.util.List" %>

<div class="row">


<%
    PostDao postDao = new PostDao(ConnectionProvider.getConnection());
    List<Post> postList = postDao.getAllPosts();

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