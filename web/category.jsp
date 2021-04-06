<%@page import="com.blog.entities.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.blog.entities.Category"%>
<%@page import="com.blog.dao.PostDao"%>
<%@page import="com.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page errorPage="error_404.jsp"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>category</title>
        <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;349&family=Roboto:wght@100&display=swap" rel="stylesheet">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css">

    </head>
    <body>
        <!--navbar-->


        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            .instagram {
                display: inline-block;
                width: 26px;
                height: 30px;
                text-align: center;
                border-radius: 70px;
                color: #fff;
                font-size: 18x;
                line-height: 90px;
                vertical-align: middle;
                background: #d6249f;
                background: radial-gradient(circle at 30% 107%, #fdf497 0%, #fdf497 5%, #fd5949 45%,#d6249f 60%,#285AEB 90%);
                box-shadow: 0px 0px 0px rgba(0,0,0,.25);
            }
        </style>


        <nav class="navbar navbar-expand-lg navbar-dark my-background">
            <a class="navbar-brand" href="/MyBlog"><span class="fa fa-industry"></span>MyBlog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="home"> <span class="fa fa-home "></span>Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="post"><span class="fa fa-universal-access mr-md-1"></span>Post</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="contact"><span class="fa fa-address-card mr-md-1"></span>Contact</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="signup"><span class="fa fa-user-plus mr-md-1"></span>Register</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="profile"><span class="fa fa-user mr-md-1"></span>Profile</a>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <a href="https://www.facebook.com" target="_blank" class="mr-md-2"><span class="fa fa-facebook fa-2x mr-md-2" style="color: blue;"></span></a>
                    <a href="https://www.twitter.com" target="_blank" class="mr-md-2" ><span class="fa fa-twitter fa-2x mr-md-2" style="color:skyblue"></span></a>
                    <a href="https://www.instagram.com" target="_blank"><span class="instagram"><span class="fa fa-instagram fa-2x mr-md-2"></span>
                        </span></a>
                </form>
            </div>
        </nav> 

        <!--end of navbar-->


        <!--Main-->
        <main>
            <div class="container-fluid">
                <div class="row mt-3 mr-auto">
                    <div class="col col-md-2">
                        <!--categories-->
                        <div class="list-group">
                            <%
                                String cid = request.getParameter("cid");
                                if (cid != null) {
                            %>
                            <a href="#" id="cid" style="display: none;"><%=cid%></a>
                            <%
                                } else {
                                    response.sendRedirect("category.jsp?cid=1");
                                }
                            %>
                            <a href="#" onclick="getPosts(0, this)" class="c-link list-group-item list-group-item-action active">All Post</a>
                            <%
                                PostDao dao = new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Category> list = dao.getAllCategories();
                                for (Category cc : list) {
                                    int x = cc.getCid();
                                    if (cid != null) {
                                        x = Integer.parseInt(cid);
                                    }
                            %>
                            <a onclick="getPosts(<%= cc.getCid()%>, this)" class="c-link list-group-item list-group-item-action" value="<%= cc.getCid()%>"> <%=cc.getName()%> </a>
                            <%
                                }
                            %>
                        </div>

                    </div>
                    <!-- Post container-->
                    <div class="col col-md-10">
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

        <!--end of Main-->

        <!-- jquery cdn -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <!-- SweetAlert cdn -->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>


        <!-- Ajax for show posts -->
        <script>
                                function getPosts(catId, temp) {
                                    $(".c-link").removeClass('active');
                                    $("#post-container").hide();
                                    $("#loader").show();

                                    $.ajax({
                                        url: "load_post.jsp",
                                        data: {cid: catId},
                                        success: function (data, textStatus, jqXHR) {
                                            $(temp).addClass('active')
                                            $("#loader").hide();
                                            $("#post-container").show();
                                            $("#post-container").html(data);
                                        }
                                    });
                                }

                                $(document).ready(function () {
                                    console.log("ready");
                                    let cid = $("#cid").html();

                                    let allPostRef = $(".c-link")[0];
                                    getPosts(cid, allPostRef);
                                });

        </script>       

        <%@include file="footer_page.jsp" %>

    </body>
</html>
