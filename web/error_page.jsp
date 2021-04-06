<%-- 
    Document   : error_page
    Created on : 13-Mar-2021, 9:53:03 pm
    Author     : Pankaj-Rathor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" isErrorPage="true"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry! Something went wrong</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;349&family=Roboto:wght@100&display=swap" rel="stylesheet">
    </head>
    <body>
        <div class="container text-center">
            <img src="img/error.png" class="img-fluid mt-4" style="width: 60%;height: 20%; border: 2px; border-style: solid; border-radius: 50%;">
            <h3 class="display-4 text-white">Sorry Something Went Wrong</h3>
            <p class="text-white"><%= exception%></p>
        </div>
    </body>
</html>
