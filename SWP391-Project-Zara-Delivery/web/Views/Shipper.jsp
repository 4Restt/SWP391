<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Shipper Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/shipper.css">
        <style>
            /* Đã có CSS */
            .sidebar {
                height: 100%;
                width: 250px;
                position: fixed;
                z-index: 1;
                top: 0;
                left: 0;
                background-color: #111;
                overflow-x: hidden;
                padding-top: 20px;
                transition: 0.5s;
            }

            .sidebar a {
                padding: 10px 15px;
                text-decoration: none;
                font-size: 18px;
                color: #818181;
                display: block;
            }

            .sidebar a:hover {
                color: #f1f1f1;
            }
            .sidebar h3 {
                color: #818181;
                padding-left: 20px;
            }

            .main-content {
                margin-left: 250px;
                padding: 20px;
            }

        </style>
    </head>
    <body>
        <div class="sidebar">
            <h3>WelCome</h3>
            <h3>${shipperName}</h3>
            <a href="javascript:void(0)" onclick="toggleSection('newOrdersContent')">New Orders</a>
            <a href="javascript:void(0)" onclick="toggleSection('completedOrdersContent')">Completed Orders</a>
            <a href="javascript:void(0)" onclick="toggleSection('cancelledOrdersContent')">Cancelled Orders</a>
            <a href="javascript:void(0)" onclick="toggleSection('profileContent')">Profile</a>
        </div>

        <div class="main-content">
            <h3>WorkHarder</h3>

            <div style="text-align: right; padding: 10px;">
                <button class="btn logout-btn" onclick="confirmLogout()">Logout</button>
            </div>

            <div id="newOrdersContent" class="content-section">
                <h4>New Orders</h4>
                <table class="table">
                    <thead>
                        <tr>
                            <th>STT</th>
                            <th>Address</th>
                            <th>Status</th>
                            <th>Select</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="order" items="${assignedOrders}" varStatus="status">
                            <tr>
                                <td>${status.index + 1}</td>
                                <td><c:out value="${order.getCustomerAddress()}"/></td>
                                <td>
                                    <c:choose>
                                        <c:when test="${order.getStatus() == 4}">
                                            Shipping
                                        </c:when>
                                        <c:when test="${order.getStatus() == 5}">
                                            Completed
                                        </c:when>
                                        <c:when test="${order.getStatus() == 6}">
                                            Cancelled
                                        </c:when>
                                        <c:otherwise>
                                            Unknown
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td><input type="checkbox" name="selectedOrders" value="${order.getId()}"></td>
                                <td>
                                    <button type="button" class="btn btn-info btn-sm" data-bs-toggle="modal" data-bs-target="#orderDetailsModal${order.getId()}">
                                        Detail
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <c:forEach items="${assignedOrders}" var="order" varStatus="status">
                    <div class="modal fade" id="orderDetailsModal${order.getId()}" tabindex="-1" aria-labelledby="orderDetailsModalLabel${order.getId()}" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="orderDetailsModalLabel${order.getId()}">Order Details</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <p><strong>Customer Name:</strong> <span>${order.getCustomerName()}</span></p>
                                    <p><strong>Phone Number:</strong> <span>${order.getPhoneNumber()}</span></p>
                                    <p><strong>Customer Address:</strong> <span>${order.getCustomerAddress()}</span></p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                    <button onclick="handleReportClick('${order.getId()}')" class="btn btn-warning">Report</button>
                                    <button type="button" class="btn btn-success" onclick="completeOrder('${order.getId()}')">Completed</button>

                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>


            </div>


            <div id="completedOrdersContent" class="content-section" style="display:none;">
                <h4>Completed Orders</h4>
                <table class="table">
                    <thead>
                        <tr>
                            <th>STT</th>
                            <th>Address</th>
                            <th>Date</th>
                            <th>Status</th>


                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="order" items="${completedOrders}" varStatus="status">
                            <tr>
                                <td>${status.index + 1}</td>
                                <td><c:out value="${order.getCustomerAddress()}"/></td>
                                <td><c:out value="${order.getDate()}"/></td>
                                <td>
                                    <c:choose>
                                        <c:when test="${order.getStatus() == 4}">
                                            Shipping
                                        </c:when>
                                        <c:when test="${order.getStatus() == 5}">
                                            Completed
                                        </c:when>
                                        <c:when test="${order.getStatus() == 6}">
                                            Cancelled
                                        </c:when>
                                        <c:otherwise>
                                            Unknown
                                        </c:otherwise>
                                    </c:choose>
                                </td>                              
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <div id="cancelledOrdersContent" class="content-section" style="display:none;">
                <h4>Cancelled Orders</h4>
                <table class="table">
                    <thead>
                        <tr>
                            <th>STT</th>
                            <th>Address</th>
                            <th>Date</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="order" items="${canceledOrders}" varStatus="status">
                            <tr>
                                <td>${status.index + 1}</td>
                                <td><c:out value="${order.getCustomerAddress()}"/></td>
                                <td><c:out value="${order.getDate()}"/></td>
                                <td>
                                    <c:choose>
                                        <c:when test="${order.getStatus() == 4}">
                                            Shipping
                                        </c:when>
                                        <c:when test="${order.getStatus() == 5}">
                                            Completed
                                        </c:when>
                                        <c:when test="${order.getStatus() == 6}">
                                            Cancelled
                                        </c:when>
                                        <c:otherwise>
                                            Unknown
                                        </c:otherwise>
                                    </c:choose>
                                </td>                              
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <div id="profileContent" class="content-section" style="display:none;">
                <h3>Your Profile</h3>
                <!-- Nội dung cho Profile -->
            </div>
        </div>

        <script>
            function toggleSection(sectionId) {
                // Ẩn tất cả các sections
                var sections = document.getElementsByClassName('content-section');
                for (var i = 0; i < sections.length; i++) {
                    sections[i].style.display = 'none';
                }

                // Hiển thị section được chọn
                var selectedSection = document.getElementById(sectionId);
                if (selectedSection) {
                    selectedSection.style.display = 'block';
                }
            }

            function confirmLogout() {
                const confirmed = confirm("Are you sure you want to logout?");
                if (confirmed) {
                    window.location.href = 'login';
                }
            }

            // Assuming you have multiple modals for order details, each with a unique ID like "orderDetailsModal123"
            $('body').on('show.bs.modal', '.order-detail-modal', function (event) {
                var button = $(event.relatedTarget); // Button that triggered the modal
                var orderId = button.data('order-id'); // Assuming each button has a data-order-id attribute

                // Extract info from data-* attributes
                var customerName = button.data('customer-name');
                var phoneNumber = button.data('phone-number');
                var customerAddress = button.data('customer-address');

                // Use the orderId to construct the ID selectors for elements inside the modal
                var customerNameSelector = '#customerName' + orderId;
                var phoneNumberSelector = '#phoneNumber' + orderId;
                var customerAddressSelector = '#customerAddress' + orderId;

                // Update the modal's content
                $(this).find(customerNameSelector).text(customerName);
                $(this).find(phoneNumberSelector).text(phoneNumber);
                $(this).find(customerAddressSelector).text(customerAddress);
            });

            let clickCount = 0;  // Khởi tạo biến đếm số click
            let clickTimer = null;  // Khởi tạo biến cho bộ đếm thời gian

            function handleReportClick(orderId) {
                if (clickCount === 0) {
                    // Lần nhấn đầu tiên, xác nhận với người dùng
                    if (confirm("Do you want to start reporting this order?")) {
                        clickCount++;
                        startReportTimer(orderId);
                        alert("Please wait for 30 seconds to click again.");
                    }
                } else {
                    // Đã có ít nhất một lần nhấn, kiểm tra thời gian giữa các lần nhấn
                    alert("Please wait, you will be able to click again after 30 seconds.");
                }
            }

            function startReportTimer(orderId) {
                // Nếu đã có timer đang chạy, hủy nó đi
                if (clickTimer) {
                    clearTimeout(clickTimer);
                }
                // Bắt đầu đếm thời gian mới
                clickTimer = setTimeout(() => {
                    // Nếu đã nhấn 3 lần thì thực hiện report
                    if (clickCount >= 3) {
                        reportOrder(orderId);
                        resetReportProcess();
                    } else {
                        // Nếu chưa đủ 3 lần nhấn thì reset và cho phép nhấn tiếp
                        alert("You can now report again.");
                        clickCount++;
                        startReportTimer(orderId);  // Restart the timer
                    }
                }, 30000);  // Thời gian đếm là 30 giây
            }


            function resetReportProcess() {
                // Reset quá trình report
                clickCount = 0;
                clearTimeout(clickTimer);
                clickTimer = null;
            }

            function reportOrder(orderId) {
                // Hiển thị hộp thoại xác nhận
                if (confirm("Are you sure you want to report this order?")) {
                    $.ajax({
                        url: 'reportcompletedorder', // URL của Servlet
                        type: 'POST',
                        data: {
                            action: 'report',
                            orderId: orderId
                        },
                        success: function (response) {
                            alert('Order has been reported successfully.');
                            window.location.reload();
                        },
                        error: function () {
                            alert('Error reporting the order.');
                        }
                    });
                }
                console.log("Reporting order ID:", orderId); // Ghi log hoặc thực hiện hành động thực sự tại đây
                alert("Order reported successfully!");
                resetReportProcess(); // Reset lại sau khi report
            }

            function completeOrder(orderId) {
                // Hiển thị hộp thoại xác nhận
                if (confirm("Are you sure you want to mark this order as completed?")) {
                    $.ajax({
                        url: 'reportcompletedorder', // URL của Servlet
                        type: 'POST',
                        data: {
                            action: 'complete',
                            orderId: orderId
                        },
                        success: function (response) {
                            alert('Order has been completed successfully.');
                            window.location.reload();
                        },
                        error: function () {
                            alert('Error completing the order.');
                        }
                    });
                }
            }

            function showContentBasedOnParam(content) {
                // Ẩn tất cả các phần nội dung
                document.getElementById("newOrdersContent").style.display = "none";
                document.getElementById("completedOrdersContent").style.display = "none";
                document.getElementById("cancelledOrdersContent").style.display = "none";
                document.getElementById("profileContent").style.display = "none";
                // Hiển thị phần nội dung dựa trên tham số
                if (content === 'newOrdersContent') {
                    document.getElementById("newOrdersContent").style.display = "block";
                } else if (content === 'completedOrdersContent') {
                    document.getElementById("completedOrdersContent").style.display = "block";
                } else if (content === 'cancelledOrdersContent') {
                    document.getElementById("cancelledOrdersContent").style.display = "block";
                } else if (content === 'profileContent') {
                    document.getElementById("profileContent").style.display = "block";
                }

            }
        </script>
    </body>

</html>
