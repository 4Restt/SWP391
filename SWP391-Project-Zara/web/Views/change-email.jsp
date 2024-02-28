<%-- 
    Document   : change-email
    Created on : Feb 28, 2024, 3:56:14 PM
    Author     : dev
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="units.OtpGenerator" %>
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
                               href="#account-general">Change Email</a>

                            <c:if test="${sessionScope.account.rollId eq 3}">
                                <a href="/SWP391-Project-Zara/home" class="list-group-item list-group-item-action" >Back to Home</a>
                            </c:if>
                            <c:if test="${sessionScope.account.rollId eq 1}">
                                <a href="dashboard" class="list-group-item list-group-item-action " >Back to Home</a>
                            </c:if>
                        </div>
                    </div>
                    <div class="col-md-9">

                        <div class="tab-content">
                            <div class="tab-pane fade active show" id="account-change-password" style="padding: 30px">
                                <form action="/SWP391-Project-Zara/changemail">
                                    <div class="card-body pb-2">
                                        <div class="form-group">
                                            <label class="form-label">New Email: </label>
                                            <input id="newpass" type="text" name="newemail" class="form-control" required value="${newemail}">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label">Enter OTP: </label>
                                            <input id="OTP" type="text" name="OTP" class="form-control" ${newemail != null ? 'required' : 'readonly'}>
                                            <input id="OTPGenerate" type="hidden" name="OTPGenerate" class="form-control" value="${OTPGenerate}">
                                        </div>
                                    </div>

                                    <div class="text-right mt-3">
                                        <span id="message" style="color: #34ce57; display: none">OTP code is sent</span>
                                        <span id="message" style="color: #34ce57;">${msg}</span>
                                        <span id="message" style="color: red;">${err}</span>
                                        <button id="btnSendOtp" type="button" ${OTPGenerate != null ? 'style="display: none"' : ''} class="btn btn-primary" onclick="sendOTP()">Send OTP</button>&nbsp;

                                        <button id="btnSubmitOtp" type="submit" ${OTPGenerate != null ? '' : 'style="display: none"'}  class="btn btn-primary">Submit OTP</button>&nbsp;


                                        <button type="button" class="btn btn-default" onclick="window.location.href = 'Views/change-email.jsp'">Cancel</button>

                                    </div>
                                </form>

                            </div>

                        </div>

                    </div>
                </div>

            </div>

            <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>

            <script type="text/javascript">

                                            function sendOTP() {
                                                const OTP = <%=OtpGenerator.generateOTP()%>;
                                                document.getElementById('OTPGenerate').value = OTP;
                                                let btnSendOtp = document.getElementById('btnSendOtp');
                                                let btnSubmitOtp = document.getElementById('btnSubmitOtp');
                                                let message = document.getElementById('message');
                                                var inputElement = document.getElementById('OTP');
                                                btnSendOtp.style.display = 'none';
                                                btnSubmitOtp.style.display = 'inline-block';
                                                message.style.display = 'inline';
                                                inputElement.setAttribute('required', 'required');
                                                inputElement.readOnly = !inputElement.readOnly;

                                                const myHeaders = new Headers();
                                                myHeaders.append("Authorization", "App 4a29ef0631ce9044d3da236a9f53cbee-c8023f68-3b99-4289-8a63-c716b7f46bcf");
                                                myHeaders.append("Content-Type", "application/json");
                                                myHeaders.append("Accept", "application/json");

                                                const raw = JSON.stringify({
                                                    "messages": [
                                                        {
                                                            "destinations": [{"to": "84376626402"}],
                                                            "from": "ServiceSMS",
                                                            "text": "Hello,\n\nThis is a test message from ZaraShop. Your OTP code is: " + OTP
                                                        }
                                                    ]
                                                });

                                                const requestOptions = {
                                                    method: "POST",
                                                    headers: myHeaders,
                                                    body: raw,
                                                    redirect: "follow"
                                                };

                                                fetch("https://l3vgd2.api.infobip.com/sms/2/text/advanced", requestOptions)
                                                        .then((response) => response.text())
                                                        .then((result) => console.log(result))
                                                        .catch((error) => console.error(error));
                                            }


            </script>
    </body>

</html>
