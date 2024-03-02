<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <!-- Meta tags Required for Bootstrap -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Delivery Page</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <style>
            /* Đặt lại một số phong cách cơ bản */
            body, h1, h2, h3, h4, h5, h6, p, .navbar, .navbar a, .navbar button {
                margin: 0;
                padding: 0;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }

            /* Phong cách cơ bản cho trang */
            body {
                background-color: #f4f4f4;
                color: #5a5c69;
                font-size: 0.875rem;
            }

            /* Phong cách cho tiêu đề */
            .navbar h1 {
                font-size: 1.75rem;
                margin-right: 2rem;
            }

            /* Thanh điều hướng phía trên cùng */
            .navbar {
                overflow: hidden;
                background-color: #1cc88a; /* Màu xanh lá cây đậm cho navbar */
                padding: 10px 16px;
                display: flex;
                justify-content: start; /* Căn chỉnh các nút ở bên trái */
                align-items: center;
            }

            .navbar button {
                color: white;
                padding: 10px 16px;
                margin-right: 8px; /* Giảm khoảng cách giữa các nút */
                background-color: #1cc88a; /* Đồng bộ màu với navbar */
                border: 1px solid transparent; /* Loại bỏ đường viền */
                border-radius: 4px;
                cursor: pointer;
                transition: background-color 0.3s, box-shadow 0.2s;
            }

            .navbar button:hover, .navbar button.active {
                background-color: #66e6a1; /* Màu nhẹ hơn khi hover */
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            /* Bổ sung phong cách cho tiêu đề h3 để không có margin và phù hợp với nút */
            .navbar h3 {
                margin: 0;
                color: white;
                padding-right: 16px; /* Tạo khoảng cách giữa tiêu đề và nút đầu tiên */
            }


            /* Container cho nội dung chính */
            .container {
                max-width: 1200px;
                margin: 1.5rem auto;
                padding: 1.5rem;
                background: #fff;
                box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.1);
                border-radius: 0.35rem;
            }

            /* Phong cách cho bảng */
            table {
                width: 100%;
                margin-top: 1rem;
                border-collapse: collapse;
            }

            table thead tr {
                background-color: #4e73df;
                color: #ffffff;
            }

            table th, table td {
                padding: 0.75rem;
                border: 1px solid #e3e6f0;
            }

            /* Phong cách cho form */
            form {
                margin-top: 1rem;
            }

            .form-group {
                margin-bottom: 1rem;
            }

            .form-group label {
                display: block;
                margin-bottom: 0.5rem;
            }

            .form-group input[type="text"],
            .form-group input[type="email"],
            .form-group input[type="tel"],
            .form-group input[type="password"],
            .form-group select {
                display: block;
                width: 100%;
                padding: 0.375rem 0.75rem;
                font-size: 0.875rem;
                font-weight: 400;
                line-height: 1.5;
                color: #495057;
                background-color: #fff;
                background-clip: padding-box;
                border: 1px solid #d1d3e2;
                border-radius: 0.35rem;
                transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
            }

            .form-group input[type="text"]:focus,
            .form-group input[type="email"]:focus,
            .form-group input[type="tel"]:focus,
            .form-group input[type="password"]:focus,
            .form-group select:focus {
                color: #495057;
                background-color: #fff;
                border-color: #bac8f3;
                outline: 0;
                box-shadow: 0 0 0 0.2rem rgba(78, 115, 223, 0.25);
            }

            /* Phong cách cho các nút */
            .btn {
                padding: 0.375rem 0.75rem;
                border-radius: 0.35rem;
                font-size: 0.875rem;
                line-height: 1.5;
                transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out;
            }

            .btn-primary {
                color: #fff;
                background-color: #4e73df;
                border-color: #4e73df;
            }

            .btn-primary:hover {
                color: #fff;
                background-color: #2e59d9;
                border-color: #2653d4;
            }

            .btn-danger {
                color: #fff;
                background-color: #e74a3b;
                border-color: #e74a3b;
            }

            .btn-danger:hover {
                color: #fff;
                background-color: #d42a1b;
                border-color: #c21a0b;
            }

            /* Phong cách cho thông báo lỗi */
            .alert {
                padding: 0.75rem 1.25rem;
                margin-bottom: 1rem;
                border: 1px solid transparent;
                border-radius: 0.35rem;
            }

            .alert-danger {
                color: #721c24;
                background-color: #f8d7da;
                border-color: #f5c6cb;
            }

            /* Phong cách cơ bản cho các nút order-type */
            .order-type-button {
                color: #1cc88a;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                transition: background-color 0.3s, box-shadow 0.2s;
                margin-right: 8px; /* Điều chỉnh khoảng cách giữa các nút */
            }

            /* Màu sắc đặc trưng cho từng loại đơn hàng */
            .order-type-button.assigned {
                background-color: #1cc88a;
            }

            .order-type-button.unassigned {
                background-color: #1cc88a;
            }

            .order-type-button.cancelled {
                background-color: #1cc88a;
            }

            .order-type-button:hover {
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
                transform: translateY(-2px);
            }

            .order-type-button:active {
                box-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.2);
                transform: translateY(1px);
            }

            #unassignedOrdersContent .flex-container {
                display: flex;
                justify-content: space-between;
                gap: 20px;
            }

            #unassignedOrdersContent .orders-column,
            #unassignedOrdersContent .shippers-column {
                flex-basis: 48%; /* Cho phép mỗi cột chiếm gần nửa chiều rộng của container */
            }

            #unassignedOrdersContent h4 {
                margin-top: 0;
            }

            #unassignedOrdersContent .order-details {
                background-color: #f8f9fc;
                border-radius: 4px;
                margin-bottom: 10px;
                padding: 10px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            #unassignedOrdersContent .shipper-line {
                background-color: #f8f9fc;
                border-radius: 4px;
                padding: 10px;
                margin-bottom: 10px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }

            #unassignedOrdersContent .shippers-list {
                display: flex;
                flex-direction: column;
            }

            #unassignedOrdersContent .orders-list {
                display: flex;
                flex-direction: column;
            }

            #unassignedOrdersContent input[type="submit"] {
                margin-top: 10px;
                background-color: #4e73df;
                color: white;
                border: none;
                border-radius: 4px;
                padding: 10px 20px;
                cursor: pointer;
            }

            #unassignedOrdersContent input[type="submit"]:hover {
                background-color: #2e59d9;
            }

            .modal-header {
                background-color: #f4f4f4; /* Your desired header background color */
            }

            .modal-title {
                color: #333; /* Your desired title text color */
            }

            /* Add any additional custom styles you want for the modal here */

        </style>

    </head>
    <body>
        <input type="hidden" id="contentValue" value="${content}">

        <div class="navbar">
            <h3>Orders for Delivery ${deliveryName}</h3>
            <button id="loadOrdersButton" onclick="loadOrders()">Load Orders</button>
            <button id="loadProfileButton" onclick="loadProfile()">Load Profile</button>
            <button id="loadShipperListButton" onclick="loadShipperList()">Load Shipper List</button>
        </div>

        <div class="container">
            <div class="content">
                <div id="orderContent" style="display:none;">

                    <!-- Additional buttons for order types within Load Orders view -->
                    <button class="order-type-button" onclick="showOrders('assigned')">Load Assigned Orders</button>
                    <button class="order-type-button" onclick="showOrders('unassigned')">Load Unassigned Orders</button>
                    <button class="order-type-button" onclick="showOrders('cancelled')">Load Cancelled Orders</button>

                    <!-- Order list content goes here -->
                </div>
                <div id="profileContent" style="display:block;"> 
                    <h3>Delivery Profile</h3>
                    <form action="deliveryprofile" method="post"> 
                        <div class="form-group">
                            <label for="name">Name:</label>
                            <input type="text" id="name" name="name" value="${delivery.name}" placeholder="Your name" required>
                        </div>
                        <div class="form-group">
                            <label for="email">Email:</label>
                            <input type="email" id="email" name="email" value="${delivery.email}" placeholder="Your email" required>
                        </div>
                        <div class="form-group">
                            <label for="phone">Phone:</label>
                            <input type="tel" id="phone" name="phone" value="${delivery.phone}" placeholder="Your phone number" required>
                        </div>
                        <div class="form-group">
                            <label for="password">Password:</label>
                            <input type="password" id="password" name="password" value="${delivery.password}" placeholder="Your password" required>
                        </div>
                        <button type="submit">Update Profile</button>
                    </form>
                </div>

                <div id="shipperListContent" style="display:none;">
                    <h3>Available Shippers for Delivery ${deliveryName}</h3>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Location</th>
                                <th>Phone</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listShipper}" var="shipper">
                                <tr>
                                    <td>${shipper.name}</td>
                                    <td>${shipper.location_name}</td>
                                    <td>${shipper.phone}</td>
                                    <td>
                                        <button type="button" class="btn btn-primary btn-edit-shipper" data-toggle="modal" data-target="#editShipperModal" data-id="${shipper.id}" data-name="${shipper.name}" data-location="${shipper.location_name}" data-phone="${shipper.phone}">
                                            Edit
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>                   
                </div>
                <!-- Modal Edit Shipper -->
                <div class="modal fade" id="editShipperModal" tabindex="-1" role="dialog" aria-labelledby="editShipperModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="editShipperModalLabel">Edit Shipper</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <!-- Form fields for editing shipper will go here -->
                                <!-- Example fields -->
                                <div class="form-group">
                                    <label for="shipperNameModal">Name:</label>
                                    <input type="text" class="form-control" id="shipperNameModal" required>
                                </div>
                                <div class="form-group">
                                    <label for="shipperLocationModal">Location:</label>
                                    <input type="text" class="form-control" id="shipperLocationModal" required>
                                </div>
                                <div class="form-group">
                                    <label for="shipperPhoneModal">Phone:</label>
                                    <input type="tel" class="form-control" id="shipperPhoneModal" required>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Save changes</button>
                            </div>
                        </div>
                    </div>
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
                    <form id="assignShipperForm" method="POST" action="assignorder">
                        <div class="flex-container">
                            <!-- Cột cho danh sách đơn hàng -->
                            <div class="orders-column">
                                <h3>Unassigned Orders</h3>
                                <select id="addressSelect" onchange="filterByAddress(this.value)">
                                    <option value="">All</option>
                                    <c:forEach items="${listOfAddresses}" var="address">
                                        <option value="${address}" ${address.equals(sessionScope.filterSearchTerm) ? "selected" : ""}>${address}</option>
                                    </c:forEach>
                                </select>

                                <div class="orders-list">
                                    <c:forEach items="${orders}" var="order">
                                        <div class="order-details" data-order-address="${order.customerAddress}">
                                            <p>Customer Address: ${order.customerAddress}</p>
                                            <p>Total Price: ${order.totalprice}</p>
                                            <p>Date: ${order.date}</p>
                                            <p>Status: ${order.status}</p>
                                            <label>Select
                                                <input type="checkbox" name="selectedOrders" value="${order.id}"/>
                                            </label>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>

                            <!-- Cột cho danh sách shipper -->
                            <div class="shippers-column">
                                <h3>Available Shippers for Delivery ${deliveryName}</h3>
                                <div class="shippers-list">
                                    <c:forEach items="${shippers}" var="shipper">
                                        <label class="shipper-label">
                                            <input type="checkbox" class="shipper-checkbox" name="shipperId" value="${shipper.id}" onclick="onlyOneShipper(this)">
                                            ${shipper.name} - ${shipper.location_name}
                                        </label>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <button type="submit">Assign Shipper</button>
                    </form>                    
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
                // Gọi hàm applyCurrentFilter sau khi tải đơn hàng
                applyCurrentFilter();
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

            // Đoạn mã này giả định rằng bạn đã truyền giá trị bộ lọc từ server qua HTML
            document.addEventListener('DOMContentLoaded', () => {
                let storedSearchTerm = sessionStorage.getItem('filterSearchTerm');
                const serverFilterValue = document.getElementById('serverFilterValue') ? document.getElementById('serverFilterValue').getAttribute('data-filter-value') : null;
                // Lấy giá trị content từ input ẩn
                const contentValue = document.getElementById('contentValue') ? document.getElementById('contentValue').value : null;
                // Nếu có giá trị bộ lọc từ server, ưu tiên sử dụng nó và cập nhật sessionStorage
                if (serverFilterValue) {
                    storedSearchTerm = serverFilterValue;
                    sessionStorage.setItem('filterSearchTerm', storedSearchTerm);
                }

                if (storedSearchTerm) {
                    filterByAddress(storedSearchTerm);
                }

                // Kiểm tra và hiển thị nội dung dựa trên giá trị content
                if (contentValue) {
                    showContentBasedOnParam(contentValue);
                }
            });
            function showContentBasedOnParam(content) {
                // Ẩn tất cả các phần nội dung
                document.getElementById("orderContent").style.display = "none";
                document.getElementById("profileContent").style.display = "none";
                document.getElementById("shipperListContent").style.display = "none";
                document.getElementById("unassignedOrdersContent").style.display = "none";
                // Hiển thị phần nội dung dựa trên tham số
                if (content === 'unassignedOrders') {
                    document.getElementById("unassignedOrdersContent").style.display = "block";
                } else if (content === 'assignedOrders') {
                    document.getElementById("assignedOrdersContent").style.display = "block";
                } else if (content === 'profile') {
                    document.getElementById("profileContent").style.display = "block";
                }

            }



            function filterByAddress(searchTerm) {
                const orderElements = document.querySelectorAll('.order-details');
                const shipperLabels = document.querySelectorAll('.shipper-label');
                const normalizedSearchTerm = searchTerm.trim().toLowerCase();
                orderElements.forEach(function (element) {
                    const address = element.dataset.orderAddress.trim().toLowerCase();
                    element.style.display = address.includes(normalizedSearchTerm) ? '' : 'none';
                });
                shipperLabels.forEach(function (label) {
                    const text = label.textContent.toLowerCase() || label.innerText.toLowerCase();
                    label.style.display = text.includes(normalizedSearchTerm) ? '' : 'none';
                });
                // Lưu searchTerm vào sessionStorage
                sessionStorage.setItem('filterSearchTerm', normalizedSearchTerm);
            }

            // Hàm mới để áp dụng bộ lọc hiện tại
            function applyCurrentFilter() {
                const storedSearchTerm = sessionStorage.getItem('filterSearchTerm');
                if (storedSearchTerm) {
                    filterByAddress(storedSearchTerm);
                }
            }

            function onlyOneShipper(checkbox) {
                // Bỏ chọn tất cả các shipper checkbox khác
                var checkboxes = document.querySelectorAll('.shipper-checkbox');
                checkboxes.forEach((item) => {
                    if (item !== checkbox)
                        item.checked = false;
                });
            }

            $(document).ready(function () {
                $('.btn-edit-shipper').on('click', function () {
                    // Lấy dữ liệu từ data attributes của nút được nhấn
                    var shipperId = $(this).data('id');
                    var shipperName = $(this).data('name');
                    var shipperLocation = $(this).data('location');
                    var shipperPhone = $(this).data('phone');

                    // Đặt dữ liệu vào các trường của form trong modal
                    $('#shipperNameModal').val(shipperName);
                    $('#shipperLocationModal').val(shipperLocation);
                    $('#shipperPhoneModal').val(shipperPhone);

                    // Lưu ID của shipper vào một trường ẩn để sử dụng khi gửi form
                    $('#editShipperModal').find('[name="shipperId"]').val(shipperId);

                    // Hiển thị modal
                    $('#editShipperModal').modal('show');
                });

                // Bắt sự kiện submit của form
                $('#editShipperForm').on('submit', function (event) {
                    event.preventDefault(); // Ngăn không cho form gửi theo cách thông thường

                    // Gửi dữ liệu đến server ở đây...
                });
            });

        </script>
    </body>

</html>
