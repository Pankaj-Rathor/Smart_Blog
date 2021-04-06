<!-- Bootstrap CSS -->
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.2/css/bootstrap.min.css'>
<!-- Font Awesome CSS -->
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.3.1/css/all.css'>
<!-- Style CSS -->
<link rel="stylesheet" href="css/style.css">
<!-- Demo CSS -->

<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header border-bottom-0">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-title text-center">
                    <h4>Login</h4>
                </div>
                <div class="d-flex flex-column text-center">
                    <form id="reg-form" action="LoginServlet" method="post">
                        <div class="form-group">
                            <input type="email" name="user_email" class="form-control" id="email1"placeholder="Your email address...">
                        </div>
                        <div class="form-group">
                            <input type="password" name="user_password" class="form-control" id="password1" placeholder="Your password...">
                        </div>
                        <div class="container text-center" id="loader" style="display: none"><span class="fa fa-refresh fa-spin fa-3x" style="color: rgb(91, 192, 222)"></span></div>
                        <div class="text-center">
                            <button id="submit-btn" type="submit" class="btn btn-info btn-block btn-round">Login</button>
                        </div>
                    </form>

                    <div class="text-center text-muted delimiter">or use a social network</div>
                    <div class="d-flex justify-content-center social-buttons">
                        <button type="button" class="btn btn-secondary btn-round" data-toggle="tooltip" data-placement="top" title="Twitter">
                            <i class="fab fa-twitter"></i>
                        </button>
                        <button type="button" class="btn btn-secondary btn-round" data-toggle="tooltip" data-placement="top" title="Facebook">
                            <i class="fab fa-facebook"></i>
                        </button>
                        <button type="button" class="btn btn-secondary btn-round" data-toggle="tooltip" data-placement="top" title="Linkedin">
                            <i class="fab fa-linkedin"></i>
                        </button>
                        </di>
                    </div>
                </div>
            </div>
            <div class="modal-footer d-flex justify-content-center">
                <div class="signup-section">Not a member yet? <a href="register_page.jsp" class="text-info"> Sign Up</a>.</div>
            </div>
        </div>
    </div>
</div>
<!-- partial -->

<!-- jQuery -->
<script src='https://code.jquery.com/jquery-3.3.1.slim.min.js'></script>
<!-- SweetAlert cdn -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- Popper JS -->
<script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js'></script>
<!-- Bootstrap JS -->
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js'></script>
<!-- Custom Script -->      
<script  src="js/script.js"></script>

<!-- Ajax -->
<script>
    $(document).ready(function () {
        console.log("ready");

        $('#reg-form').on('submit', function (event) {
            event.preventDefault();
            let form = new FormData(this);
            let pid = $("#pid").html();
            $('#submit-btn').hide();
            $('#loader').show();

            //send data to LoginServlet
            $.ajax({
                url: "LoginServlet",
                type: 'POST',
                data: form,

                success: function (data, textStatus, jqXHR) {
                    $('#loader').hide()
                    $('#submit-btn').show();
                    console.log(data);
                    if (data.trim() === 'done')
                    {
                        swal("Login Successful !!!", "", "success").then((value) => {
                            window.location = ("show_post.jsp?post_id="+pid);
                        });
                        window.location = ("show_post.jsp?post_id="+pid);
                    } else {
                        swal("Login Failed !!!", "", "error");
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

</body>
</html>