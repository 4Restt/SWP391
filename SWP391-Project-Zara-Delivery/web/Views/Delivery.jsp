<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <!-- Meta tags Required for Bootstrap -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Delivery Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.datatables.net/2.0.2/js/dataTables.js"></script>
        <script src="https://cdn.datatables.net/2.0.2/js/dataTables.bootstrap5.js"></script>

        <style>
            /* Optional: Add additional custom styles here */
            #assign {
                width: 100% !important;
            }
            #cancel {
                width: 100% !important;
            }
            #complete {
                width: 100% !important;
            }
        </style>

        <link rel="stylesheet" type="text/css" href="css/deliver.css">

    </head>
    <body>
        <div class="sidebar">
            <h3>${deliveryName}</h3>
            <div id="loadOrdersMenu" class="list-group-item">
                <a href="#loadOrdersSubMenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Orders</a>
                <ul class="collapse list-unstyled" id="loadOrdersSubMenu">
                    <li>
                        <a href="#" class="list-group-item list-group-item-action" onclick="loadUnassign()">Unassigned Orders</a>
                    </li>
                    <li>
                        <a href="#" class="list-group-item list-group-item-action" onclick="loadAssign()">Assigned Orders</a>
                    </li>
                    <li>
                        <a href="#" class="list-group-item list-group-item-action" onclick="loadCancel()">Cancelled Orders</a>
                    </li>
                    <li>
                        <a href="#" class="list-group-item list-group-item-action" onclick="loadCompleted()">Completed Orders</a>
                    </li>
                </ul>
            </div>
            <!-- Load Profile with onclick event -->
            <a href="#" id="loadProfileButton" class="list-group-item list-group-item-action" onclick="loadProfile()">Profile</a>
            <!-- Load Shipper List with onclick event -->
            <a href="#" id="loadShipperListButton" class="list-group-item list-group-item-action" onclick="loadShipperList()">Shipper List</a>
        </div>


        <div class="content-wrapper">
            <div class="navbar">
                <h3>Wellcome hello hello</h3>
                <div class="logout-container">
                    <button class="btn logout-btn" onclick="confirmLogout()">Logout</button>
                </div>
            </div>
            <input type="hidden" id="contentValue" value="${content}">        


            <div id="content">
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

                <!-- Hiển thị danh sách shipper -->
                <div id="shipperListContent" style="display:block;">
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addShipperModal">Add Shipper</button>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Image</th>
                                <th>Name</th>
                                <th>Phone</th>
                                <th>Location</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${listShipper}" var="shipper">
                                <tr>
                                    <td><img src="${shipper.getImage()}" alt="Shipper Image" style="width:50px; height:auto;"></td>
                                    <td>${shipper.getName()}</td>
                                    <td>${shipper.getPhone()}</td>
                                    <td>${shipper.getLocation_name()}</td>
                                    <td>
                                        <!-- Nút kích hoạt modal chỉnh sửa -->
                                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editShipperModal${shipper.getId()}">Edit</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <!-- Modal chỉnh sửa cho mỗi shipper -->
                    <c:forEach items="${listShipper}" var="shipper">
                        <script>
                            function uploadImage${shipper.getId()}() {
                                var formData = new FormData($('#uploadForm${shipper.getId()}')[0]);
                                $.ajax({
                                    type: 'POST',
                                    url: 'uploadimgajax', // Modify to match your servlet mapping
                                    data: formData,
                                    processData: false,
                                    contentType: false,
                                    success: function (response) {
                                        // Display the uploaded image
                                        var imgSrc = response ? response : '${shipper.getImage()}';
                                        $(('#imgAfterUp${shipper.getId()}')).attr('src', imgSrc);
                                        $('input[name="image"]').attr('value', imgSrc);
                                    },
                                    error: function (xhr, status, error) {
                                        // Handle errors
                                        console.error(xhr.responseText);
                                    }
                                });
                            }

                        </script>         
                        <div class="modal fade" id="editShipperModal${shipper.getId()}" tabindex="-1" aria-labelledby="editShipperModalLabel${shipper.getId()}" aria-hidden="true">
                            <div class="modal-dialog modal-lg modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header border-bottom p-3">
                                        <h5 class="modal-title" id="editShipperModalLabel${shipper.getId()}">Edit Shipper</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body p-3 pt-4">
                                        <div class="card border-0 p-4 rounded shadow">
                                            <div class="row align-items-center">
                                                <div class="col-lg-2 col-md-4">
                                                    <img id ="imgAfterUp${shipper.getId()}" src="${shipper.getImage()}" 
                                                         class="avatar avatar-small rounded-pill shadow mx-auto d-block avatar-img" style="width:50px; height:auto;" alt="">
                                                </div><!--end col-->

                                                <div class="col-lg-5 col-md-8 text-center text-md-start mt-4 mt-sm-0">
                                                    <h5 class="">Upload your picture</h5>
                                                    <p class="text-muted mb-0">For best results, use an image at least 600px by 600px in either .jpg or .png format</p>
                                                </div><!--end col-->
                                            </div><!--end row-->
                                            <!-- Form Upload Image -->
                                            <form id="uploadForm${shipper.getId()}" enctype="multipart/form-data">
                                                <div class="col-lg-6 col-md-12 text-lg-end text-center mt-4 mt-lg-0">
                                                    <input type="file" class="form-control" name="image" id="imageUploadInput">
                                                    <input type="text" name="imageBackUp" hidden="" value="${shipper.getImage()}">

                                                    <input type="button" class="btn btn-primary" value="Upload" onclick="uploadImage${shipper.getId()}()">
                                                    <a href="#" class="btn btn-soft-primary ms-2" id="removeButton">Remove</a>
                                                </div>
                                            </form>
                                            <!-- Separate Form for Editing Shipper Details -->
                                            <form method="post" action="manageshipper?shipperId=${shipper.getId()}">
                                                <div class="row">
                                                    <div class="col-lg-6">
                                                        <div class="mb-3">
                                                            <label for="name${shipper.getId()}" class="form-label">Name <span class="text-danger">*</span></label>
                                                            <input type="text" class="form-control" id="name${shipper.getId()}" name="shipperName" value="${shipper.getName()}" required>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6">
                                                        <div class="mb-3">
                                                            <label for="name${shipper.getId()}" class="form-label">Password <span class="text-danger">*</span></label>
                                                            <input type="text" class="form-control" id="name${shipper.getId()}" name="shipperPassword" value="${shipper.getPassword()}" required>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="mb-3">
                                                            <label for="phone${shipper.getId()}" class="form-label">Phone <span class="text-danger">*</span></label>
                                                            <input type="tel" class="form-control" id="phone${shipper.getId()}" name="shipperPhone" value="${shipper.getPhone()}" required>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-12">
                                                        <div class="mb-3">
                                                            <label for="address${shipper.getId()}" class="form-label">Address <span class="text-danger">*</span></label>
                                                            <input type="text" class="form-control" id="address${shipper.getId()}" name="shipperLocation" value="${shipper.getLocation_name()}" required>
                                                        </div>
                                                    </div>
                                                    <!-- Hidden field for image URL, updated on successful image upload -->
                                                    <input type="text" name="imageBackUp" hidden="" value="${shipper.getImage()}">
                                                    <input type="text" name="image" hidden="" value="">
                                                    <div class="col-lg-12">
                                                        <div class="d-grid">
                                                            <button type="submit" class="btn btn-primary">Save Changes</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                    <!-- Button to Open the Modal -->


                    <div class="modal fade" id="addShipperModal" tabindex="-1" aria-labelledby="addShipperModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="addShipperModalLabel">Add New Shipper</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="col-lg-8 mt-4">
                                        <div class="card border-0 p-4 rounded shadow">
                                            <div class="row align-items-center">
                                                <div class="col-lg-2 col-md-4">
                                                    <img id="imgAfterUp" src="images/profile-image-default.jpg" 
                                                         class="avatar avatar-md-md rounded-pill shadow mx-auto d-block avatar-img" style="width:50px; height:auto;" alt="">
                                                </div><!--end col-->

                                                <div class="col-lg-5 col-md-8 text-center text-md-start mt-4 mt-sm-0">
                                                    <h5>Upload your picture</h5>
                                                    <p class="text-muted mb-0">For best results, use an image at least 600px by 600px in either .jpg or .png format</p>
                                                </div><!--end col-->
                                            </div><!--end row-->
                                            <form id="uploadForm" enctype="multipart/form-data">
                                                <div class="col-lg-6 col-md-12 text-lg-end text-center mt-4 mt-lg-0">
                                                    <input type="file" class="form-control" name="image" id="imageUploadInput">
                                                    <input type="button" class="btn btn-primary" value="Upload" onclick="uploadImage()">
                                                    <a href="#" class="btn btn-soft-primary ms-2" id="removeButton">Remove</a>
                                                </div><!--end col-->
                                            </form>

                                            <div id="status"></div>
                                            <form class="mt-4" action="addshipper" method="post">
                                                <!-- Form Fields for Shipper Details -->
                                                <!-- Similar to your provided structure, include fields for name, username, password, etc. -->
                                                <input type="text" name="image" hidden="" value="">
                                                <button type="submit" class="btn btn-primary">Add Shipper</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="container-fluid" id="assignedOrdersContent" style="display:none;">
                    <h3>Assigned Orders</h3>
                    <div class="col-12">
                        <table class="table" id="assign">
                            <thead>
                                <tr>
                                    <th>STT</th>
                                    <th>Customer Address</th>
                                    <th>Total Price</th>
                                    <th>Date</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${alreadyOrders}" var="order" varStatus="status">
                                    <tr>
                                        <td>${status.index + 1}</td>
                                        <td>${order.customerAddress}</td>
                                        <td>${order.totalprice}</td>
                                        <td>${order.date}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${order.status == 4}">Shipping</c:when>
                                                <c:when test="${order.status == 5}">Completed</c:when>
                                                <c:when test="${order.status == 6}">Cancelled</c:when>
                                                <c:otherwise>Unknown</c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Đơn hàng chưa giao -->
                <div id="unassignedOrdersContent" style="display:none;">
                    <h3>Unassigned Orders</h3>


                    <!-- Bảng Unassigned Orders --> 
                    <form id="assignShipperForm" method="POST" action="assignorder">
                        <select id="addressSelect" onchange="filterByAddress(this.value)">
                            <option value="">All</option>
                            <c:forEach items="${listOfAddresses}" var="address">
                                <option value="${address}" ${address.equals(sessionScope.filterSearchTerm) ? "selected" : ""}>${address}</option>
                            </c:forEach>
                        </select>

                        <table class="table" id="unassign">
                            <thead>
                                <tr>
                                    <th>STT</th>
                                    <th>Select</th>
                                    <th>Customer Address</th>
                                    <th>Total Price</th>
                                    <th>Date</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${orders}" var="order" varStatus="status">
                                    <tr>
                                        <td>${status.index + 1}</td>
                                        <td><input type="checkbox" name="selectedOrders" value="${order.id}"/></td>
                                        <td>${order.customerAddress}</td>
                                        <td>${order.totalprice}</td>
                                        <td>${order.date}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${order.status == 4}">Shipping</c:when>
                                                <c:when test="${order.status == 5}">Completed</c:when>
                                                <c:when test="${order.status == 6}">Cancelled</c:when>
                                                <c:otherwise>Unknown</c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                        <h3>Available Shippers for Delivery ${deliveryName}</h3>
                        <!-- Bảng Shipper List -->
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Select</th>
                                    <th>Name</th>
                                    <th>Location</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${shippers}" var="shipper">
                                    <tr>
                                        <td><input type="checkbox" class="shipper-checkbox" name="shipperId" value="${shipper.getId()}" onclick="onlyOneShipper(this)"/></td>
                                        <td>${shipper.getName()}</td>
                                        <td>${shipper.getLocation_name()}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>


                        <button type="submit" class="btn btn-primary">Assign Shipper</button>
                    </form>
                </div>



                <!-- Đơn hàng đã hủy -->
                <div class="container-fluid" id="cancelledOrdersContent" style="display:none;">
                    <h3>Cancelled Orders</h3>
                    <div class="col-12">
                        <table class="table" id="cancel">
                            <thead>
                                <tr>
                                    <th>STT</th>
                                    <th>Customer Address</th>
                                    <th>Total Price</th>
                                    <th>Date</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${cancelledOrders}" var="order" varStatus="status">
                                    <tr>
                                        <td>${status.index + 1}</td>
                                        <td>${order.customerAddress}</td>
                                        <td>${order.totalprice}</td>
                                        <td>${order.date}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${order.status == 4}">Shipping</c:when>
                                                <c:when test="${order.status == 5}">Completed</c:when>
                                                <c:when test="${order.status == 6}">Cancelled</c:when>
                                                <c:otherwise>Unknown</c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="container-fluid" id="completedOrdersContent" style="display:none;">
                    <h3>Completed Orders</h3>
                    <div class="col-12">
                        <table class="table" id="complete">
                            <thead>
                                <tr>
                                    <th>STT</th>
                                    <th>Customer Address</th>
                                    <th>Total Price</th>
                                    <th>Date</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${completedOrders}" var="order" varStatus="status">
                                    <tr>
                                        <td>${status.index + 1}</td>
                                        <td>${order.customerAddress}</td>
                                        <td>${order.totalprice}</td>
                                        <td>${order.date}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${order.status == 4}">Shipping</c:when>
                                                <c:when test="${order.status == 5}">Completed</c:when>
                                                <c:when test="${order.status == 6}">Cancelled</c:when>
                                                <c:otherwise>Unknown</c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
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

            function loadUnassign() {
                // Ẩn tất cả các phần nội dung khác
                document.getElementById("orderContent").style.display = "none";
                document.getElementById("shipperListContent").style.display = "none";
                document.getElementById("assignedOrdersContent").style.display = "none";
                document.getElementById("unassignedOrdersContent").style.display = "block";
                document.getElementById("cancelledOrdersContent").style.display = "none";
                document.getElementById("completedOrdersContent").style.display = "none";

                document.getElementById("profileContent").style.display = "none";
            }

            function loadAssign() {
                // Ẩn tất cả các phần nội dung khác
                document.getElementById("orderContent").style.display = "none";
                document.getElementById("shipperListContent").style.display = "none";
                document.getElementById("assignedOrdersContent").style.display = "block";
                document.getElementById("unassignedOrdersContent").style.display = "none";
                document.getElementById("cancelledOrdersContent").style.display = "none";
                document.getElementById("completedOrdersContent").style.display = "none";

                document.getElementById("profileContent").style.display = "none";
            }

            function loadCancel() {
                // Ẩn tất cả các phần nội dung khác
                document.getElementById("orderContent").style.display = "none";
                document.getElementById("shipperListContent").style.display = "none";
                document.getElementById("assignedOrdersContent").style.display = "none";
                document.getElementById("unassignedOrdersContent").style.display = "none";
                document.getElementById("cancelledOrdersContent").style.display = "block";
                document.getElementById("completedOrdersContent").style.display = "none";

                document.getElementById("profileContent").style.display = "none";
            }

            function loadProfile() {
                // Ẩn tất cả các phần nội dung khác
                document.getElementById("orderContent").style.display = "none";
                document.getElementById("shipperListContent").style.display = "none";
                document.getElementById("assignedOrdersContent").style.display = "none";
                document.getElementById("unassignedOrdersContent").style.display = "none";
                document.getElementById("cancelledOrdersContent").style.display = "none";
                document.getElementById("completedOrdersContent").style.display = "none";

                document.getElementById("profileContent").style.display = "block";
            }


            function loadShipperList() {
                // Ẩn tất cả các phần nội dung khác
                document.getElementById("orderContent").style.display = "none";
                document.getElementById("profileContent").style.display = "none";
                document.getElementById("assignedOrdersContent").style.display = "none";
                document.getElementById("unassignedOrdersContent").style.display = "none";
                document.getElementById("cancelledOrdersContent").style.display = "none";
                document.getElementById("shipperListContent").style.display = "block";
                document.getElementById("completedOrdersContent").style.display = "none";
            }
            function loadCompleted() {
                // Ẩn tất cả các phần nội dung khác
                document.getElementById("orderContent").style.display = "none";
                document.getElementById("profileContent").style.display = "none";
                document.getElementById("assignedOrdersContent").style.display = "none";
                document.getElementById("unassignedOrdersContent").style.display = "none";
                document.getElementById("cancelledOrdersContent").style.display = "none";
                document.getElementById("shipperListContent").style.display = "none";
                document.getElementById("completedOrdersContent").style.display = "block";
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
                } else if (content === 'shipperList') {
                    document.getElementById("shipperListContent").style.display = "block";
                }

            }



            function filterByAddress(searchTerm) {
                const normalizedSearchTerm = searchTerm.trim().toLowerCase();

                // Lọc đơn hàng chưa được giao
                const orderRows = document.querySelectorAll("#unassignedOrdersContent .table:first-of-type tbody tr");
                orderRows.forEach(function (row) {
                    // Địa chỉ khách hàng nằm ở cột thứ hai
                    const customerAddress = row.cells[2].textContent.trim().toLowerCase();
                    row.style.display = customerAddress.includes(normalizedSearchTerm) || normalizedSearchTerm === '' ? "" : "none";
                });

                // Lọc danh sách shipper
                const shipperRows = document.querySelectorAll("#unassignedOrdersContent .table:last-of-type tbody tr");
                shipperRows.forEach(function (row) {
                    // Địa điểm shipper nằm ở cột thứ ba
                    const locationName = row.cells[2].textContent.trim().toLowerCase();
                    row.style.display = locationName.includes(normalizedSearchTerm) || normalizedSearchTerm === '' ? "" : "none";
                });
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

            function uploadImageShipper(id) {
                var formData = new FormData(document.getElementById('uploadForm' + id));
                $.ajax({
                    type: 'POST',
                    url: 'uploadShipperImage', // Đường dẫn tới endpoint xử lý việc tải ảnh lên của bạn
                    data: formData,
                    processData: false, // Không xử lý dữ liệu
                    contentType: false, // Không đặt contentType
                    success: function (response) {
                        // Thành công, cập nhật URL ảnh mới vào giao diện người dùng
                        // Giả sử 'response' là URL mới của ảnh
                        $('#currentImage' + id).attr('src', response);
                        // Cập nhật giá trị của trường ẩn trong form cập nhật thông tin để gửi URL ảnh mới
                        $('#image' + id).val(response);
                    },
                    error: function (xhr, status, error) {
                        console.error("Error: " + error);
                    }
                });
            }

            $(document).ready(function () {
                $('#unassign').DataTable({
                    "pageLength": 5,
                    "lengthChange": false
                });
                $('#assign').DataTable({
                    "autoWidth": true,
                    "pageLength": 5,
                    "lengthChange": false
                });
                $('#cancel').DataTable({
                    "autoWidth": true,
                    "pageLength": 5,
                    "lengthChange": false
                });
                $('#complete').DataTable({
                    "autoWidth": true,
                    "pageLength": 5,
                    "lengthChange": false
                });
            });

            function confirmLogout() {
                const confirmed = confirm("Are you sure you want to logout?");
                if (confirmed) {
                    window.location.href = 'login';
                }
            }

        </script>
    </body>


</html>
