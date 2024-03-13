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
            <div class="top-header">
                <div class="header-bar d-flex justify-content-between border-bottom">
                    <div class="d-flex align-items-center">
                        <a href="#" class="logo-icon">
                            <img src="images/logo-icon.png" height="30" class="small" alt="">
                            <span class="big">
                                <img src="images/logo-dark.png" height="24" class="logo-light-mode" alt="">
                                <img src="images/logo-light.png" height="24" class="logo-dark-mode" alt="">
                            </span>
                        </a>
                        <a id="close-sidebar" class="btn btn-icon btn-pills btn-soft-primary ms-2" href="#">
                            <i class="uil uil-bars"></i>
                        </a>
                        <div class="search-bar p-0 d-none d-lg-block ms-2">
                            <div id="search" class="menu-search mb-0">
                                <form role="search" method="get" id="searchform" class="searchform">
                                    <div>
                                        <input type="text" class="form-control border rounded-pill" name="s" id="s" placeholder="Search Keywords...">
                                        <input type="submit" id="searchsubmit" value="Search">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <ul class="list-unstyled mb-0">
                        <li class="list-inline-item mb-0">
                            <div class="dropdown dropdown-primary">
                                <button type="button" class="btn btn-pills btn-soft-primary dropdown-toggle p-0" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="images/language/american.png" class="avatar avatar-ex-small rounded-circle p-2" alt=""></button>
                                <div class="dropdown-menu dd-menu drop-ups dropdown-menu-end bg-white shadow border-0 mt-3 p-2" data-simplebar style="height: 175px;">
                                    <a href="javascript:void(0)" class="d-flex align-items-center">
                                        <img src="images/language/chinese.png" class="avatar avatar-client rounded-circle shadow" alt="">
                                        <div class="flex-1 text-left ms-2 overflow-hidden">
                                            <small class="text-dark mb-0">Chinese</small>
                                        </div>
                                    </a>

                                    <a href="javascript:void(0)" class="d-flex align-items-center mt-2">
                                        <img src="images/language/european.png" class="avatar avatar-client rounded-circle shadow" alt="">
                                        <div class="flex-1 text-left ms-2 overflow-hidden">
                                            <small class="text-dark mb-0">European</small>
                                        </div>
                                    </a>

                                    <a href="javascript:void(0)" class="d-flex align-items-center mt-2">
                                        <img src="images/language/indian.png" class="avatar avatar-client rounded-circle shadow" alt="">
                                        <div class="flex-1 text-left ms-2 overflow-hidden">
                                            <small class="text-dark mb-0">Indian</small>
                                        </div>
                                    </a>

                                    <a href="javascript:void(0)" class="d-flex align-items-center mt-2">
                                        <img src="images/language/japanese.png" class="avatar avatar-client rounded-circle shadow" alt="">
                                        <div class="flex-1 text-left ms-2 overflow-hidden">
                                            <small class="text-dark mb-0">Japanese</small>
                                        </div>
                                    </a>

                                    <a href="javascript:void(0)" class="d-flex align-items-center mt-2">
                                        <img src="images/language/russian.png" class="avatar avatar-client rounded-circle shadow" alt="">
                                        <div class="flex-1 text-left ms-2 overflow-hidden">
                                            <small class="text-dark mb-0">Russian</small>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </li>

                        <li class="list-inline-item mb-0 ms-1">
                            <a href="javascript:void(0)" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">
                                <div class="btn btn-icon btn-pills btn-soft-primary"><i data-feather="settings" class="fea icon-sm"></i></div>
                            </a>
                        </li>

                        <li class="list-inline-item mb-0 ms-1">
                            <div class="dropdown dropdown-primary">
                                <button type="button" class="btn btn-icon btn-pills btn-soft-primary dropdown-toggle p-0" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i data-feather="mail" class="fea icon-sm"></i></button>
                                <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">4 <span class="visually-hidden">unread mail</span></span>

                                <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow rounded border-0 mt-3 px-2 py-2" data-simplebar style="height: 320px; width: 300px;">
                                    <a href="#" class="d-flex align-items-center justify-content-between py-2">
                                        <div class="d-inline-flex position-relative overflow-hidden">
                                            <img src="images/client/02.jpg" class="avatar avatar-md-sm rounded-circle shadow" alt="">
                                            <small class="text-dark mb-0 d-block text-truncat ms-3">You received a new email from <b>Janalia</b> <small class="text-muted fw-normal d-inline-block">1 hour ago</small></small>
                                        </div>
                                    </a>

                                    <a href="#" class="d-flex align-items-center justify-content-between py-2 border-top">
                                        <div class="d-inline-flex position-relative overflow-hidden">
                                            <img src="images/client/Codepen.svg" class="avatar avatar-md-sm rounded-circle shadow" alt="">
                                            <small class="text-dark mb-0 d-block text-truncat ms-3">You received a new email from <b>codepen</b>  <small class="text-muted fw-normal d-inline-block">4 hour ago</small></small>
                                        </div>
                                    </a>

                                    <a href="#" class="d-flex align-items-center justify-content-between py-2 border-top">
                                        <div class="d-inline-flex position-relative overflow-hidden">
                                            <img src="images/client/03.jpg" class="avatar avatar-md-sm rounded-circle shadow" alt="">
                                            <small class="text-dark mb-0 d-block text-truncat ms-3">You received a new email from <b>Cristina</b> <small class="text-muted fw-normal d-inline-block">5 hour ago</small></small>
                                        </div>
                                    </a>

                                    <a href="#" class="d-flex align-items-center justify-content-between py-2 border-top">
                                        <div class="d-inline-flex position-relative overflow-hidden">
                                            <img src="images/client/dribbble.svg" class="avatar avatar-md-sm rounded-circle shadow" alt="">
                                            <small class="text-dark mb-0 d-block text-truncat ms-3">You received a new email from <b>Dribbble</b> <small class="text-muted fw-normal d-inline-block">24 hour ago</small></small>
                                        </div>
                                    </a>

                                    <a href="#" class="d-flex align-items-center justify-content-between py-2 border-top">
                                        <div class="d-inline-flex position-relative overflow-hidden">
                                            <img src="images/client/06.jpg" class="avatar avatar-md-sm rounded-circle shadow" alt="">
                                            <small class="text-dark mb-0 d-block text-truncat ms-3">You received a new email from <b>Donald Aghori</b> <small class="text-muted fw-normal d-inline-block">1 day ago</small></small>
                                        </div>
                                    </a>

                                    <a href="#" class="d-flex align-items-center justify-content-between py-2 border-top">
                                        <div class="d-inline-flex position-relative overflow-hidden">
                                            <img src="images/client/07.jpg" class="avatar avatar-md-sm rounded-circle shadow" alt="">
                                            <small class="text-dark mb-0 d-block text-truncat ms-3">You received a new email from <b>Calvin</b> <small class="text-muted fw-normal d-inline-block">2 day ago</small></small>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </li>

                        <li class="list-inline-item mb-0 ms-1">
                            <div class="dropdown dropdown-primary">
                                <button type="button" class="btn btn-pills btn-soft-primary dropdown-toggle p-0" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="images/doctors/01.jpg" class="avatar avatar-ex-small rounded-circle" alt=""></button>
                                <div class="dropdown-menu dd-menu dropdown-menu-end bg-white shadow border-0 mt-3 py-3" style="min-width: 200px;">
                                    <a class="dropdown-item d-flex align-items-center text-dark" href="https://shreethemes.in/doctris/layouts/admin/profile.html">
                                        <img src="images/doctors/01.jpg" class="avatar avatar-md-sm rounded-circle border shadow" alt="">
                                        <div class="flex-1 ms-2">
                                            <span class="d-block mb-1">Calvin Carlo</span>
                                            <small class="text-muted">Orthopedic</small>
                                        </div>
                                    </a>
                                    <a class="dropdown-item text-dark" href="index.html"><span class="mb-0 d-inline-block me-1"><i class="uil uil-dashboard align-middle h6"></i></span> Dashboard</a>
                                    <a class="dropdown-item text-dark" href="dr-profile.html"><span class="mb-0 d-inline-block me-1"><i class="uil uil-setting align-middle h6"></i></span> Profile Settings</a>
                                    <div class="dropdown-divider border-top"></div>
                                    <a class="dropdown-item text-dark" href="lock-screen.html"><span class="mb-0 d-inline-block me-1"><i class="uil uil-sign-out-alt align-middle h6"></i></span> Logout</a>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="container-fluid">
                <div class="layout-specing">
                    <div class="d-md-flex justify-content-between">
                        <h5 class="mb-0">Add New Doctor</h5>

                        <nav aria-label="breadcrumb" class="d-inline-block mt-4 mt-sm-0">
                            <ul class="breadcrumb bg-transparent rounded mb-0 p-0">
                                <li class="breadcrumb-item"><a href="index.html">Doctris</a></li>
                                <li class="breadcrumb-item"><a href="doctors.html">Doctors</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Add Doctor</li>
                            </ul>
                        </nav>
                    </div>

                    <div class="row">
                        <div>
                            <div class="card border-0 p-4 rounded shadow">
                                <div class="row align-items-center">
                                    <div class="col-lg-2 col-md-4">
                                        <img src="images/doctors/01.jpg" class="avatar avatar-md-md rounded-pill shadow mx-auto d-block" alt="">
                                    </div><!--end col-->

                                    <div class="col-lg-5 col-md-8 text-center text-md-start mt-4 mt-sm-0">
                                        <h5 class="">Upload your picture</h5>
                                        <p class="text-muted mb-0">For best results, use an image at least 600px by 600px in either .jpg or .png format</p>
                                    </div><!--end col-->

                                    <div class="col-lg-5 col-md-12 text-lg-end text-center mt-4 mt-lg-0">
                                        <a href="#" class="btn btn-primary">Upload</a>
                                        <a href="#" class="btn btn-soft-primary ms-2">Remove</a>
                                    </div><!--end col-->
                                </div><!--end row-->

                                
                                
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
                                                <input required="" name="startdate" id="name2" type="date" class="form-control" placeholder="Start Date :">
                                            </div>
                                        </div><!--end col-->

                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">End Date</label>
                                                <input required="" name="enddate" id="email" type="date" class="form-control" placeholder="End Date :">
                                            </div> 
                                        </div><!--end col-->

                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Percent</label>
                                                <input  name="percent" id="email" type="text" class="form-control" 
                                                placeholder="Percent :" required="" pattern="^(\d+(\.\d{1,2})?|1(\.0{1,2})?)$"
                                   title="Must enter a number greater than or equal to zero and less than one"
                                   oninvalid="setCustomValidity('Must enter a number greater than or equal to 0 and less than 1')"
                                   oninput="setCustomValidity('')">
                                            </div> 
                                        </div><!--end col-->

                                        <div class="col-md-12">
                                            <div class="mb-3">
                                                <label class="form-label">Product Sale</label>                                            
                                                    <table class="table" border="3px" id="userTable" >
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

                            <!--                            <div class="col-lg-4 mt-4">
                                                            <div class="card rounded border-0 shadow">
                                                                <div class="p-4 border-bottom">
                                                                    <h5 class="mb-0">Doctors List</h5>
                                                                </div>
                            
                                                                <ul class="list-unstyled mb-0 p-4" data-simplebar style="height: 664px;">
                                                                    <li class="d-md-flex align-items-center text-center text-md-start">
                                                                        <img src="images/doctors/01.jpg" class="avatar avatar-medium rounded-md shadow" alt="">
                            
                                                                        <div class="ms-md-3 mt-4 mt-sm-0">
                                                                            <a href="#" class="text-dark h6">Dr. Calvin Carlo</a>
                                                                            <p class="text-muted my-1">Cardiologist</p>
                                                                            <p class="text-muted mb-0">3 Years Experienced</p>
                                                                        </div>
                                                                    </li>
                            
                                                                    <li class="d-md-flex align-items-center text-center text-md-start mt-4">
                                                                        <img src="images/doctors/02.jpg" class="avatar avatar-medium rounded-md shadow" alt="">
                            
                                                                        <div class="ms-md-3 mt-4 mt-sm-0">
                                                                            <a href="#" class="text-dark h6">Dr. Alex Smith</a>
                                                                            <p class="text-muted my-1">Dentist</p>
                                                                            <p class="text-muted mb-0">1 Years Experienced</p>
                                                                        </div>
                                                                    </li>
                            
                                                                    <li class="d-md-flex align-items-center text-center text-md-start mt-4">
                                                                        <img src="images/doctors/03.jpg" class="avatar avatar-medium rounded-md shadow" alt="">
                            
                                                                        <div class="ms-md-3 mt-4 mt-sm-0">
                                                                            <a href="#" class="text-dark h6">Dr. Cristina Luly</a>
                                                                            <p class="text-muted my-1">Orthopedic</p>
                                                                            <p class="text-muted mb-0">5 Years Experienced</p>
                                                                        </div>
                                                                    </li>
                            
                                                                    <li class="d-md-flex align-items-center text-center text-md-start mt-4">
                                                                        <img src="images/doctors/04.jpg" class="avatar avatar-medium rounded-md shadow" alt="">
                            
                                                                        <div class="ms-md-3 mt-4 mt-sm-0">
                                                                            <a href="#" class="text-dark h6">Dr. Dwayen Maria</a>
                                                                            <p class="text-muted my-1">Gastrologist</p>
                                                                            <p class="text-muted mb-0">2 Years Experienced</p>
                                                                        </div>
                                                                    </li>
                            
                                                                    <li class="d-md-flex align-items-center text-center text-md-start mt-4">
                                                                        <img src="images/doctors/05.jpg" class="avatar avatar-medium rounded-md shadow" alt="">
                            
                                                                        <div class="ms-md-3 mt-4 mt-sm-0">
                                                                            <a href="#" class="text-dark h6">Dr. Jenelia Focia</a>
                                                                            <p class="text-muted my-1">Psychotherapist</p>
                                                                            <p class="text-muted mb-0">3 Years Experienced</p>
                                                                        </div>
                                                                    </li>
                            
                                                                    <li class="mt-4">
                                                                        <a href="doctors.html" class="btn btn-primary">All Doctors</a>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>-->
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
    $(document).ready(function() {
        // Lắng nghe sự kiện thay đổi giá trị của input
        $('select[name="productid"]').change(function() {
            // Lấy giá trị của input
            var productId = $(this).val();

            // Gửi yêu cầu Ajax
            $.ajax({
                type: 'POST', // hoặc 'GET' tùy thuộc vào phương thức của bạn
                url: 'ajaxsale', // Đặt đường dẫn của servlet hoặc controller xử lý yêu cầu
                data: { productId: productId }, // Truyền dữ liệu, nếu cần thiết
                success: function(response) {
                    // Xử lý kết quả trả về từ server
                    // Ở đây, bạn có thể cập nhật thông tin sản phẩm trên giao diện người dùng
                    console.log(response);
                    // Ví dụ: Hiển thị thông tin sản phẩm trong một div có id là "productInfo"
                    $('#productInfo').html(response);
                },
                error: function(error) {
                    console.log('Error:', error);
                }
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

</body>

</html>
