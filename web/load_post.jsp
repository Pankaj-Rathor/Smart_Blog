<%@page import="com.blog.dao.LikeDao"%>
<%@page import="com.blog.entities.User"%>
<%@page import="java.util.List"%>
<%@page import="com.blog.entities.Post"%>
<%@page import="com.blog.dao.PostDao"%>
<%@page import="com.blog.helper.ConnectionProvider"%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<div class="row">
    <%
        PostDao d = new PostDao(ConnectionProvider.getConnection());
        List<Post> posts = null;
        int cid = Integer.parseInt(request.getParameter("cid"));
        if (cid == 0) {
            posts = d.getAllPost();
        } else {
            posts = d.getPostByCid(cid);
        }

        if (posts.size() == 0) {
            out.println("<h3 class='display-5'> No Post Found This Category </h3>");
            return;
        }
        for (Post p : posts) {
            if (p.getTitle().equals("")) {
                continue;
            }
    %>
    <div class="col-md-6 mt-2">

        <div class="card">
            <img class="card-img-top" src="postImg/<%= p.getImage()%>" border="1" height="250" width="220" object-fit="cover" alt="<%= p.getImage()%>"/>

            <div class="card-body">
                <%
                    String title = p.getTitle();
                %>

                <h4> <%= title%></h4>
                <%
                    if(title!=null)
                    {
                    if (title.length() < 42) {
                %>
                <br>
                <%
                    }
                }
                %>
                <%           
                    String content = p.getContent();
                    if (content.length() >= 102) {
                        content = content.substring(0, 100);
                    }
                %>
                <p> <%= content%> </p>
            </div>

            <div class="card-footer text-center bg-info text-white">
                <a href="show_post?post_id=<%= p.getpId()%>" class="text-white btn btn-outline-dark mr-md-2" >Read More</a>
            </div>

        </div>

    </div>

    <%
        }
    %>

</div>


<!-- jquery cdn -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<!-- SweetAlert cdn -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="js/myjs.js" type="text/javascript"></script>

