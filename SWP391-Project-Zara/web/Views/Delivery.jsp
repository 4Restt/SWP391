<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Delivery Page</title>
        <style>

            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                color: #333;
                line-height: 1.6;
            }

            h2 {
                color: #444;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }

            table, th, td {
                border: 1px solid #ddd;
            }

            th, td {
                padding: 10px;
                text-align: left;
            }

            th {
                background-color: #f8f8f8;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            form {
                margin-top: 10px;
            }

            input[type=submit] {
                background-color: #4CAF50;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            input[type=submit]:hover {
                background-color: #45a049;
            }
            .order-details {
                display: flex;
                justify-content: space-between;
                align-items: center;
                flex-wrap: wrap;
            }

            .order-details p {
                margin: 5px 10px;
            }
            .container {
                display: flex;
            }

            .sidebar {
                width: 20%;
                padding: 20px;
            }

            .content {
                width: 80%;
                padding: 20px;
            }
            .shipper-line {
                margin-bottom: 10px;
            }
            .shipper-line span {
                margin-right: 15px;
            }
        </style>
    </head>
    <body>

        <div class="container">
            <div class="sidebar">
                <button onclick="loadOrders()">Load Orders</button>
                <button onclick="loadProfile()">Load Profile</button>
                <button onclick="loadAssignedOrders()">Load Assigned Orders</button>

            </div>


            <div class="content">
                <div id="orderContent">
                    <h2>Orders for Delivery ${deliveryName}</h2>
                    <!-- Hiển thị danh sách các orders -->
                    <c:forEach items="${orders}" var="order">                       
                        <h3>Order ID: ${order.id}</h3>
                        <div class="order-details">
                            <p>Customer Address: ${order.customerAddress} </p> 
                            <p>Total Price: ${order.totalprice}</p>
                            <p>Date: ${order.date}</p>
                            <p>Status: ${order.status}</p>
                            <!-- Form để giao order -->
                            <form action="delivery" method="post">
                                <input type="hidden" name="orderId" value="${order.id}" />
                                <input type="hidden" name="customerAddress" value="${order.customerAddress}" />
                                <input type="submit" value="Assign this Order" />
                            </form>
                        </div>
                    </c:forEach>
                    <h2>Available Shippers for Delivery ${deliveryName}</h2>
                    <div>
                        <c:forEach items="${shippers}" var="shipper">
                            <div class="shipper-line">
                                <span>${shipper.name} - ${shipper.location_name}</span>
                                <form action="shipper" method="post" style="shipper-line">
                                    <input type="hidden" name="orderId" value="${order.id}" />
                                    <input type="hidden" name="shipperId" value="${shipper.id}" />
                                    <input type="submit" value="Assign Shipper" />
                                </form>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div id="profileContent" style="display:none;">
                    <h3>Delivery profile</h3>
                </div>
                <div id="assignedOrdersContent" style="display:none;">
                    <h2>Assigned Orders</h2>
                    <c:forEach items="${alShipperOrders}" var="order">                       
                        <h3>Order ID: ${order.id}</h3>
                        <div class="order-details">
                            <p>Customer Address: ${order.customerAddress} </p> 
                            <p>Total Price: ${order.totalprice}</p>
                            <p>Date: ${order.date}</p>
                            <p>Status: ${order.status}</p>                           
                        </div>
                    </c:forEach>
                </div>

                <div id="ajaxResponse" style="margin-top: 20px;"></div>
            </div>
        </div>

        <script>
            function loadOrders() {
                document.getElementById("orderContent").style.display = "block";
                document.getElementById("profileContent").style.display = "none";
                document.getElementById("assignedOrdersContent").style.display = "none";
            }

            function loadProfile() {
                document.getElementById("orderContent").style.display = "none";
                document.getElementById("profileContent").style.display = "block";
                document.getElementById("assignedOrdersContent").style.display = "none";
            }

            function loadAssignedOrders() {
                document.getElementById("orderContent").style.display = "none";
                document.getElementById("profileContent").style.display = "none";
                document.getElementById("assignedOrdersContent").style.display = "block";
                // Tùy thuộc vào logic của bạn, bạn có thể thêm mã AJAX ở đây để lấy nội dung động cho các đơn hàng được giao
            }
        </script>


    </body>
</html>
