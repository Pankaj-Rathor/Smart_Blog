<%-- 
    Document   : register_page
    Created on : 10-Mar-2021, 2:51:27 pm
    Author     : Pankaj-Rathor
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="navbar_page.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="js/myjs.js" type="text/javascript"></script>
        <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;349&family=Roboto:wght@100&display=swap" rel="stylesheet">
    </head>
    <body>
        <main class="d-flex align-items-center my-background banner-background mt-0 p-0 m-0" style="height:90vh">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 offset-sm-3 mt-0 p-0">
                        <div class="card">
                            <div class="card-header text-center bg-info text-white mt-0 p-0"><span class="fa fa-user-plus fa-2x"></span><br>Create Account</div>
                            <div class="card-body mx-4 mt-0 p-0" style="font-size: 15px">
                                <form id="reg-form" action="Register" method="POST">
                                    <div class="form-group">
                                        <label for="user_name">Name</label>
                                        <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="user_name" placeholder="Enter Name" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input name="user_password"type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="gender mr-md-2">Gender</label>
                                        <input type="radio" value="Male" name="gender">Male
                                        <input type="radio" value="Female" name="gender">Female
                                    </div>

                                    <div class="container text-center" id="loader" style="display:none"><span class="fa fa-refresh fa-4x fa-spin" style="color: rgb(91, 192, 222)"></span>
                                        <h4>Please Wait...</h4>
                                    </div>
                                    <div class="text-center">
                                        <button id="submit-btn" type="submit" class="btn btn-info ">SIGN UP</button>
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

        <!-- Ajax Script -->
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
                        url: "Register",
                        type: 'POST',
                        data: form,

                        success: function (data, textStatus, jqXHR) {
                            $('#loader').hide()
                            $('#submit-btn').show();
                            console.log(data);
                            if (data.trim() === 'done')
                            {
                                swal("We Sent OTP In your Email.", "Please verify", "success").then((value) => {
                                    window.location = ("verify");
                                });
                            } else {
                                swal("Failed Ragisteration !!!", "", "error");
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
        <!-- End of Ajax Script --> 
    </body>
</html>
