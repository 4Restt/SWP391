<%-- 
    Document   : newPassword
    Created on : Feb 6, 2024, 9:57:33 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="CSS/newPassword.css" type="text/css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trore - New Password</title>
    </head>
    <body>
        <div style="border: 1px solid black; border-radius: 10px; margin: 0 auto; width: 560px; margin-top: 250px;"> 
            <h5 style="margin-left: 15px;">Nhập email mới của bạn ở dưới.</h5>
            <form class="form-ps" action="newEmail" method="POST">
                <br>
                <div>
                    <h4 style="margin-left: 15px;">
                        Email mới:
                    </h4>
                    <input type="text" name="emails" style="margin-left: 15px; width: 500px;">
                </div>
                <br/>
                <div>
                    <h4 style="margin-left: 15px;">
                        Xác nhận email:
                    </h4>
                    <input type="email" name="newemails" style="margin-left: 15px; width: 500px;">
                </div>
                <br>
                <div>
                    <input class="btn btn-primary" type="submit" value="Change Email" id="submitButton" style="margin-left: 15px; width: 500px;">
                </div>
                <br>
                <div class="notice-message">
                    <h1>${msg}</h1>
                    <h1>${status}</h1>
                    <h1>${errorMessage}</h1>
                </div>
            </form>
        </div>              
    </body>
</html>
