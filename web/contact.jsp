<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="navbar_page.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;349&family=Roboto:wght@100&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <main class="d-flex align-items-center my-background banner-background " style="height:90vh">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 offset-md-3">
                        <div class="card m-0 p-0">
                            <div class="card-header text-center bg-info text-white mb-3"><span class="fa fa-address-card fa-2x"></span><br>CONTACT</div>
                            <div class="card-body">
                                <form id="reg-form" action="ContactServlet" method="post">
                                    <div class="form-group">
                                        <label for="user_name">Name</label>
                                        <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="user_name" placeholder="Enter Name" required>
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required>
                                    </div>

                                    <div class="form-group">
                                        <label for="exampleFormControlTextarea1">Message</label>
                                        <textarea name="user_msg" class="form-control" id="exampleFormControlTextarea1" rows="4" required></textarea>
                                    </div>

                                    <div class="container text-center" id="loader" style="display:none"><span class="fa fa-refresh fa-4x fa-spin" style="color: rgb(91, 192, 222)"></span>
                                        <h4>Please Wait...</h4>
                                    </div>
                                    <div class="text-center">
                                        <button id="submit-btn" type="submit" class="btn btn-success ">Submit</button>
                                    </div>
                                </form>

                            </div>
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
                //send data to ContactServlet
                $.ajax({
                    url: "ContactServlet",
                    type: 'POST',
                    data: form,
                    success: function (data, textStatus, jqXHR) {
                        $('#submit-btn').show();
                        $('#loader').hide();
                        if (data.trim() === 'done')
                        {
                            swal("Message Sent", "Thank-You", "success").then((value) => {
                                window.location = "posts.jsp";
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
    </script>
    <!-- End of Ajax Script --> 
    <%@include file="footer_page.jsp" %>

</body>
</html>
