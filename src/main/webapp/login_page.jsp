<%@ page import="org.anik.techblog.entities.Message" %><%--
  Created by IntelliJ IDEA.
  User: DCL
  Date: 8/5/2024
  Time: 1:31 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>TechBlog | Login</title>

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
    <%@include file="demoNavbar.jsp"%>

    <div class="container" style="align-content: center">
        <main class="d-flex align-items-center banner-background" style="height: 100vh">

            <div class="container">
                <div class="row">
                    <div class="col-md-4">

                        <div class="card">
                            <div class="card-header text-center">
                                <span class="fa fa-user-plus fa-3x"></span>
                                <p>Login here</p>

                            </div>
                                <br>

                            <%
                                Message message = (Message) session.getAttribute("message");
                                if(message != null){
                            %>

                            <div class="alert alert-danger" role="alert">
                                <%= message.getContent()%>
                            </div>

                            <%
                                session.removeAttribute("message");

                                }
                            %>

                            <div class="card-body">

                                <form action="login" method="post">
                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label">Email address</label>
                                        <input name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                        <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleInputPassword1" class="form-label">Password</label>
                                        <input name="password" required type="password" class="form-control" id="exampleInputPassword1">
                                    </div>

                                    <div class="container text-center">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                </form>

                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </main>
    </div>
</body>
</html>
