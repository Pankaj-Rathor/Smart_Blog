<%-- 
    Document   : index.jsp
    Created on : 09-Mar-2021, 3:06:35 pm
    Author     : Pankaj-Rathor
--%>

<%@page import="com.blog.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@include file="navbar_page.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Myblog</title>
        <!-- CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <!-- mycss -->
        <link href="css/mystyle.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;349&family=Roboto:wght@100&display=swap" rel="stylesheet">    
    
        <style>
            body{
                margin: 0px;
                padding: 0px;
            }
        </style>
    </head>
    <body>
        <!-- Banner -->
        <div class="container-fluid p-0 m-0">
            <div class="jumbotron my-background text-white banner-background">
                <div class="container">
                    <h3 class="display-3">Welcome To MyBlog</h3>
                    <p style="font-size: 20px;">Knowledge is a familiarity, awareness, or understanding of someone or something, such as facts </p>
                    <a href="signup" class="btn btn-outline-light mr-md-2"><span class="fa fa-user-plus"></span>Start! it's free</a> 
                    <a href="login" class="btn btn-outline-light"><span class="fa fa-user-circle fa-spin"></span>Login Now</a> 

                </div>
            </div>
        </div>  
        <!-- end of Banner -->
        <br>
        <!--Main-->
        <main>
            <div class="container">
                <div class="row mt-3 mr-auto">
                    <!-- Post container-->
                    <div class="col col-md-12">
                        <!-- Loader -->
                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-4x fa-spin" style="color:skyblue;"></i>
                            <h4 class="display-5">Posts Loading...</h4>
                        </div>
                        <!--All Post Show -->
                        <div id="post-container">

                        </div>

                    </div>
                </div>
            </div>
        </main>

        <!-- JavaScript -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>     
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>

        <!-- Ajax for show posts -->
        <script>
            $(document).ready(function () {
                $("#post-container").hide();
                $("#loader").show();
                $.ajax({
                    url: "load_category.jsp",
                    success: function (data, textStatus, jqXHR) {
                        $("#loader").hide();
                        $("#post-container").show();
                        $("#post-container").html(data);
                    }
                });
            });
        </script>            
        <!--end post by Ajax-->

        <%@include file="footer_page.jsp" %>
    </body>
</html>
