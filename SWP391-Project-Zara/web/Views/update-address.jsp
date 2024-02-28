<%-- 
    Document   : update-address
    Created on : Feb 28, 2024, 3:57:07 PM
    Author     : dev
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                            <a class="list-group-item list-group-item-action" style="font-weight: bold" data-toggle="list"
                               href="#account-general">Update address</a>

                            <c:if test="${sessionScope.account.rollId eq 3}">
                                <a href="home" class="list-group-item list-group-item-action" >Back to Home</a>
                            </c:if>
                            <c:if test="${sessionScope.account.rollId eq 1}">
                                <a href="dashboard" class="list-group-item list-group-item-action " >Back to Home</a>
                            </c:if>
                        </div>
                    </div>
                    <div class="col-md-9">

                        <div class="tab-content">

                            <div class="tab-pane fade ${message == null ? 'active show' : ''}" id="account-general" style="padding: 30px">
                                <form action="updateAddress">

                                    <hr class="border-light m-0">
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label class="form-label">Address: </label>
                                            <c:forEach items="${listAddress}" var="a">
                                                <input type="text" class="form-control mb-3" name="address" value="${a}" required>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <div class="text-right mt-3">
                                        <span id="message" style="color: #34ce57;">${msg}</span>
                                        <button type="submit" class="btn btn-primary">Save changes</button>&nbsp;
                                        <button type="reset" class="btn btn-default" onclick="window.location.href = './viewprofile'">Cancel</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>

    </body>

</html>
