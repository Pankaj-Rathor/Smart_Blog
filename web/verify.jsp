<%-- 
    Document   : verify
    Created on : 23-Mar-2021, 8:01:28 pm
    Author     : Pankaj-Rathor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="navbar_page.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>verify</title>
        <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;349&family=Roboto:wght@100&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="card my-2">
                    <div class="card-header bg-info text-center text-white">
                        <span class="fa fa-user-secret fa-3x mr-md-2" style="color: brown;"></span><br>
                        <h4>Email Verification</h4>
                    </div>
                    <div class="card-body">
                        <form id="reg-form" action="VerifyCode" method="post">
                            <h4 style="font-size: 20px">We already send a verification  code to your email.</h4>
                            <div class="form-group">
                                <input type="text" name="authcode" class="form-control" placeholder="Enter Verification Code">
                            </div>
                            <div class="container text-center my-2" id="loader" style="display:none"><span class="fa fa-refresh fa-4x fa-spin" style="color: rgb(91, 192, 222)"></span>
                                <h4>Checking...</h4>
                            </div>
                            <div class="text-center">
                                <button id="submit-btn" type="submit" class="btn btn-info ">VERIFY</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <%@include file="footer_page.jsp"%>
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
                    url: "VerifyCode",
                    type: 'POST',
                    data: form,

                    success: function (data, textStatus, jqXHR) {
                        $('#loader').hide()
                        $('#submit-btn').show();
                        console.log(data);
                        if (data.trim() === 'done')
                        {
                            swal("Register Successful !!!", "", "success").then((value) => {
                                window.location = ("login");
                            });
                        } else {
                            swal("Registeration Failed !!!", "", "error");
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
