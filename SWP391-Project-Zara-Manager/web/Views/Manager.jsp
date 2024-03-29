<%-- 
    Document   : Manager.jsp
    Created on : Feb 28, 2024, 10:30:54 PM
    Author     : FPT SHOP
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <title>Kaira-Fashion store</title>
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
        <!-- SLIDER -->
        <link href="css/tiny-slider.css" rel="stylesheet" />
        <!-- Css -->
        <link href="css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />

    </head>

    <body>
        <jsp:include page="Sidebar.jsp"></jsp:include>
            <!-- Start Page Content -->
            <main class="page-content bg-light">
            <jsp:include page="HeaderManager.jsp"></jsp:include>

                <div class="container-fluid">
                    <div class="layout-specing">
                        <h5 class="mb-0">Dashboard</h5>

                        <div class="row">
                            <div class="col-xl-2 col-lg-4 col-md-4 mt-4">
                                <div class="card features feature-primary rounded border-0 shadow p-4">
                                    <div class="d-flex align-items-center">
                                        <div class="icon text-center rounded-md">
                                            <i class="uil uil-bed h3 mb-0"></i>
                                        </div>
                                        <div class="flex-1 ms-2">
                                            <h5 class="mb-0">558</h5>
                                            <p class="text-muted mb-0">Patients</p>
                                        </div>
                                    </div>
                                </div>
                            </div><!--end col-->

                            <div class="col-xl-2 col-lg-4 col-md-4 mt-4">
                                <div class="card features feature-primary rounded border-0 shadow p-4">
                                    <div class="d-flex align-items-center">
                                        <div class="icon text-center rounded-md">
                                            <i class="uil uil-file-medical-alt h3 mb-0"></i>
                                        </div>
                                        <div class="flex-1 ms-2">
                                            <h5 class="mb-0">$${revenue}</h5>
                                        <p class="text-muted mb-0">Revenue</p>
                                    </div>
                                </div>
                            </div>
                        </div><!--end col-->

                        <div class="col-xl-2 col-lg-4 col-md-4 mt-4">
                            <div class="card features feature-primary rounded border-0 shadow p-4">
                                <div class="d-flex align-items-center">
                                    <a href="stafflist" class="icon text-center rounded-md">
                                        <i class="uil uil-social-distancing h3 mb-0"></i>
                                    </a>
                                    <div class="flex-1 ms-2">
                                        <h5 class="mb-0">${totalStaff}</h5>
                                        <p class="text-muted mb-0">Staff</p>
                                    </div>
                                </div>
                            </div>
                        </div><!--end col-->

                        <div class="col-xl-2 col-lg-4 col-md-4 mt-4">
                            <div class="card features feature-primary rounded border-0 shadow p-4">
                                <div class="d-flex align-items-center">
                                    <a href="#" class="icon text-center rounded-md">
                                        <i class="uil uil-shop h3 mb-0"></i>
                                    </a>

                                    <div class="flex-1 ms-2">
                                        <h5 class="mb-0">${totalProduct}</h5>
                                        <p class="text-muted mb-0">Product</p>
                                    </div>
                                </div>

                            </div>
                        </div><!--end col-->

                        <div class="col-xl-2 col-lg-4 col-md-4 mt-4">
                            <div class="card features feature-primary rounded border-0 shadow p-4">
                                <div class="d-flex align-items-center">
                                    <a href="customerlist" class="icon text-center rounded-md">
                                        <i class="uil uil-user h3 mb-0"></i>
                                    </a>

                                    <div class="flex-1 ms-2">
                                        <h5 class="mb-0">${totalCustomer}</h5>
                                        <p class="text-muted mb-0">Customer</p>
                                    </div>
                                </div>
                            </div>
                        </div><!--end col-->

                        <div class="col-xl-2 col-lg-4 col-md-4 mt-4">
                            <div class="card features feature-primary rounded border-0 shadow p-4">
                                <div class="d-flex align-items-center">
                                    <a href="process" class="icon text-center rounded-md">
                                        <i class="uil uil-medical-drip h3 mb-0"></i>
                                    </a>
                                    <div class="flex-1 ms-2">
                                        <h5 class="mb-0">${totalOrder}</h5>
                                        <p class="text-muted mb-0">Order</p>
                                    </div>
                                </div>
                            </div>
                        </div><!--end col-->
                    </div><!--end row-->



                    <div class="row">
                        <div class="col-xl-4 col-lg-6 mt-4">
                            <div class="card border-0 shadow rounded">
                                <div class="d-flex justify-content-between align-items-center p-4 border-bottom">
                                    <h6 class="mb-0"><i class="uil uil-calender text-primary me-1 h5"></i> Latest Order</h6>
                                    <h6 class="text-muted mb-0">${totalOrderProcess} Order</h6>
                                </div>

                                <ul class="list-unstyled mb-0 p-4">
                                    <c:forEach items="${listOrderProcess}" var="lo">
                                        <c:forEach items="${listCustomer}" var="lc">
                                            <c:if test="${lo.getCustomer_id() eq lc.getId()}">
                                                <li>
                                                    <div class="d-flex align-items-center justify-content-between">
                                                        <div class="d-inline-flex">
                                                            <img src="${lc.getImage()}" class="avatar avatar-md-sm rounded-circle border shadow" alt="">
                                                            <div class="ms-3">
                                                                <h6 class="text-dark mb-0 d-block">${lc.getName()}</h6>
                                                                <small class="text-muted">Booking on ${lo.getDate()}</small>
                                                            </div>
                                                        </div>
                                                        <div>
                                                            <a href="process" class="btn btn-icon btn-pills btn-soft-primary"><i class="uil-arrow-right"></i></a>

                                                        </div>
                                                    </div>
                                                </li></c:if>
                                        </c:forEach>
                                    </c:forEach>

                                </ul>
                            </div>
                        </div><!--end col-->

                        
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

    <!-- javascript -->
    <script src="js/bootstrap.bundle.min.js"></script>
    <!-- simplebar -->
    <script src="js/simplebar.min.js"></script>
    <!-- Chart -->
    <script src="js/apexcharts.min.js"></script>
    <script src="js/columnchart.init.js"></script>
    <!-- Icons -->
    <script src="js/feather.min.js"></script>
    <!-- Main Js -->
    <script src="js/app.js"></script>

</body>

</html>
