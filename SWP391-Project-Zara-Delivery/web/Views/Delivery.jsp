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
                margin: 0;
                padding: 0;
            }

            .navbar {
                overflow: hidden;
                background-color: #333;
                padding: 14px 16px;
            }

            .navbar button {
                color: white;
                padding: 10px 20px;
                margin: 0 4px;
                background: none;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            .navbar button:hover, .navbar button.active {
                background-color: #555;
            }

            .container {
                display: block;
                padding: 10px 0; /* Chỉ giữ padding ở trên và dưới, loại bỏ padding trái và phải */
                margin: 20px; /* Đảm bảo không có margin không mong muốn */
            }

            .content {
                margin: 0; /* Loại bỏ margin để không tạo ra khoảng trống */
                width: 100%; /* Cho phép nội dung mở rộng ra toàn bộ chiều rộng của trang */
            }

            h2 {
                color: white;
            }
            h3 {
                color: black;
            }

            p {
                margin: 5px 0;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }

            th, td {
                border: 1px solid #ddd;
                padding: 10px;
                text-align: left;
            }

            th {
                background-color: #f8f8f8;
            }

            tr:nth-child(even) {
                background-color: #f2f2f2;
            }

        </style>
    </head>
    <body>
        <div class="navbar">
            <h2>Orders for Delivery ${deliveryName}</h2>
            <button id="loadOrdersButton" onclick="loadOrders()">Load Orders</button>
            <button id="loadProfileButton" onclick="loadProfile()">Load Profile</button>
            <button id="loadShipperListButton" onclick="loadShipperList()">Load Shipper List</button>
        </div>

        <div class="container">
            <div class="content">
                <div id="orderContent" style="display:none;">

                    <!-- Additional buttons for order types within Load Orders view -->
                    <button onclick="showOrders('assigned')">Load Assigned Orders</button>
                    <button onclick="showOrders('unassigned')">Load Unassigned Orders</button>
                    <button onclick="showOrders('cancelled')">Load Cancelled Orders</button>
                    <!-- Order list content goes here -->
                </div>
                <div id="profileContent" style="display:none;">
                    <h3>Delivery Profile</h3>
                    <form action="delivery" method="post"> <!-- Cập nhật action với tên servlet xử lý việc cập nhật hồ sơ -->
                        <div class="form-group">
                            <label for="name">Name:</label>
                            <input type="text" id="name" name="name" placeholder="Your name" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email:</label>
                            <input type="email" id="email" name="email" placeholder="Your email" required>
                        </div>
                        <div class="form-group">
                            <label for="phone">Phone:</label>
                            <input type="tel" id="phone" name="phone" placeholder="Your phone number" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Password:</label>
                            <input type="password" id="password" name="password" placeholder="Your password" required>
                        </div>
                        <button type="submit">Update Profile</button>
                    </form>
                </div>
                <div id="shipperListContent" style="display:none;">
                    <h3>Available Shippers for Delivery ${deliveryName}</h3>
                    <!-- Shipper list content goes here -->
                </div>
                <div id="assignedOrdersContent" style="display:none;">
                    <h3>Assigned Orders</h3>
                    <c:forEach items="${alreadyOrders}" var="order">                                                 
                        <div class="order-details">
                            <h3>Order ID: ${order.id}</h3>
                            <p>Customer Address: ${order.customerAddress} </p> 
                            <p>Total Price: ${order.totalprice}</p>
                            <p>Date: ${order.date}</p>
                            <p>Status: ${order.status}</p>                               
                        </div>
                    </c:forEach>
                </div>
                <!-- Đơn hàng chưa giao -->
                <div id="unassignedOrdersContent" style="display:none;">
                    <h3>Unassigned Orders</h3>
                    <input type="text" id="filterAddress" oninput="filterOrders()" placeholder="Filter by address...">
                    <select id="addressSelect" onchange="filterByAddress(this.value)">
                        <option value="">All</option>
                        <c:forEach items="${listOfAddresses}" var="address">
                            <option value="${address}">${address}</option>
                        </c:forEach>
                    </select>

                    <form id="assignOrdersForm" action="delivery" method="post">
                        <c:forEach items="${orders}" var="order">
                            <div class="order-details" data-order-address="${order.customerAddress}">
                                <h3>Order ID: ${order.id}</h3>
                                <p>Customer Address: ${order.customerAddress} </p>
                                <p>Total Price: ${order.totalprice}</p>
                                <p>Date: ${order.date}</p>
                                <p>Status: ${order.status}</p>
                                <label>Select
                                    <input type="checkbox" name="selectedOrders" value="${order.customerAddress}"/>
                                </label>
                            </div>
                        </c:forEach>                       
                    </form>
                    <h3>Available Shippers for Delivery ${deliveryName}</h3>
                    <div>
                        <c:forEach items="${shippers}" var="shipper">
                            <div class="shipper-line" data-shipper-location="${shipper.location_name}">
                                <span>${shipper.name} - ${shipper.location_name}</span>
                                <form action="delivery" method="post" style="shipper-line">
                                    <input type="hidden" name="orderId" value="${order.id}" />
                                    <input type="hidden" name="shipperId" value="${shipper.id}" />
                                    <input type="submit" value="Assign Shipper" />
                                </form>
                            </div>
                        </c:forEach>
                    </div>
                </div>               
                <!-- Đơn hàng đã hủy -->
                <div id="cancelledOrdersContent" style="display:none;">
                    <!-- Nội dung cho đơn hàng đã hủy -->
                </div>
            </div>
        </div>

        <script>
            function loadOrders() {
                document.getElementById("orderContent").style.display = "block";
                document.getElementById("profileContent").style.display = "none";
                document.getElementById("shipperListContent").style.display = "none";
                document.getElementById("assignedOrdersContent").style.display = "none";
                setActiveButton("loadOrdersButton");
            }

            function loadProfile() {
                document.getElementById("orderContent").style.display = "none";
                document.getElementById("profileContent").style.display = "block";
                document.getElementById("shipperListContent").style.display = "none";
                // Thêm các dòng sau
                document.getElementById("assignedOrdersContent").style.display = "none";
                document.getElementById("unassignedOrdersContent").style.display = "none"; // Ẩn Unassigned Orders khi Load Profile
                document.getElementById("cancelledOrdersContent").style.display = "none";
                setActiveButton("loadProfileButton");
            }

            function loadShipperList() {
                document.getElementById("orderContent").style.display = "none";
                document.getElementById("profileContent").style.display = "none";
                document.getElementById("shipperListContent").style.display = "block";
                // Thêm các dòng sau
                document.getElementById("assignedOrdersContent").style.display = "none";
                document.getElementById("unassignedOrdersContent").style.display = "none"; // Ẩn Unassigned Orders khi Load Shipper List
                document.getElementById("cancelledOrdersContent").style.display = "none";
                setActiveButton("loadShipperListButton");
            }

            function setActiveButton(buttonId) {
                var buttons = document.getElementsByClassName("navbar")[0].getElementsByTagName("button");
                for (var i = 0; i < buttons.length; i++) {
                    buttons[i].classList.remove("active");
                }
                document.getElementById(buttonId).classList.add("active");
            }

            // Functions for loadAssignedOrders, loadUnassignedOrders, and loadCancelledOrders need to be defined
            function showOrders(type) {
                // Ẩn tất cả các div
                document.getElementById('assignedOrdersContent').style.display = 'none';
                document.getElementById('unassignedOrdersContent').style.display = 'none';
                document.getElementById('cancelledOrdersContent').style.display = 'none';

                // Hiển thị div tương ứng với loại đơn hàng được chọn
                if (type === 'assigned') {
                    document.getElementById('assignedOrdersContent').style.display = 'block';
                } else if (type === 'unassigned') {
                    document.getElementById('unassignedOrdersContent').style.display = 'block';
                } else if (type === 'cancelled') {
                    document.getElementById('cancelledOrdersContent').style.display = 'block';
                }
            }

            function filterOrders() {
                var input = document.getElementById('filterAddress');
                var filter = input.value.toUpperCase();
                var select = document.getElementById('addressSelect');
                var selectedValue = select.value.toUpperCase();

                var orders = document.getElementById('unassignedOrdersContent').getElementsByTagName('div');

                for (var i = 0; i < orders.length; i++) {
                    var address = orders[i].getElementsByTagName("p")[0];
                    if (address) {
                        var txtValue = address.textContent || address.innerText;
                        if ((txtValue.toUpperCase().indexOf(filter) > -1 || filter === "") &&
                                (txtValue.toUpperCase().indexOf(selectedValue) > -1 || selectedValue === "")) {
                            orders[i].style.display = "";
                        } else {
                            orders[i].style.display = "none";
                        }
                    }
                }
            }

            function filterByAddress(selectedAddress) {
                // Lọc đơn hàng
                var orders = document.querySelectorAll('.order-details');
                orders.forEach(function (order) {
                    if (order.getAttribute('data-order-address').includes(selectedAddress) || selectedAddress === '') {
                        order.style.display = '';
                    } else {
                        order.style.display = 'none';
                    }
                });

                // Lọc người giao hàng
                var shippers = document.querySelectorAll('.shipper-line');
                shippers.forEach(function (shipper) {
                    var shipperLocation = shipper.getAttribute('data-shipper-location').toLowerCase(); // Chuyển địa điểm shipper về chữ thường
                    var normalizedSelectedAddress = selectedAddress.toLowerCase(); // Chuyển địa chỉ được chọn về chữ thường

                    if (shipperLocation.includes(normalizedSelectedAddress) || selectedAddress === '') {
                        shipper.style.display = ''; // Hiển thị shipper này
                    } else {
                        shipper.style.display = 'none'; // Ẩn shipper này
                    }
                });

            }
        </script>
    </body>
</html>
