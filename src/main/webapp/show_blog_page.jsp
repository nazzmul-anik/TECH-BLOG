<%@ page import="org.anik.techblog.entities.User" %>
<%@ page import="org.anik.techblog.entities.Post" %>
<%@ page import="org.anik.techblog.dao.PostDao" %>
<%@ page import="org.anik.techblog.helper.ConnectionProvider" %>
<%@ page import="org.anik.techblog.entities.Category" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="org.anik.techblog.dao.UserDao" %><%--
  Created by IntelliJ IDEA.
  User: DCL
  Date: 9/30/2024
  Time: 10:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page errorPage="error_page.jsp" %>

<%
    User user = (User)session.getAttribute("currentUser");
    if(user == null){
        response.sendRedirect("login-page_jsp");
    }
    int postId = Integer.parseInt(request.getParameter("post_id"));
    PostDao postDao = new PostDao(ConnectionProvider.getConnection());
    Post post = postDao.getPostByPostId(postId);
    Date date = new Date();
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title><%=post.getpTitle()%> || TechBlog</title>

    <link href="CSS/myStyle.css" rel="stylesheet" type="text/css" />
    <%--    Bootstrap css--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <%--    JQuery CDN--%>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <%--    Bootstrap javascript--%>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <script src="JavaScript/myJs.js" type="text/javascript"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .post-title{
            font-weight: 100;
            font-size: 30px;
        }
        .post-image{
            width: 100%;
            height: 400px;
        }
        .post-content{
            font-weight: 100;
            font-size: 25px;
        }
        .post-date{
            font-style: italic;
        }
        .post-user-info{
            font-weight: 100;
            font-size: 20px;
        }
        .row-user{
            border: 1px solid #009688;
            padding-top: 15px;
        }
        /*body{*/
        /*    background-image: url("Blog_pic/coding-screen.jpg");*/
        /*    background-size: cover;*/
        /*    background-attachment: fixed;*/
        /*}*/
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark primary-background">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp"><span class="fa fa-laptop"></span> TechBlog</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="profile.jsp"><span class="fa fa-mortar-board"></span> Learn Coding with Us</a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <span class="fa fa-check-square-o"></span> Coding Language
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#">C</a></li>
                        <li><a class="dropdown-item" href="#">C++</a></li>
                        <li><a class="dropdown-item" href="#">C#</a></li>
                        <li><a class="dropdown-item" href="#">Java</a></li>
                        <li><a class="dropdown-item" href="#">JavaScript</a></li>
                        <li><a class="dropdown-item" href="#">Python</a></li>
                        <li><a class="dropdown-item" href="#">Go</a></li>
                        <li><a class="dropdown-item" href="#">Rust</a></li>
                        <li><a class="dropdown-item" href="#">Ruby</a></li>
                        <li><a class="dropdown-item" href="#">Data-Structure</a></li>


                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><span class="fa fa-address-card-o"></span> Contact</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#add-post-modal"><span class="fa fa-paper-plane"></span> Add Post</a>
                </li>


            </ul>

            <ul class="navbar-nav mr-right">
                <li class="nav-item">
                    <a class="nav-link" href="#!" data-bs-toggle="modal" data-bs-target="#profile-modal"><span class="fa fa-user"></span> <%= user.getName()%></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout"><span class="fa fa-user-times"></span> Logout</a>
                </li>
            </ul>

        </div>
    </div>
</nav>

    <div>
        <!-- Button trigger modal -->

        <!-- Modal -->
        <div class="modal fade" id="profile-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white">
                        <h5 class="modal-title" id="exampleModalLabel0">
                            TechBlog
                        </h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="Profiles/<%=user.getProfile()%>" style="min-width: 150px; max-width: 150px;">
                            <h5 class="modal-title" id="exampleModalLabel1">
                                <%= user.getName()%>
                            </h5>
                            <div id="profile-detail">
                                <table class="table">

                                    <tbody>
                                    <tr>
                                        <th scope="row">ID : </th>
                                        <td><%=user.getId()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Email : </th>
                                        <td><%=user.getEmail()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Gender : </th>
                                        <td><%=user.getGender()%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">About : </th>
                                        <td><%=user.getAbout()%></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Registered On: </th>
                                        <td><%=user.getRegistration_date()%></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>

                            <%--                        profile edit--%>
                            <div id="profile-edit" style="display: none">
                                <h2 class="mt-2">Edit your profile</h2>
                                <div>
                                    <form action="edit" method="post" enctype="multipart/form-data">
                                        <table class="table">
                                            <tr>
                                                <td>ID : </td>
                                                <td><%=user.getId()%></td>
                                            </tr>
                                            <tr>
                                                <td>Name : </td>
                                                <td><input class="form-control" type="text" name="user_name" value="<%=user.getName()%>"/></td>
                                            </tr>
                                            <tr>
                                                <td>Email : </td>
                                                <td><input class="form-control" type="email" name="user_email" value="<%=user.getEmail()%>"/></td>
                                            </tr>
                                            <tr>
                                                <td>Password : </td>
                                                <td><input class="form-control" type="password" name="user_password" value="<%=user.getPassword()%>"/></td>
                                            </tr>
                                            <tr>
                                                <td>Gender : </td>
                                                <td><%=user.getGender().toUpperCase()%></td>
                                            </tr>
                                            <tr>
                                                <td>About : </td>
                                                <td>
                                                    <textarea rows="3" class="form-control" name="user_about"><%=user.getAbout()%></textarea>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Change Profile:</td>
                                                <td><input class="form-control" type="file" name="user_profile"/></td>
                                            </tr>
                                        </table>
                                        <div class="container">
                                            <button type="submit" class="btn btn-outline-success">Save</button>
                                        </div>
                                    </form>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--post modal--%>

    <div>


        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">What's on your mind...?</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <form action="postForm" method="post" id="add-post-form">

                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected disabled>---Select Category---</option>
                                    <%
                                        ArrayList<Category> list = postDao.getAllCategories();
                                        for(Category category : list){
                                    %>
                                    <option value="<%=category.getCid()%>"><%=category.getName()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="form-group">
                                <input name="pTitle" class="form-control" type="text" placeholder="Here, your title"/>
                            </div>
                            <div class="form-group">
                                <textarea style="height: 100px" name="pContent" class="form-control" placeholder="Here, your content..."></textarea>
                            </div>
                            <div class="form-group">
                                <textarea style="height: 100px" name="pCode" class="form-control" placeholder="Share your code...(if any)"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Select your photo</label><br>
                                <input type="file" name="pic" />
                            </div>
                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-primary">Post</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

<%--    main content of the body--%>

    <div class="container back-side">
        <div class="row my-4">
            <div class="col-md-8 offset-md-2">
                <div class="card">
                    <div class="card-header">
                        <h4 class="post-title"><%=post.getpTitle()%></h4>
                    </div>
                    <div class="card-body">
                        <img class="card-img-top my-2 post-image" src="Blog_pic/<%=post.getpPic()%>" alt="Card image cap">
                        <div class="row my-3 row-user">
                            <div class="col-md-8">
                                <%UserDao userDao = new UserDao(ConnectionProvider.getConnection());%>
                                <p class="post-user-info"><a href="#"><%=userDao.getUserByPostId(post.getUserId())%></a> has Posted</p>
                            </div>
                            <div class="col-md-4">
                                <p class="post-date"><%=date.toString()%></p>
                            </div>
                        </div>
                        <p class="post-content"><%=post.getpContent()%></p>
                        <br><br>
                        <div class="post-code">
                            <pre><%=post.getpCode()%></pre>
                        </div>
                    </div>
                    <div class="card-footer text-center bg-light">
                        <a href="#!" class="btn btn-outline-success btn-sm"><i class="fa fa-thumbs-o-up"></i><span>1</span></a>
                        <a href="#!" class="btn btn-outline-success btn-sm"><i class="fa fa-commenting-o"></i><span>1</span></a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <script>
        $(document).ready(function (){
            let editStatus = false;

            $('#edit-profile-button').click(function (){
                if(editStatus == false){
                    $('#profile-detail').hide();
                    $('#profile-edit').show();
                    editStatus = true;
                    $(this).text("Back");
                }else{
                    $('#profile-detail').show();
                    $('#profile-edit').hide();
                    editStatus = false;
                    $(this).text("Edit");
                }
            });
        });
    </script>

    <script>
        $(document).ready(function (e){
            $('#add-post-form').on("submit", function (event){
                event.preventDefault();

                console.log("You have form submitted");

                let form  = new FormData(this);
                $.ajax({
                    url: "postForm",
                    type: 'post',
                    data: form,
                    success: function (data, textStatus, jqXHR){
                        console.log(data);
                        if(data.trim()=="done"){
                            swal("Good job!", "Save Post Successfully !!", "success");
                        }else{
                            swal("Error!", "Something went wrong! Try again.", "error");
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown){
                        swal("Error!", "Something went wrong! Try agaain.", "error");
                    },
                    processData: false,
                    contentType: false
                });
            });

        });
    </script>
</body>
</html>
