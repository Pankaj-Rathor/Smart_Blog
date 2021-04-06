<!-- Modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header my-background">
                <h5 class="modal-title" id="exampleModalLabel">Profile</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container text-center">
                    <img src="userImg/<%= user.getProfile()%>" class="img-fluid" style="max-width:100px; border-radius:50%"><br>
                    <h5 class="modal-title mt-3" id="exampleModalLabel"><%=user.getName()%></h5>

                    <!-- details -->
                    <div id="profile-details">
                        <table class="table">
                            <tbody>
                                <tr>
                                    <th scope="row">ID</th>
                                    <td><%=user.getId()%></td>
                                </tr>
                                <tr>
                                    <th scope="row">Email</th>
                                    <td><%=user.getEmail()%></td>
                                </tr>
                                <tr>
                                    <th scope="row">Gender</th>
                                    <td><%=user.getGender().toUpperCase()%></td>
                                </tr>
                                <tr>
                                    <th scope="row">Status</th>
                                    <td><%=user.getAbout()%></td>
                                </tr>
                                <tr>
                                    <th scope="row">Register on</th>
                                    <td><%=user.getDateTime().toString()%></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <!-- end of details -->

                    <!-- Edit detail-->

                    <div id="profile-edit" style="display: none;">
                        <form action="EditServlet" method="POST" enctype="multipart/form-data">
                            <table class="table">
                                <tr>
                                    <td>Select Pic</td>
                                    <td><input type="file" name="user_profile" class="fa fa-universal-access btn btn-outline-dark"><%= user.getProfile()%></td>
                                </tr>
                                <tr>
                                    <td>ID</td>
                                    <td><%= user.getId()%></td>
                                </tr>
                                <tr>
                                    <td>Name</td>
                                    <td><input type="text" name="user_name" class="form-control" value="<%= user.getName()%>"></td>
                                </tr>
                                <tr>
                                    <td>Email</td>
                                    <td><input type="email" name="user_email" class="form-control" value="<%= user.getEmail()%>"></td>
                                </tr>
                                <tr>
                                    <td>Gender</td>
                                    <td><%= user.getGender().toUpperCase()%></td>
                                </tr>
                                <tr>
                                    <td>About</td>
                                    <td><textArea row="3" name="user_about" class="form-control"><%= user.getAbout()%></textarea></td>
                                        </tr>
                                    </table>
                                        <div class="container text-center">
                                            <button id="submit-btn" type="submit" class="btn btn-outline-success">Save</button>
                                        </div>
                                </form>
                            </div>                            

                        </div>
                        <!--end edit profile-->                
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="edit-profile-btn" type="button" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- end of Modal -->
        
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
            
