

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!--Website: wwww.codingdung.com-->
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User Profile</title>

        <!-- Css Styles -->
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="css/flaticon.css" type="text/css">
        <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="css/nice-select.css" type="text/css">
        <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/styleprofile.css">

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css?family=Lora:400,700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&display=swap" rel="stylesheet">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Add Bootstrap CSS link -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    </head>

    <body>

        <div class="container light-style flex-grow-1 container-p-y">
            <h4 class="font-weight-bold py-3 mb-4">
                Account settings
            </h4>
            <div class="card overflow-hidden" style="padding: 50px">
                <div class="row no-gutters row-bordered row-border-light">
                    <div class="col-md-3 pt-0">
                        <div class="list-group list-group-flush account-settings-links">
                            <a class="list-group-item list-group-item-action ${message == null ? 'active' : ''}" data-toggle="list"
                               href="#account-general">General</a>                          
                        </div>
                    </div>
                    <div class="col-md-9">

                        <div class="tab-content">

                            <div class="tab-pane fade ${message == null ? 'active show' : ''}" id="account-general" style="padding: 30px">
                                <form action="viewprofile" method="post" >
                                    <div class="card-body media align-items-center">
                                        <img src="https://cdn-icons-png.flaticon.com/512/1077/1077114.png" alt
                                             class="d-block ui-w-80"  style="width: 80px; height: auto">
                                    </div>
                                    <hr class="border-light m-0">
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label class="form-label">Full Name: </label>
                                            <input type="text" class="form-control mb-1" value="${user.name}" name="name">
                                        </div>
                                       <div class="form-group">
                                            <label class="form-label">Address</label>

                                            <input type="text" class="form-control" value="${user.address}" name="address" >
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">Phone</label>

                                            <input type="text" class="form-control" value="${user.phone}" name="phone" >
                                            <a href="Views/change-phonenumber.jsp">Change phone number</a>
                                        </div>
                                            <div class="form-group">
                                            <label class="form-label">E-mail</label>
                                            <input type="text" class="form-control mb-1"  value="${user.email}" name="email" >
                                            <a href="Views/changeEmail.jsp">Change email </a>
                                        </div>
                                    </div>
                                    <div class="text-right mt-3">
                                        <span id="message" style="color: #34ce57;">${mess}</span>
                                        <button type="submit" class="btn btn-primary">Save changes</button>&nbsp;
                                        <button type="button" class="btn btn-default" onclick="window.location.href = './viewprofile'">Cancel</button>
                                    </div>
                                </form>
                            </div>

                            <div class="tab-pane fade ${message == null ? '' : 'active show'}" id="account-change-password" style="padding: 30px">
                                <form action="changepass">
                                    <div class="card-body pb-2">
                                        <div class="form-group">
                                            <label class="form-label" >Current password</label>
                                            <input type="password" name="oldpass" class="form-control" required>
                                            <span style="color: #dc3545;">${message}</span>
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">New password</label>
                                            <input id="newpass" type="password" name="newpass" class="form-control" required pattern="^\d{6,}$" title="Password must >= 6 characters">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">Repeat new password</label>
                                            <input id="renewpass" type="password" name="renewpass" class="form-control" oninput="check()" required>
                                            <span id="error" style="color: #dc3545; display: none">Confirm-password is not match</span>
                                        </div>
                                    </div>

                                    <div class="text-right mt-3">
                                        <button type="submit" class="btn btn-primary">Save changes</button>&nbsp;
                                        <button type="button" class="btn btn-default" onclick="window.location.href = './profile'">Cancel</button>

                                    </div>
                                </form>

                            </div>

                        </div>

                    </div>
                </div>

            </div>



            <!-- Add User Modal -->
            <div class="modal fade" id="addUserModal" tabindex="-1" role="dialog" aria-labelledby="addUserModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addUserModalLabel">Add Address</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <!-- Add your user creation form fields here -->
                            <!-- For simplicity, assuming similar fields as in user-form.jsp -->
                            <form action="addaddress">
                                <div class="form-group">
                                    <label for="newaddress">New Address: </label>
                                    <input type="text" class="form-control" name="newaddress" required>
                                </div>
                                <button type="submit" class="btn btn-primary">Add</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>                           
            <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
            <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
            <script>
                                            function check() {
                                                var newpass = document.getElementById('newpass');
                                                var renewpass = document.getElementById('renewpass');
                                                var error = document.getElementById('error');

                                                if (renewpass.value !== newpass.value) {
                                                    error.style.display = 'inline';
                                                } else {
                                                    error.style.display = 'none';
                                                }
                                            }
            </script>
    </body>

</html>
