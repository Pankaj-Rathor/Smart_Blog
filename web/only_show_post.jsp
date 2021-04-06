<%@page import="java.net.URLDecoder"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.blog.dao.DislikeDao"%>
<%@page import="com.blog.entities.User"%>
<%@page import="com.blog.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.blog.dao.UserDao"%>
<%@page import="com.blog.entities.Post"%>
<%@page import="com.blog.dao.PostDao"%>
<%@page import="com.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_404.jsp"%>
<%@include file="pop_up_login.jsp" %>
<%@include file="navbar_page.jsp" %>

<%
    Cookie[] cookies = request.getCookies();
    String cUser = "";
    Gson gson = new Gson();
    for (Cookie cookie : cookies) {
        if (cookie.getName().equalsIgnoreCase("currentUser")) {
            cUser = cookie.getValue();
        }
    }

    String jsonUser = URLDecoder.decode(cUser, "UTF-8");
    User user = gson.fromJson(jsonUser, User.class);

    int postId = Integer.parseInt(request.getParameter("post_id"));

    if (user != null) {
        response.sendRedirect("show_post?post_id=" + postId);
    } else {
        PostDao d = new PostDao(ConnectionProvider.getConnection());
        Post p = d.getPostByPostId(postId);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getTitle()%></title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="js/script.js" type="text/javascript"></script>
        <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;349&family=Roboto:wght@100&display=swap" rel="stylesheet">    </head>
    <link href="css/mystyle.css" rel="stylesheet" type="text/css">
    <style>
        .p-title{
            font-size: 28px;
        }
        .p-content{
            font-weight: 50;
            font-size: 26px;
        }
        .p-user-info{
            font-size: 20px;
        }
        .p-date{
            font-weight: solid;
            font-size: 20px;
        }
        .p-user{
            border: 1px solid #e2e2e2;
            padding-top: 10px;
        }
        .c-like{
            color: blue;
        }
        .c-dislike{
            color : red;
        }
    </style>
    <!--Facebook Comment Plugin-->
    <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v10.0" nonce="QLla78g7"></script>

</head>
<body> 
    <!--main-->
    <main>
        <div class="container">
            <div class="row my-4">
                <div class="col-md-8 offset-md-2">

                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title"><%= p.getTitle()%></h4>
                        </div>

                        <div class="card-body">
                            <img class="card-img-top" src="postImg/<%= p.getImage()%>" alt="<%= p.getImage()%>"/>
                            <div class="row my-2 p-user">
                                <div class="col-md-6">
                                    <%
                                        UserDao ud = new UserDao(ConnectionProvider.getConnection());
                                        int pid = p.getpId();
                                    %>
                                    <p id="pid"><%=pid%></p>
                                    <p class="p-user-info"> Posted By <a href="#!"><%= ud.getUserById(p.getUserId()).getName()%></a></p>
                                </div>
                                <div class="col-md-6 text-right">
                                    <p class="p-date"><%= DateFormat.getDateTimeInstance().format(p.getpDate())%></p>
                                </div>
                            </div>
                            <p class="p-content"><%= p.getContent()%></p><br>
                        </div>


                        <div class="card-footer text-center bg-secondary text-white">
                            <%
                                LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                                DislikeDao dd = new DislikeDao(ConnectionProvider.getConnection());
                            %>

                            <span id="like">
                                <a href="#!" id="li" onclick="tick()" class="btn btn-light"><i class="fa fa-thumbs-up fa-2x ml-md-1 like-btn"></i></a>
                            </span>
                            <span class="like-counter" style="font-size: 22px"><%= ld.countLikeOnPost(p.getpId())%></span>

                            <span id="dislike">
                                <a href="#!" id="di" onclick="tick()" class="btn btn-light"><i class="fa fa-thumbs-down fa-2x ml-md-1 dislike-btn"></i></a>
                            </span>
                            <span class="dislike-counter" style="font-size: 22px"><%= dd.countDislikeOnPost(p.getpId())%></span>
                        </div>

                        <!--Facebook comment plugin--> 
                        <div class="card-footer text-center">
                            <div class="fb-comments" data-href="http://localhost:8080/MyBlog/show_post.jsp?post_id=<%= p.getpId()%>" data-width="" data-numposts="5"></div>
                        </div>

                    </div>

                </div>
            </div>
        </div>
    </main>
    <!--end main-->

    <!-- jquery cdn -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <!-- SweetAlert cdn -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>



    <%@include file="footer_page.jsp"%>

</body>
<%
    }
%>
</html>
