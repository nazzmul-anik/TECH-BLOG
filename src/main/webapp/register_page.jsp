<%--
  Created by IntelliJ IDEA.
  User: DCL
  Date: 8/5/2024
  Time: 2:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>TechBlog | Register</title>

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

    <main class="p-5 mt-5">
        <div class="container">
            <div class="col-md-6 offset-md-3">
                <div class="card">

                    <div class="card-header text-center">
                        <span class="fa fa-3x fa-user-circle"></span><br>
                        Register Here
                    </div>
                    <div class="card-body">

                        <form action="register" method="post" id="reg-form">

                            <div class="mb-3">
                                <label for="user_name" class="form-label">User Name</label>
                                <input name="user_name" type="text" class="form-control" id="user_name" placeholder="Enter name">
                            </div>

                            <div class="mb-3">
                                <label for="user_email" class="form-label">Email address</label>
                                <input name="user_email" type="email" class="form-control" id="user_email" placeholder="Enter email">
                                <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                            </div>
                            <div class="mb-3">
                                <label for="user_password" class="form-label">Password</label>
                                <input name="user_password" type="password" class="form-control" id="user_password">
                            </div>

                            <div class="mb-3">
                                <label  class="form-label">Gender</label>
                                <input type="radio"  name="gender" value="male"/> Male
                                <input type="radio"  name="gender" value="female"/> Female
                            </div>

                            <div class="form-group">
                                <textarea name="about" class="form-control"  rows="10" placeholder="About yourself..."></textarea>
                            </div>
                            <br>


                            <div class="mb-3 form-check">
                                <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                <label class="form-check-label" for="exampleCheck1">I agree terms and condition</label>
                            </div>
                            <br>
                            <div class="container text-center" id="loader" style="display: none">
                                <span class="fa fa-refresh fa-spin fa-2x"></span>
                                <h4>Please wait ...</h4>
                            </div>

                            <button id="submit-btn" type="submit" class="btn btn-primary"> Submit</button>
                        </form>

                    </div>

                </div>
            </div>
        </div>
    </main>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <script>
        $(document).ready(function(){
            console.log("Loaded . . .")
            $('#reg-form').on('submit', function (event){

                event.preventDefault();
                let form = new FormData(this);

                $("#submit-btn").hide();
                $("#loader").show();

                $.ajax({
                   url : "register",
                   type:  'POST',
                    data: form,
                    success: function (data, textStatus, jqXHR){
                       console.log(data);

                       $("submit-btn").show();
                       $("#loader").hide();

                       if(data.trim() === 'Save Done!'){
                           swal("Register Successfully!!, We are redirecting to login page.")
                               .then((value) => {
                                   window.location="login_page.jsp";
                               });

                       }else{
                           swal("Something went wrong..Try again.");
                           $("submit-btn").show();
                           $("#loader").hide();


                       }

                    },
                    error: function (jqXHR, textStatus, errorThrown) {

                        $("submit-btn").show();
                        $("#loader").hide();
                        swal("Something went wrong..Try again.");
                    },
                    processData: false,
                    contentType: false
                });
            });
        });
    </script>

</body>
</html>
