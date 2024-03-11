
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <!-- Date picker -->
        <link rel="stylesheet" href="css/flatpickr.min.css">
        <link href="css/jquery.timepicker.min.css" rel="stylesheet" type="text/css" />
        <!-- Icons -->
        <link href="css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">

        <!-- Css -->
        <link href="css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />
        <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css"  rel="stylesheet">
        <link href="https://cdn.datatables.net/2.0.1/css/dataTables.bootstrap4.css"  rel="stylesheet">
        <style>
            table.dataTable th.dt-type-numeric, table.dataTable th.dt-type-date, table.dataTable td.dt-type-numeric, table.dataTable td.dt-type-date {
                text-align: left;
            }
            .gradient-custom {
                /* fallback for old browsers */
                background: #cd9cf2;

                /* Chrome 10-25, Safari 5.1-6 */
                background: -webkit-linear-gradient(to top left, rgba(205, 156, 242, 1), rgba(246, 243, 255, 1));

                /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
                background: linear-gradient(to top left, rgba(205, 156, 242, 1), rgba(246, 243, 255, 1))
            }
        </style>
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
                        <div class="row">
                            <div class="col-xl-9 col-lg-6 col-md-4">
                                <h5 class="mb-0">Order List</h5>
                                <nav aria-label="breadcrumb" class="d-inline-block mt-2">
                                    <ul class="breadcrumb breadcrumb-muted bg-transparent rounded mb-0 p-0">
                                        <li class="breadcrumb-item"><a href="index.html">Order</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Staff List In Processing</li>
                                    </ul>
                                </nav>
                            </div><!--end col-->

                            <div class="col-xl-3 col-lg-6 col-md-8 mt-4 mt-md-0">
                                <div class="justify-content-md-end">
                                    <form>
                                        <div class="row justify-content-between align-items-center">
                                            <div class="col-sm-12 col-md-5">
                                                <div class="mb-0 position-relative">
                                                    <select class="form-control time-during select2input" hidden>
                                                        <option value="EY">Today</option>
                                                        <option value="GY">Tomorrow</option>
                                                        <option value="PS">Yesterday</option>
                                                    </select>
                                                </div>
                                            </div><!--end col-->

                                            <div class="col-sm-12 col-md-7 mt-4 mt-sm-0">
                                                <div class="d-grid">
                                                    <a href="#" class="btn btn-primary">Add Staff</a>
                                                </div>
                                            </div><!--end col-->
                                        </div><!--end row-->
                                    </form><!--end form-->
                                </div>
                            </div><!--end col-->
                        </div><!--end row-->

                        <div class="row">
                            <div class="col-12 mt-4">
                                <div class="">
                                    <table id="userTable" class="table table-striped table-bordered">
                                        <thead>
                                            <tr>
                                                <th class="border-bottom p-3" style="min-width: 50px; ">Order Id</th>
                                                <th class="border-bottom p-3" style="min-width: 50px;">Customer Id</th>
                                                <th class="border-bottom p-3" style="min-width: 150px;">Date</th>
                                                <th class="border-bottom p-3" style="min-width: 150px;">Total Price</th>
                                                <th class="border-bottom p-3" style="min-width: 100px;">Status</th>

                                                <th class="border-bottom p-3" style="min-width: 150px;"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${listOrder}" var="lo" varStatus="loop">
                                            <tr>
                                                <th class="p-3">${lo.getId()}</th>
                                                <td class="p-3">${lo.getCustomer_id()}</td>
                                                <td class="p-3">${lo.getDate()}</td>
                                                <td class="p-3">${lo.getTotalprice()}</td>                                              
                                                <td class="p-3">
                                                    <c:choose>
                                                        <c:when test="${lo.getStatus() eq 0}">
                                                            <span class="text-danger">Processing</span>
                                                        </c:when>
                                                        <c:when test="${lo.getStatus() eq 1}">
                                                            <span class="text-success">Accept</span>
                                                        </c:when>
                                                        <c:when test="${lo.getStatus() eq 2}">
                                                            <span class="text-warning">Prepare</span>
                                                        </c:when>
                                                        <c:when test="${lo.getStatus() eq 3}">
                                                            Delivered to the shipping unit
                                                        </c:when>
                                                    </c:choose>
                                                </td>

                                                <td class="text-end p-3">
                                                    <a href="#" class="btn btn-icon btn-pills btn-soft-primary" data-bs-toggle="modal" data-bs-target="#vieworder${lo.getId()}"><i class="uil uil-eye"></i></a>
                                                    <a href="#" class="btn btn-icon btn-pills btn-soft-success" data-bs-toggle="modal" data-bs-target="#acceptorder${lo.getId()}"><i class="uil uil-check-circle"></i></a>
                                                    <a href="#" class="btn btn-icon btn-pills btn-soft-danger" data-bs-toggle="modal" data-bs-target="#cancelorder${lo.getId()}"><i class="uil uil-times-circle"></i></a>
                                                    <a href="#" class="btn btn-icon btn-pills btn-soft-muted" data-bs-toggle="modal" data-bs-target="#editorder${lo.getId()}"><i class="uil uil-user"></i></a>
                                                </td>
                                            </tr>
                                        </c:forEach>    

                                    </tbody>
                                </table>
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

    <!-- Modal start -->
    <!-- Add New Appointment Start -->
    <div class="modal fade" id="appointmentform" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header border-bottom p-3">
                    <h5 class="modal-title" id="exampleModalLabel">Book an Appointment</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body p-3 pt-4">
                    <form>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="mb-3">
                                    <label class="form-label">Patient Name <span class="text-danger">*</span></label>
                                    <input name="name" id="name" type="text" class="form-control" placeholder="Patient Name :">
                                </div>
                            </div><!--end col-->

                            <div class="col-lg-4 col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">Departments</label>
                                    <select class="form-control department-name select2input">
                                        <option value="EY">Eye Care</option>
                                        <option value="GY">Gynecologist</option>
                                        <option value="PS">Psychotherapist</option>
                                        <option value="OR">Orthopedic</option>
                                        <option value="DE">Dentist</option>
                                        <option value="GA">Gastrologist</option>
                                        <option value="UR">Urologist</option>
                                        <option value="NE">Neurologist</option>
                                    </select>
                                </div>
                            </div><!--end col-->

                            <div class="col-lg-4 col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">Doctor</label>
                                    <select class="form-control doctor-name select2input">
                                        <option value="CA">Dr. Calvin Carlo</option>
                                        <option value="CR">Dr. Cristino Murphy</option>
                                        <option value="AL">Dr. Alia Reddy</option>
                                        <option value="TO">Dr. Toni Kovar</option>
                                        <option value="JE">Dr. Jessica McFarlane</option>
                                        <option value="EL">Dr. Elsie Sherman</option>
                                        <option value="BE">Dr. Bertha Magers</option>
                                        <option value="LO">Dr. Louis Batey</option>
                                    </select>
                                </div>
                            </div><!--end col-->

                            <div class="col-lg-4 col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">Your Email <span class="text-danger">*</span></label>
                                    <input name="email" id="email" type="email" class="form-control" placeholder="Your email :">
                                </div> 
                            </div><!--end col-->

                            <div class="col-lg-4 col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">Your Phone <span class="text-danger">*</span></label>
                                    <input name="phone" id="phone" type="tel" class="form-control" placeholder="Your Phone :">
                                </div> 
                            </div><!--end col-->

                            <div class="col-lg-4 col-md-6">
                                <div class="mb-3">
                                    <label class="form-label"> Date : </label>
                                    <input name="date" type="text" class="flatpickr flatpickr-input form-control" id="checkin-date">
                                </div>
                            </div><!--end col-->

                            <div class="col-lg-4 col-md-6">
                                <div class="mb-3">
                                    <label class="form-label" for="input-time">Time : </label>
                                    <input name="time" type="text" class="form-control timepicker" id="input-time" placeholder="03:30 PM">
                                </div> 
                            </div><!--end col-->

                            <div class="col-lg-12">
                                <div class="mb-3">
                                    <label class="form-label">Comments <span class="text-danger">*</span></label>
                                    <textarea name="comments" id="comments" rows="4" class="form-control" placeholder="Your Message :"></textarea>
                                </div>
                            </div><!--end col-->

                            <div class="col-lg-12">
                                <div class="d-grid">
                                    <button type="submit" class="btn btn-primary">Book An Appointment</button>
                                </div>
                            </div><!--end col-->
                        </div><!--end row-->
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Add New Appointment End -->

    <!-- View Appintment Start -->
    <c:forEach items="${listOrder}" var="lo" varStatus="loop">
        <div class="modal fade" id="vieworder${lo.getId()}" tabindex="-1" aria-labelledby="exampleModalLabel${lo.getId()}" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-xl">
                <div class="modal-content">
                    <div class="modal-header border-bottom p-3">
                        <h5 class="modal-title" id="exampleModalLabel${lo.getId()}">Order Detail</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <section class="h-100 gradient-custom">
                            <div class="container py-5 h-100">
                                <div class="row d-flex justify-content-center align-items-center h-100">
                                    <div class="col-lg-10 col-xl-8">
                                        <div class="card" style="border-radius: 10px;">
                                            <div class="card-header px-4 py-5">
                                                <h5 class="text-muted mb-0">Order ID <span style="color: #a8729a;">${lo.getId()}</span></h5>
                                            </div>
                                            <div class="card-body p-4">
                                                <div class="d-flex justify-content-between align-items-center mb-4">
                                                    <p class="lead fw-normal mb-0" style="color: #a8729a;">Order detail</p>
                                                    <p class="small text-muted mb-0"></p>
                                                </div>
                                                <c:forEach items="${listOrderDetail}" var="lod">
                                                    <c:if test="${lo.getId() eq lod.getOrderId()}">
                                                        <div class="card shadow-0 border mb-4">
                                                            <div class="card-body">
                                                                <!-- Column titles -->
                                                                <div class="row mb-2">
                                                                    <div class="col-md-3 text-center d-flex justify-content-center align-items-center">
                                                                        <p class="fw-bold mb-0">Image</p>
                                                                    </div>
                                                                    <div class="col-md-3 text-center d-flex justify-content-center align-items-center">
                                                                        <p class="fw-bold mb-0">Name</p>
                                                                    </div>
                                                                    <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                                        <p class="fw-bold mb-0">Color</p>
                                                                    </div>
                                                                    <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                                        <p class="fw-bold mb-0">Size</p>
                                                                    </div>
                                                                    <div class="col-md-1 text-center d-flex justify-content-center align-items-center">
                                                                        <p class="fw-bold  mb-0">Qty</p>
                                                                    </div>
                                                                    <div class="col-md-1 text-center d-flex justify-content-center align-items-center">
                                                                        <p class="fw-bold  mb-0">$</p>
                                                                    </div>
                                                                </div>
                                                                <!-- Column data -->
                                                                <div class="row">
                                                                    <div class="col-md-3">
                                                                        <img src="${lod.getImage()}" class="img-fluid" alt="Phone">
                                                                    </div>
                                                                    <div class="col-md-3 text-center d-flex justify-content-center align-items-center">
                                                                        <p class="text-muted mb-0">${lod.getName()}</p>
                                                                    </div>
                                                                    <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                                        <p class="text-muted mb-0 ">${lod.getColor()}</p>
                                                                    </div>
                                                                    <div class="col-md-2 text-center d-flex justify-content-center align-items-center">
                                                                        <p class="text-muted mb-0 ">${lod.getSize()}</p>
                                                                    </div>
                                                                    <div class="col-md-1 text-center d-flex justify-content-center align-items-center">
                                                                        <p class="text-muted mb-0 ">${lod.getQuantity()}</p>
                                                                    </div>
                                                                    <div class="col-md-1 text-center d-flex justify-content-center align-items-center">
                                                                        <p class="text-muted mb-0 ">${lod.getTotalPrice()}</p>
                                                                    </div>
                                                                </div>
                                                                <hr class="mb-4" style="background-color: #e0e0e0; opacity: 1;">
                                                            </div>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>

                                                <div class="d-flex justify-content-between pt-2">
                                                    <p class="fw-bold mb-0">Order Details</p>
                                                    <p class="text-muted mb-0"><span class="fw-bold me-4">Total</span> $${lo.getTotalprice()}</p>
                                                </div>

                                                <div class="d-flex justify-content-between pt-2">
                                                    <p class="text-muted mb-0">Order Id : ${lo.getId()}</p>
                                                    
                                                </div>

                                                <div class="d-flex justify-content-between">
                                                    <p class="text-muted mb-0">Order Date : ${lo.getDate()}</p>
                                                    
                                                </div>

                                                <div class="d-flex justify-content-between mb-5">
                                                    <p class="text-muted mb-0">Address : ${lo.getCustomerAddress()}</p>
                                                    <p class="text-muted mb-0"><span class="fw-bold me-4">Delivery Charges</span> Free</p>
                                                </div>
                                            </div>
                                            <div class="card-footer border-0 px-4 py-5"
                                                 style="background-color: #a8729a; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px;">
                                                <h5 class="d-flex align-items-center justify-content-end text-white text-uppercase mb-0">Total
                                                    paid: <span class="h2 mb-0 ms-2">$${lo.getTotalprice()}</span></h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </div>



        <!-- View Appintment End -->

        <!-- Accept Appointment Start -->
        <div class="modal fade" id="acceptorder${lo.getId()}" tabindex="-1" aria-labelledby="exampleModalLabel${lo.getId()}" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body py-5">
                        <div class="text-center">
                            <div class="icon d-flex align-items-center justify-content-center bg-soft-success rounded-circle mx-auto" style="height: 95px; width:95px;">
                                <i class="uil uil-check-circle h1 mb-0"></i>
                            </div>
                            <div class="mt-4">
                                <h4>Update Status</h4>
                                <p class="para-desc mx-auto text-muted mb-0">This step will update the order's status to next level.</p>
                                <p class="para-desc mx-auto text-muted mb-0">Processing->Accept->Prepared->Delivered to the shipping unit.</p>
                                <div class="mt-4">
                                    <a href="orderstatus?action=active&id=${lo.getId()}&status=${lo.getStatus()}" class="btn btn-soft-success">Accept</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Accept Appointment End -->

        <!-- Cancel Appointment Start -->
        <div class="modal fade" id="cancelorder${lo.getId()}" tabindex="-1" aria-labelledby="exampleModalLabel${lo.getId()}" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body py-5">
                        <div class="text-center">
                            <div class="icon d-flex align-items-center justify-content-center bg-soft-danger rounded-circle mx-auto" style="height: 95px; width:95px;">
                                <i class="uil uil-times-circle h1 mb-0"></i>
                            </div>
                            <div class="mt-4">
                                <h4>Update Status</h4>
                                <p class="para-desc mx-auto text-muted mb-0">This step will update the order's status to previous level.</p>
                                <p class="para-desc mx-auto text-muted mb-0">Processing<-Accept<-Prepared<-Delivered to the shipping unit.</p>
                                <div class="mt-4">
                                    <a href="orderstatus?action=deactive&id=${lo.getId()}&status=${lo.getStatus()}" class="btn btn-soft-danger">Cancel</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="editorder${lo.getId()}" tabindex="-1" aria-labelledby="exampleModalLabel${lo.getId()}" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header border-bottom p-3">
                        <h5 class="modal-title" id="exampleModalLabel">Edit Order</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body p-3 pt-4">
                        <div class="card border-0 p-4 rounded shadow">
                            
                            <form method="post" action="editcustomer?id=${lo.getId()}">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="mb-3">
                                            <label class="form-label">Order Id <span class="text-danger">*</span></label>
                                            <input name="id" id="name${lo.getId()}" type="text" class="form-control" value="${lo.getId()}" readonly="">
                                        </div>
                                    </div><!--end col-->
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Customer Id</label>
                                            <input name="customerId" id="username${lo.getId()}" type="text" class="form-control" value="${lo.getCustomer_id()}">
                                        </div> 
                                    </div>

                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Email <span class="text-danger">*</span></label>
                                            <input name="email" id="email${lo.getId()}" type="email" class="form-control" value="">
                                        </div> 
                                    </div><!--end col-->
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Password</label>
                                            <input name="password" id="password${lo.getId()}" type="text" class="form-control" value="$">
                                        </div>
                                    </div><!--end col-->
                                    <div class=" col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Phone <span class="text-danger">*</span></label>
                                            <input name="phone" id="phone${lo.getId()}" type="tel" class="form-control" value="">
                                        </div> 
                                    </div><!--end col-->

                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <label class="form-label">Address <span class="text-danger">*</span></label>
                                            <input name="address" type="text" class="flatpickr flatpickr-input form-control" value="">
                                        </div>
                                    </div><!--end col-->
                                    <input type="text" name="imageBackUp" hidden="" value="">
                                    <input type="text" name="image" hidden="" value="">


                                    <div class="col-lg-12">
                                        <div class="d-grid">
                                            <button type="submit" class="btn btn-primary">Edit</button>
                                        </div>
                                    </div><!--end col-->
                                </div><!--end row-->
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>                               
    </c:forEach>

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
    <script>
                                    $(document).ready(function () {
                                        $('#userTable').DataTable({
                                            "pageLength": 5,
                                            "lengthChange": false
                                        });
                                    });

    </script>


</body>

</html>