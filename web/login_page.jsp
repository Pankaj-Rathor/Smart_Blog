<%-- 
    Document   : login_page
    Created on : 10-Mar-2021, 2:51:27 pm
    Author     : Pankaj-Rathor
--%>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.blog.entities.User"%>
<%@page import="com.blog.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="error_page.jsp"%>
<%@include  file="navbar_page.jsp"%>

<%
    Cookie[] cookies = request.getCookies();
    String cUser = "";
    Gson gson = new Gson();
    for(Cookie cookie : cookies){
        if(cookie.getName().equalsIgnoreCase("currentUser")){
            cUser = cookie.getValue();
        }
    }
    
    String jsonUser = URLDecoder.decode(cUser, "UTF-8");
    User user = gson.fromJson(jsonUser, User.class);
   
    if (user != null) {
        response.sendRedirect("profile");
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;349&family=Roboto:wght@100&display=swap" rel="stylesheet">    
    </head>
<body>
    <main class="d-flex align-items-center my-background banner-background mt-0 p-0" style="height:70vh">
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3 mt-0 p-0">
                    <div class="card">
                        <div class="card-header text-center bg-info text-white mt-0 p-0"><span class="fa fa-user-circle fa-2x"></span><br> LOGIN
                        </div>

                        <!-- Show Message -->
                        <%
                            Message msg = (Message) session.getAttribute("msg");
                            if (msg != null) {
                        %>
                        <div class="alert <%=msg.getCssClass()%>" role="alert">
                            <%= msg.getContent()%>
                        </div>
                        <%
                                session.removeAttribute("msg");
                            }
                        %>


                        <div class="card-body p-0">
                            <form id="reg-form" action="LoginServlet" method="POST">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required>
                                </div>
                                <div class="container text-center" id="loader" style="display: none"><span class="fa fa-refresh fa-spin fa-3x" style="color: rgb(91, 192, 222)"></span></div>
                                <div class="text-center">
                                    <button id="submit-btn" type="submit" class="btn btn-info">Login</button>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!-- SweetAlert cdn -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <!-- Ajax -->
    <script>
        $(document).ready(function () {
            console.log("ready");

            $('#reg-form').on('submit', function (event) {
                event.preventDefault();
                let form = new FormData(this);

                $('#submit-btn').hide();
                $('#loader').show();

                //send data to LoginServlet
                $.ajax({
                    url: "LoginServlet",
                    type: 'POST',
                    data: form,

                    success: function (data, textStatus, jqXHR) {
                        $('#loader').hide()
                        $('#submit-btn').show();
                        console.log(data);
                        if (data.trim() === 'done')
                        {
                            swal("Login Successful !!!", "", "success").then((value) => {
                                window.location = ("profile");
                            });
                            window.location = ("profile");
                        } else {
                            swal("Login Failed !!!", "", "error");
                        }
                    },

                    error: function (jqXHR, textStatus, errorThrown)
                    {
                        $('#submit-btn').show();
                        $('#loader').hide();
                    },
                    processData: false,
                    contentType: false
                });

            });

        });

    </script>


    <!-- End Of Ajax -->


</body>
</html>
