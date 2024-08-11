<%@ page import="org.anik.techblog.entities.User" %><%--
  Created by IntelliJ IDEA.
  User: DCL
  Date: 8/6/2024
  Time: 3:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page errorPage="error_page.jsp" %>

<%
    User user = (User) session.getAttribute("currentUser");
    if(user == null){
        response.sendRedirect("login_page.jsp");
    }
%>

<html>
<head>
    <title>Profile Page</title>


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


</head>
<body>

<%--    navbar--%>
<nav class="navbar navbar-expand-lg navbar-dark primary-background">
    <div class="container-fluid">
        <a class="navbar-brand" href="index.jsp"><span class="fa fa-laptop"></span> TechBlog</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#"><span class="fa fa-mortar-board"></span> Learn Coding with Us</a>
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
                    <h5 class="modal-title" id="exampleModalLabel">
                        TechBlog
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="container text-center">
                        <img src="Profiles/<%=user.getProfile()%>" style="min-width: 150px; max-width: 150px;">
                        <h5 class="modal-title" id="exampleModalLabel">
                            <%= user.getName()%>
                        </h5>
                        <div>
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
                                        <th scope="row">Registered On : </th>
                                        <td><%=user.getRegistration_date()%></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Edit</button>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>
