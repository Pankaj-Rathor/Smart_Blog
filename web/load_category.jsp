<%@page import="java.util.ArrayList"%>
<%@page import="com.blog.entities.Category"%>
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
        ArrayList<Category> c = d.getAllCategories();

        for (Category p : c) {
    %>
    <div class="col-md-4 mt-2 my-2 align-items-center">
        <div class="card c-border text-center" style="width: 21rem;">
            <img class="card-img-top" src="categoryImg/<%= p.getcImg()%>" width="200" height="200" alt="<%= p.getcImg()%>"/>

            <div class="card-body">
                <a href="category?cid=<%= p.getCid()%>">  <h4> <%= p.getName()%> </h4></a>
                <%
                    String dis = p.getDiscription();

                %>
                <p> <%=dis%> </p>
               <%
                    if(dis!=null)
                    {
                    if (dis.length() < 10) {
                %>
                <br>
                <%
                    }
                }
                %>
            </div>
        </div>
    </div>
    <%
        }
    %>

</div>