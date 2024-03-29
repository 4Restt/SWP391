<%-- 
    Document   : AddDoctor
    Created on : Mar 4, 2024, 4:46:10 PM
    Author     : FPT SHOP
--%>

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
                <!-- header -->
            <jsp:include page="HeaderManager.jsp"></jsp:include>
                <!-- end header -->

                <div class="container-fluid">
                    <div class="layout-specing">
                        <div class="d-md-flex justify-content-between">
                            <h5 class="mb-0">Add New Staff</h5>

                            <nav aria-label="breadcrumb" class="d-inline-block mt-4 mt-sm-0">
                                <ul class="breadcrumb bg-transparent rounded mb-0 p-0">
                                    <li class="breadcrumb-item"><a href="home">Staff</a></li>
                                    <li class="breadcrumb-item"><a href="stafflist">List Staff</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Add Staff</li>
                                </ul>
                            </nav>
                        </div>

                        <div class="row">
                            <div class="col-lg-8 mt-4">
                                <div class="card border-0 p-4 rounded shadow">
                                    <div class="row align-items-center">
                                        <div class="col-lg-2 col-md-4">
                                            <img id ="imgAfterUp" src="${(imgAfterUp != null) ? imgAfterUp : 'images/profile-image-default.jpg'}" 
                                             class="avatar avatar-md-md rounded-pill shadow mx-auto d-block avatar-img" alt="">
                                    </div><!--end col-->

                                    <div class="col-lg-5 col-md-8 text-center text-md-start mt-4 mt-sm-0">
                                        <h5 class="">Upload your picture</h5>
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
                                <div id="loadingSpinner" style="display: none;">
        <!-- Loading spinner -->
        <div class="spinner-border text-primary" role="status">
            <span class="visually-hidden">Loading...</span>
        </div>
    </div>
                                <form id="addStaffForm" class="mt-4" action="addstaff" method="post">

                                    <div class="row">
                                        <div id="errorMessage" class="col-md-12">
                                            <!-- Error message will be displayed here -->
                                        </div>
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label class="form-label"> Name</label>
                                                <input name="name" id="name" type="text" class="form-control" placeholder="Name :">
                                            </div>
                                        </div><!--end col-->


                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Username</label>
                                                <input name="username" id="username" type="text" class="form-control" placeholder="Username: ">
                                            </div> 
                                        </div><!--end col-->

                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Password</label>
                                                <input name="password" id="password" type="password" class="form-control" placeholder="Password :">
                                            </div> 
                                        </div><!--end col-->

                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Your Email</label>
                                                <input name="email" id="email" type="email" class="form-control" placeholder="Your email :">
                                            </div> 
                                        </div><!--end col-->

                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Phone no.</label>
                                                <input name="phone" id="number" type="text" class="form-control" placeholder="Phone no. :">
                                            </div>                                                                               
                                        </div>
                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label class="form-label">Address</label>
                                                <textarea name="address" id="address" rows="3" class="form-control" placeholder="Address :"></textarea>
                                            </div>
                                        </div>
                                    </div><!--end row-->
                                    <input type="text" name="image" hidden="" value="">
                                    <button type="submit" class="btn btn-primary">Add Staff</button>
                                </form>
                            </div>
                        </div><!--end col-->

                        <div class="col-lg-4 mt-4">
                            <div class="card rounded border-0 shadow">
                                <div class="p-4 border-bottom">
                                    <h5 class="mb-0">Staff List</h5>
                                </div>

                                <ul class="list-unstyled mb-0 p-4" data-simplebar style="height: 664px;">
                                    <c:forEach items="${listStaff}" var="ls" varStatus="loop">
                                        <c:if test="${loop.index < 7}">
                                            <li class="d-md-flex align-items-center text-center text-md-start">
                                                <img src="${ls.getImage()}" class="avatar avatar-small rounded-md shadow" alt="">

                                                <div class="ms-md-3 mt-4 mt-sm-0">
                                                    <a href="#" class="text-dark h6">${ls.getName()}</a>
                                                    <p class="text-muted my-1">${ls.getAddress()}</p>
                                                    <p class="text-muted mb-0">${ls.getPhone()}</p>
                                                </div>
                                            </li>
                                        </c:if>
                                    </c:forEach>



                                    <li class="mt-4">
                                        <a href="stafflist" class="btn btn-primary">All Staffs</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
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

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script>
                                    function uploadImage() {
                                        var formData = new FormData($('#uploadForm')[0]);

                                        $.ajax({
                                            type: 'POST',
                                            url: 'uploadimgajax', // Modify to match your servlet mapping
                                            data: formData,
                                            processData: false,
                                            contentType: false,
                                            success: function (response) {
                                                // Display the uploaded image
                                                var imgSrc = response ? response : 'images/profile-image-default.jpg';
                                                $('#imgAfterUp').attr('src', imgSrc);
                                                $('input[name="image"]').attr('value', imgSrc);
                                            },
                                            error: function (xhr, status, error) {
                                                // Handle errors
                                                console.error(xhr.responseText);
                                            }
                                        });
                                    }
                                   $(document).ready(function() {
    $('#addStaffForm').submit(function(e) {
        e.preventDefault();
        $('#errorMessage').empty(); // Clear any previous error messages
        // Show loading spinner
        $('#loadingSpinner').show();
        $.ajax({
            type: 'POST',
            url: 'addstaff',
            data: $(this).serialize(),
            success: function(response) {
                if (response.trim() === 'success') {
                    // If success, redirect or do anything you want
                    alert('Staff member added successfully!');
                    window.location.href = 'addstaff';
                } else {
                    // If error, display error message
                    $('#errorMessage').html('<div class="alert alert-danger mt-3 col-lg-6">' + response + '</div>');
                }
            },
            error: function(xhr, status, error) {
                console.error(xhr.responseText);
            },
            complete: function() {
                // Hide loading spinner when request is complete
                $('#loadingSpinner').hide();
            }
        });
    });
});
    </script>

</body>

</html>
