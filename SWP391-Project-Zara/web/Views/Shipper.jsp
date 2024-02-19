<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Your Shipper Page</title>
        <style>
            body {
                margin: 0;
                padding: 0;
                font-family: Arial, sans-serif;
            }

            .container {
                display: flex;
                height: 100vh;
            }

            .left-side {
                flex: 2;
                background-color: #f0f0f0;
                padding: 20px;
            }

            .right-side {
                flex: 8;
                padding: 20px;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            th, td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }

            th {
                background-color: #4CAF50;
                color: white;
            }

            .detail-button {
                background-color: #008CBA;
                color: white;
                padding: 6px 10px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            #profileContent {
                display: none;
            }
        </style>
    </head>
    <body>

        <div class="container">
            <div class="left-side">
                <h2>${shipperName}</h2>
                
                <!-- Nút để xem bảng đơn giao hàng -->
                <button onclick="loadOrders()">Xem Đơn Hàng</button>
                <!-- Nút để xem profile của shipper -->
                <button onclick="loadProfile()">Xem Profile</button>
            </div>
            <div class="right-side">
                <!-- Phần bên phải có thể chứa bảng đơn giao hàng hoặc profile của shipper -->
                <div id="orderContent">
                    <table>
                        <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Date</th>
                                <th>Details</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${assignedOrders}" var="order">
                            <tr>
                                <td>${order.id}</td>
                                <td>${order.date}</td>
                                <td><button class="detail-button" onclick="viewDetails('${order.id}')">Detail</button></td>
                            </tr>
                        </c:forEach>
                        </tbody>

                    </table>
                </div>

                <div id="profileContent">
                    <!-- Nội dung profile của shipper sẽ được hiển thị ở đây -->
                    <p>Thông tin Profile của Shipper</p>
                </div>
            </div>
        </div>

        <script>
            function viewDetails(orderId) {
                // Hàm này có thể được sử dụng để chuyển hướng đến một trang chi tiết hoặc hiển thị modal với chi tiết
                alert("Xem chi tiết cho đơn hàng: " + orderId);
                // Ví dụ: window.location.href = '/orderDetail.jsp?orderId=' + orderId;
            }
            function loadOrders() {
                document.getElementById("orderContent").style.display = "block";
                document.getElementById("profileContent").style.display = "none";
                // Nếu bạn muốn thực hiện AJAX call để lấy dữ liệu đơn hàng từ máy chủ, bạn có thể thêm mã ở đây.
            }

            function loadProfile() {
                document.getElementById("orderContent").style.display = "none";
                document.getElementById("profileContent").style.display = "block";
                // Nếu bạn muốn thực hiện AJAX call để lấy dữ liệu profile từ máy chủ, bạn có thể thêm mã ở đây.
            }
        </script>

    </body>
</html>
