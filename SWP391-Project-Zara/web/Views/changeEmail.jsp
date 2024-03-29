<%-- 
    Document   : changeEmail
    Created on : Mar 29, 2024, 10:18:28 AM
    Author     : FPT SHOP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title></title>
    </head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <body>
        <form action="forgotPassword" method="post" style="margin: 40px; margin-top: 200px;">
            <div style="border: 1px solid black; border-radius: 10px; width: 800px; margin: 0 auto;">
                <div style="text-align: center;">
                    <h1 style="font-family: sans-serif; color: red">Change your email?</h1>
                </div>
                <p style="margin-left: 30px;">
                    Change your email in three easy steps. This will 
                    help you to secure your password!
                </p>

                <ol style="margin-left: 5px;">
                    <li>
                        Enter your email address below.
                    </li>

                    <li>
                        Our system will send you an OTP to your email.
                    </li>

                    <li>
                        Enter the OTP on the next page.
                    </li>
                </ol>
            </div>
        </form>


        <div  style="border-radius: 10px; border: 1px solid black; width: 800px; margin: 0 auto; height: 250px;">
            <form action="/SWP391-Project-Zara/changeEmail" method="POST">
                <label style="margin: 20px;">Enter your email address:</label> 
                <input type="text" name="email" style="margin: 20px; width: 500px;">
                <small class="form-text text-muted" style="margin: 20px;">
                    Enter the email address you used during the 
                    registration. Then we'll email a OTP to this address.
                </small>
                <br>
                <hr>
                <div style="margin-bottom: -100px; margin-left: 10px;">
                    <button class="btn btn-primary" type="submit">
                        <span>
                            Get New Email
                        </span>
                    </button>
                    <a href="/SWP391-Project-Zara/home" class="btn btn-secondary" type="button">
                        <span>
                            Back to Home
                        </span>
                    </a>
                    <h2 style="color: red">${message}</h2>
                </div>
            </form>
        </div>
    </body>

</html>