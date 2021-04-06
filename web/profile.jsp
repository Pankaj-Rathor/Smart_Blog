<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="com.blog.entities.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.blog.entities.Category"%>
<%@page import="com.blog.dao.PostDao"%>
<%@page import="com.blog.helper.ConnectionProvider"%>
<%@page import="com.blog.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8" errorPage="error_page.jsp"%>
<%@page import="com.blog.entities.User" %>

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
    
    
//    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;349&family=Roboto:wght@100&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>

    <!-- Navbar -->

    <nav class="navbar navbar-expand-lg navbar-dark my-background">
        <a class="navbar-brand" href="index.jsp"><span class="fa fa-industry"></span>Myblog</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="home">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="category"><span class="fa fa-universal-access"></span>Services</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="contact"><span class="fa fa-address-card"></span>Contact</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " href="#" data-toggle="modal" data-target="#do-post-modal"><span class="fa fa fa-edit"></span>Post</a>
                </li>

            </ul>

            <!-- Profile -->
            <div class="form-inline my-2 my-lg-0">
                <img src="userImg/<%= user.getProfile()%>" width="50px" height="45px" class="p-img mr-md-2" data-toggle="modal" data-target="#profile-modal">
                <h4 class="mr-sm-4 text-white" data-toggle="modal" data-target="#profile-modal" ><%= user.getName()%></h4>
                <a href="Logout" class="btn btn-outline-light my-2 my-sm-0">Logout</a>
            </div>
            <!--end of profile-->
        </div>
    </nav> 
    <!-- end of Navbar -->

    <!-- Message -->
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

    <!-- end Message -->

    <!--Main-->
    <main>
        <div class="container-fluid">
            <div class="row mt-3 mr-auto">
                <div class="col col-md-2">
                    <!--categories-->
                    <div class="list-group">
                        <a href="#" onclick="getPosts(0, this)" class="c-link list-group-item list-group-item-action active">All Post</a>
                        <%
                            PostDao dao = new PostDao(ConnectionProvider.getConnection());
                            ArrayList<Category> list = dao.getAllCategories();
                            for (Category cc : list) {
                        %>
                        <a onclick="getPosts(<%= cc.getCid()%>, this)" class="c-link list-group-item list-group-item-action" value="<%= cc.getCid()%>"><%=cc.getName()%></a>
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

    <%@include file="profile_modal.jsp" %>

    <!-- Do Post Modal -->
    <div class="modal fade" id="do-post-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header my-background">
                    <h5 class="modal-title" id="exampleModalLabel">Create Post</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="container text-center">

                        <form id="post-form" action="AddPostServlet" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <h6>Categories
                                    <select class="form-control" name="cid">
                                        <option disabled="" class="form-control">---Select Categories---</option>
                                        <%
                                            ArrayList<Category> list1 = dao.getAllCategories();
                                            for (Category c : list1) {
                                        %>
                                        <option value="<%= c.getCid()%>"><%= c.getName()%></option>
                                        <%
                                            }
                                        %>
                                    </select></h6>
                            </div>
                            <div class="form-group">
                                <input type="text" name="title" placeholder="Enter Post Title" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <textarea rows="8" name="content" placeholder="Enter Post Content" class="form-control" required></textarea>
                            </div>

                            <div class="form-group">
                                <h6 class="form-control">Select Image <input type="file" name="pic"></h6>
                            </div>
                            <div class="form-group">
                                <span id="loader" class="fa fa-refresh fa-4x fa-spin text-center" style="color:skyblue; display: none;"></span>
                            </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button id="submit-btn" type="submit" class="btn btn-primary">Save changes</button>
                </div>
                </form>
            </div>
        </div>
    </div>

    <!-- end of Post Modal-->

    <!-- end of do Post Modal-->

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
                                        $(temp).addClass('active');
                                        $("#loader").hide();
                                        $("#post-container").show();
                                        $("#post-container").html(data);
                                    }
                                });
                            }

                            $(document).ready(function () {
                                let allPostRef = $(".c-link")[0];
                                getPosts(0, allPostRef);
                            });
    </script>           

    <!-- add post with Ajax -->
    <script>
        $(document).ready(function () {

            $('#post-form').on('submit', function (event) {
                event.preventDefault();
                let form = new FormData(this);

                $('#submit-btn').hide();
                $('#loader').show();
                //send data to RegisterServlet
                $.ajax({
                    url: "AddPostServlet",
                    type: 'POST',
                    data: form,
                    success: function (data, textStatus, jqXHR) {
                        $('#submit-btn').show();
                        $('#loader').hide();
                        if (data.trim() === 'done')
                        {
                            swal("Post Done", "", "success").then((value) => {
                                window.location = "profile.jsp";
                            });
                        } else {
                            swal("Something went Wrong", "Try Again", "error");
                        }
                    },

                    error: function (jqXHR, textStatus, errorThrown) {
                        $('#submit-btn').show();
                        $('#loader').hide();
                        swal("Something went Wrong", "try again", "error");
                    },

                    processData: false,
                    contentType: false
                });
            });
        });
    <!-- end of Ajax -->

    </script>

    <!--edit profile button-->
    <script>
        $(document).ready(function () {
            let editStatus = false;
            $('#edit-profile-btn').click(function () {
                if (editStatus == false) {
                    $('#profile-details').hide();
                    $('#profile-edit').show();
                    editStatus = true;
                    $(this).text("Back");
                } else {
                    $('#profile-edit').hide();
                    $('#profile-details').show();
                    editStatus = false;
                    $(this).text("Edit");
                }
            });
        });
        </script>

    </html>
