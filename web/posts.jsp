<%@page import="com.blog.entities.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.blog.entities.Category"%>
<%@page import="com.blog.dao.PostDao"%>
<%@page import="com.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar_page.jsp"%>
<%@page errorPage="error_404.jsp"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Posts</title>
        <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;349&family=Roboto:wght@100&display=swap" rel="stylesheet">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css">

    </head>
    <body>
        <!--Main-->
        <main>
            <div class="container-fluid">
                <div  class="row mt-1 mr-auto">
                    <div id="" class="col-md-2 ">
                        <!--categories-->
                        <div class="list-group">
                            <a href="#" onclick="getPosts(0, this)" class="c-link list-group-item list-group-item-action active">All Post</a>
                            <%
                                PostDao dao = new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Category> list = dao.getAllCategories();
                                for (Category cc : list) {
                            %>
                            <a onclick="getPosts(<%= cc.getCid()%>, this)" class="c-link list-group-item list-group-item-action" value="<%= cc.getCid()%>"> <%=cc.getName()%> </a>
                            <%
                                }
                            %>
                        </div>

                    </div>
                    <!-- Post container-->
                    <div id="" class="col-md-10">
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
                                    let allPostRef = $(".c-link")[0];
                                    getPosts(0, allPostRef);
                                });

        </script>  

    </body>
</html>
