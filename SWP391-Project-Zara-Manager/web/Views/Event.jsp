
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">

    <head>
        <meta charset="utf-8" />
        <title>Doctris - Doctor Appointment Booking System</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Premium Bootstrap 4 Landing Page Template" />
        <meta name="keywords" content="Appointment, Booking, System, Dashboard, Health" />
        <meta name="author" content="Shreethemes" />
        <meta name="email" content="support@shreethemes.in" />
        <meta name="website" content="../../../index.html" />
        <meta name="Version" content="v1.2.0" />
        <!-- favicon -->
        <link rel="shortcut icon" href="images/favicon.ico.png">
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- simplebar -->
        <link href="css/simplebar.css" rel="stylesheet" type="text/css" />
        <!-- Select2 -->
        <link href="css/select2.min.css" rel="stylesheet" />
        <!-- Icons -->
        <link href="css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- Css -->
        <link href="css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />

    </head>

    <body>
        <jsp:include page="Sidebar.jsp"></jsp:include>

        <!-- Start Page Content -->
        <main class="page-content bg-light">
        <jsp:include page="HeaderManager.jsp"></jsp:include>

            
                <div class="layout-specing">

                    <div class="row">
                        <div>
                            <div class="card border-0 p-4 rounded shadow">


                                
                                
                                <form class="mt-4" action="event" method="post">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Name of Event</label>
                                                <input required="" name="nameevent" id="nameevent" type="text" class="form-control" placeholder="Name of Event :">
                                            </div>
                                        </div><!--end col-->

                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Start Date</label>
                                                <input required="" name="startdate" id="startdate" type="date" class="form-control" placeholder="Start Date :">
                                            </div>
                                        </div><!--end col-->

                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">End Date</label>
                                                <input required="" name="enddate" id="enddate" type="date" class="form-control" placeholder="End Date :">
                                            </div> 
                                        </div><!--end col-->

                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Percent</label>
                                                <input  name="percent" id="percent" type="text" class="form-control" 
                                                placeholder="Percent :" required="" pattern="^100(\.0{1,2})?%$|^\d{1,2}(\.0{1,2})?%$"
                                   title="Sales percentage must be greater than 0% and less than 100%"
                                   oninvalid="setCustomValidity('Sales percentage must be greater than 0% and less than 100%')"
                                   oninput="setCustomValidity('')">
                                            </div> 
                                        </div><!--end col-->

                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label class="form-label">Product Sale</label>                                            
                                                <table class="table" border="3px" id="userTable">
                                                        <thead>
                                                            <tr>
                                                                <th>STT</th>
                                                                <th>Select</th>
                                                                <th>Product InfoId</th>
                                                                <th>Product Name</th>
                                                                <th>Product Image</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <c:forEach items="${listProduct}" var="ls" varStatus="status">
                                                                <tr>
                                                                    <td>${status.index + 1}</td>
                                                                    <td><input type="checkbox" name="selectedProducts" value="${ls.productInfoId}"/></td>
                                                                    <td>${ls.productInfoId}</td>
                                                                    <td>${ls.name}</td>
                                                                    <td><img src="${ls.imgDefault}" style="width: 90px;height: auto" alt="alt"/></td>
                                                                </tr>
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>
                                            </div>     
                                            
                                        </div><!--end col-->
                                        <button type="submit" class="btn btn-primary">Add Event</button>
                                    </div>
                                </form>
                            </div><!--end col-->

                            
                        </div><!--end row-->
                    </div>
                </div><!--end container-->

                <!-- Footer Start -->
                <footer class="bg-white shadow py-3">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <div class="col">
                                <div class="text-sm-start text-center">
                                    <p class="mb-0 text-muted"><script>document.write(new Date().getFullYear())</script> © Doctris. Design with <i class="mdi mdi-heart text-danger"></i> by <a href="../../../index.html" target="_blank" class="text-reset">Shreethemes</a>.</p>
                                </div>
                            </div><!--end col-->
                        </div><!--end row-->
                    </div><!--end container-->
                </footer><!--end footer-->
                <!-- End -->
        </main>
        <!--End page-content" -->
    </div>
    <!-- page-wrapper -->

    <!-- Offcanvas Start -->
    <div class="offcanvas offcanvas-end bg-white shadow" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
        <div class="offcanvas-header p-4 border-bottom">
            <h5 id="offcanvasRightLabel" class="mb-0">
                <img src="images/logo-dark.png" height="24" class="light-version" alt="">
                <img src="images/logo-light.png" height="24" class="dark-version" alt="">
            </h5>
            <button type="button" class="btn-close d-flex align-items-center text-dark" data-bs-dismiss="offcanvas" aria-label="Close"><i class="uil uil-times fs-4"></i></button>
        </div>
        <div class="offcanvas-body p-4 px-md-5">
            <div class="row">
                <div class="col-12">
                    <!-- Style switcher -->
                    <div id="style-switcher">
                        <div>
                            <ul class="text-center list-unstyled mb-0">
                                <li class="d-grid"><a href="javascript:void(0)" class="rtl-version t-rtl-light" onclick="setTheme('style-rtl')"><img src="images/layouts/light-dash-rtl.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">RTL Version</span></a></li>
                                <li class="d-grid"><a href="javascript:void(0)" class="ltr-version t-ltr-light" onclick="setTheme('style')"><img src="images/layouts/light-dash.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">LTR Version</span></a></li>
                                <li class="d-grid"><a href="javascript:void(0)" class="dark-rtl-version t-rtl-dark" onclick="setTheme('style-dark-rtl')"><img src="images/layouts/dark-dash-rtl.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">RTL Version</span></a></li>
                                <li class="d-grid"><a href="javascript:void(0)" class="dark-ltr-version t-ltr-dark" onclick="setTheme('style-dark')"><img src="images/layouts/dark-dash.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">LTR Version</span></a></li>
                                <li class="d-grid"><a href="javascript:void(0)" class="dark-version t-dark mt-4" onclick="setTheme('style-dark')"><img src="images/layouts/dark-dash.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">Dark Version</span></a></li>
                                <li class="d-grid"><a href="javascript:void(0)" class="light-version t-light mt-4" onclick="setTheme('style')"><img src="images/layouts/light-dash.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">Light Version</span></a></li>
                                <li class="d-grid"><a href="../landing/index.html" target="_blank" class="mt-4"><img src="images/layouts/landing-light.png" class="img-fluid rounded-md shadow-md d-block" alt=""><span class="text-muted mt-2 d-block">Landing Demos</span></a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- end Style switcher -->
                </div><!--end col-->
            </div><!--end row-->
        </div>

        <div class="offcanvas-footer p-4 border-top text-center">
            <ul class="list-unstyled social-icon mb-0">
                <li class="list-inline-item mb-0"><a href="https://1.envato.market/doctris-template" target="_blank" class="rounded"><i class="uil uil-shopping-cart align-middle" title="Buy Now"></i></a></li>
                <li class="list-inline-item mb-0"><a href="https://dribbble.com/shreethemes" target="_blank" class="rounded"><i class="uil uil-dribbble align-middle" title="dribbble"></i></a></li>
                <li class="list-inline-item mb-0"><a href="https://www.facebook.com/shreethemes" target="_blank" class="rounded"><i class="uil uil-facebook-f align-middle" title="facebook"></i></a></li>
                <li class="list-inline-item mb-0"><a href="https://www.instagram.com/shreethemes/" target="_blank" class="rounded"><i class="uil uil-instagram align-middle" title="instagram"></i></a></li>
                <li class="list-inline-item mb-0"><a href="https://twitter.com/shreethemes" target="_blank" class="rounded"><i class="uil uil-twitter align-middle" title="twitter"></i></a></li>
                <li class="list-inline-item mb-0"><a href="mailto:support@shreethemes.in" class="rounded"><i class="uil uil-envelope align-middle" title="email"></i></a></li>
                <li class="list-inline-item mb-0"><a href="../../../index.html" target="_blank" class="rounded"><i class="uil uil-globe align-middle" title="website"></i></a></li>
            </ul><!--end icon-->
        </div>
    </div>
    <!-- Offcanvas End -->

    <!-- View Appintment Start -->
    <div class="modal fade" id="viewappointment" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header border-bottom p-3">
                    <h5 class="modal-title" id="exampleModalLabel">Appointment Detail</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body p-3 pt-4">
                    <div class="d-flex align-items-center">
                        <img src="images/client/01.jpg" class="avatar avatar-small rounded-pill" alt="">
                        <h5 class="mb-0 ms-3">Howard Tanner</h5>
                    </div>
                    <ul class="list-unstyled mb-0 d-md-flex justify-content-between mt-4">
                        <li>
                            <ul class="list-unstyled mb-0">
                                <li class="d-flex">
                                    <h6>Age:</h6>
                                    <p class="text-muted ms-2">25 year old</p>
                                </li>

                                <li class="d-flex">
                                    <h6>Gender:</h6>
                                    <p class="text-muted ms-2">Male</p>
                                </li>

                                <li class="d-flex">
                                    <h6 class="mb-0">Department:</h6>
                                    <p class="text-muted ms-2 mb-0">Cardiology</p>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <ul class="list-unstyled mb-0">
                                <li class="d-flex">
                                    <h6>Date:</h6>
                                    <p class="text-muted ms-2">20th Dec 2020</p>
                                </li>

                                <li class="d-flex">
                                    <h6>Time:</h6>
                                    <p class="text-muted ms-2">11:00 AM</p>
                                </li>

                                <li class="d-flex">
                                    <h6 class="mb-0">Doctor:</h6>
                                    <p class="text-muted ms-2 mb-0">Dr. Calvin Carlo</p>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- View Appintment End -->

    <!-- Accept Appointment Start -->
    <div class="modal fade" id="acceptappointment" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body py-5">
                    <div class="text-center">
                        <div class="icon d-flex align-items-center justify-content-center bg-soft-success rounded-circle mx-auto" style="height: 95px; width:95px;">
                            <i class="uil uil-check-circle h1 mb-0"></i>
                        </div>
                        <div class="mt-4">
                            <h4>Accept Appointment</h4>
                            <p class="para-desc mx-auto text-muted mb-0">Great doctor if you need your family member to get immediate assistance, emergency treatment.</p>
                            <div class="mt-4">
                                <a href="#" class="btn btn-soft-success">Accept</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Accept Appointment End -->

    <!-- Cancel Appointment Start -->
    <div class="modal fade" id="cancelappointment" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body py-5">
                    <div class="text-center">
                        <div class="icon d-flex align-items-center justify-content-center bg-soft-danger rounded-circle mx-auto" style="height: 95px; width:95px;">
                            <i class="uil uil-times-circle h1 mb-0"></i>
                        </div>
                        <div class="mt-4">
                            <h4>Cancel Appointment</h4>
                            <p class="para-desc mx-auto text-muted mb-0">Great doctor if you need your family member to get immediate assistance, emergency treatment.</p>
                            <div class="mt-4">
                                <a href="#" class="btn btn-soft-danger">Cancel</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Cancel Appointment End -->
    <!-- Modal end -->

    <!-- javascript -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <!-- simplebar -->
    <script src="js/simplebar.min.js"></script>
    <!-- Select2 -->
    <script src="js/select2.min.js"></script>
    <script src="js/select2.init.js"></script>
    <!-- Icons -->
    <script src="js/feather.min.js"></script>
    <!-- Main Js -->
    <script src="js/app.js"></script>
<!-- jQuery library -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <!-- simplebar -->
    <script src="js/simplebar.min.js"></script>
    <!-- Select2 -->
    <script src="js/select2.min.js"></script>
    <script src="js/select2.init.js"></script>
    <!-- Datepicker -->
    <script src="js/flatpickr.min.js"></script>
    <script src="js/flatpickr.init.js"></script>
    <!-- Datepicker -->
    <script src="js/jquery.timepicker.min.js"></script> 
    <script src="js/timepicker.init.js"></script> 
    <!-- Icons -->
    <script src="js/feather.min.js"></script>
    <!-- Main Js -->
    <script src="js/app.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/2.0.1/js/dataTables.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/2.0.1/js/dataTables.bootstrap4.js"></script>

<!-- JavaScript code -->
<script>
    document.addEventListener("DOMContentLoaded", function() {
        const form = document.getElementById("productForm");
        const selectedProducts = new FormData(); // Sử dụng FormData thay vì mảng để lưu trữ các sản phẩm đã được chọn

        // Sự kiện thay đổi của các checkbox
        form.addEventListener("change", function(event) {
            const target = event.target;
            if (target.tagName === 'INPUT' && target.type === 'checkbox' && target.name === 'selectedProducts') {
                const productId = target.value;
                if (target.checked) {
                    // Nếu checkbox được chọn, thêm sản phẩm vào FormData
                    selectedProducts.append('selectedProducts', productId);
                } else {
                    // Nếu checkbox được bỏ chọn, loại bỏ sản phẩm khỏi FormData
                    selectedProducts.delete('selectedProducts', productId);
                }
            }
        });

        form.addEventListener("submit", function(event) {
            event.preventDefault(); // Ngăn chặn hành động mặc định của form

            // Lấy dữ liệu từ các trường input
            const nameevent = document.getElementById("nameevent").value;
            const startdate = document.getElementById("startdate").value;
            const enddate = document.getElementById("enddate").value;
            const percent = document.getElementById("percent").value;

            // Tạo một đối tượng FormData chứa tất cả dữ liệu
            const formData = new URLSearchParams();
            formData.append('nameevent', nameevent);
            formData.append('startdate', startdate);
            formData.append('enddate', enddate);
            formData.append('percent', percent);
            
            // Thêm các sản phẩm đã được chọn vào FormData
            for (const pair of selectedProducts.entries()) {
                formData.append(pair[0], pair[1]);
            }

            // Gửi dữ liệu đến servlet
            fetch('http://localhost:9999/SWP391-Project-Zara-Manager/event', {
                method: 'POST',
                body: formData
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
               window.location.reload();
            })
            .then(data => {
                console.log('Success:', data);
         ;
                // Xử lý phản hồi từ server (nếu cần)
            })
            .catch(error => {
                console.error('Error:', error);
                // Xử lý lỗi (nếu cần)
            });
        });
    });
</script>



<script>
             $(document).ready(function () {
         $('#userTable').DataTable({
             "pageLength": 3,
             "lengthChange": false
         });
     });
</script>
<script>
document.addEventListener("DOMContentLoaded", function() {
    const startDateInput = document.querySelector('input[name="startdate"]');
    const endDateInput = document.querySelector('input[name="enddate"]');

    function validateDates() {
        const startDate = new Date(startDateInput.value);
        const endDate = new Date(endDateInput.value);

        // Kiểm tra nếu startDate không hợp lệ hoặc endDate không hợp lệ
        if (!startDate.getTime() || !endDate.getTime()) {
            return; // Bỏ qua kiểm tra nếu một trong hai ngày không được chọn
        }

        if (startDate > endDate) {
            alert("Start Date must be before End Date.");
            // Tùy chỉnh để hiển thị thông báo lỗi theo ý muốn
            // Ví dụ: thêm một thông báo lỗi trong HTML
        }
    }

    startDateInput.addEventListener("change", validateDates);
    endDateInput.addEventListener("change", validateDates);
});
</script>


</body>

</html>
