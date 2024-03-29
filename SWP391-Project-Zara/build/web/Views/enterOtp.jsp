<%-- 
    Document   : enterOtp
    Created on : Feb 4, 2024, 2:04:32 PM
    Author     : admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trore - Validate OTP</title>
    </head>
    <body>
        <div style="border: 1px solid black; border-radius: 10px; width: 500px; margin: 0 auto; margin-top: 300px; height: 300px;">
            <div>
            <h1 style="font-family: sans-serif; text-align: center; color: red; ">Xác nhận OTP</h1>
        </div>
        <form id="register-form" action="enterOtp" class="form" method="post">
            <label style="margin-left: 210px;">Enter OTP</label>
            <br/>
            <div style="margin-left: 150px;">
                <input id="opt" name="otp" placeholder="Nhập mã OTP" type="text">
            </div>
            <br/>
            <h5 style="text-align: center;">Vui lòng nhập mã xác thực được gửi đến gmail ${sessionScope.user.getEmail()}</h5>
            <br>
            <div>
                <input class="btn btn-primary" name="recover-submit" value="Xác nhận" type="submit" style="margin-left: 200px;">
            </div>
        </form>
        </div>

    </body>
</html>
