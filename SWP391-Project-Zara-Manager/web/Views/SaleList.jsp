
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
                                <h5 class="mb-0">Sale List</h5>
<!--                                <nav aria-label="breadcrumb" class="d-inline-block mt-2">
                                    <ul class="breadcrumb breadcrumb-muted bg-transparent rounded mb-0 p-0">
                                        <li class="breadcrumb-item"><a href="index.html">Staff</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Staff List</li>
                                    </ul>
                                </nav>-->
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
                                            </div>
                                           <!--end col-->
                                        </div><!--end row-->
                                    </form> 
                                    <!--end form-->
                                </div>
                            </div><!--end col-->
                        </div><!--end row-->

                        <div class="row">
                            <div class="col-12 mt-4">
                                <div class="">
                                    <table id="userTable" class="table table-striped table-bordered">
                                        <thead>
                                            <tr>
                                                <th class="border-bottom p-3" style="min-width: 50px; ">#</th>
                                                <th class="border-bottom p-3" style="min-width: 120px;">Name</th>
                                                <th class="border-bottom p-3" style="min-width: 120px;">StartDate</th>
                                                <th class="border-bottom p-3" style="min-width: 120px;">EndDate</th>
                                                <th class="border-bottom p-3" style="min-width: 80px;">ProductId</th>
                                                <th class="border-bottom p-3" style="min-width: 120px;">Price Default</th>
                                                <th class="border-bottom p-3" style="min-width: 120px;">Price Sale</th>
                                                <th class="border-bottom p-3" style="min-width: 120px;">Percent</th>
                                                <th class="border-bottom p-3" style="min-width: 150px;"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${prosale}" var="pros" varStatus="loop">
                                            <tr>
                                                <th class="p-3">${loop.index + 1}</th>
                                                <td class="p-3" style="width: 100px">
                                                    <a href="#" class="text-dark">
                                                        <div class="d-flex align-items-center">
                                                            <span class="ms-2">${pros.getName()}</span>
                                                        </div>
                                                    </a>
                                                </td>
                                                <td class="p-3">${pros.startdate}</td>
                                                <td class="p-3">${pros.enddate}</td>                                              
                                                <td class="p-3">${pros.proinforId}</td>
                                                <td class="p-3">${pros.price} $</td> 
                                                <td class="p-3">${pros.pricesale} $</td> 
                                                <td class="p-3">${(pros.percent)}</td> 
                                                <td class="text-end p-3">
                                                    <a href="#" class="btn btn-icon btn-pills btn-soft-primary" data-bs-toggle="modal" data-bs-target="#viewsale${pros.getId()}"><i class="uil uil-eye"></i></a>
                                                    <a href="#" class="btn btn-icon btn-pills btn-soft-danger" data-bs-toggle="modal" data-bs-target="#deletesale${pros.getId()}"><i class="uil uil-times-circle"></i></a>
                                                    <a href="#" class="btn btn-icon btn-pills btn-soft-muted" data-bs-toggle="modal" data-bs-target="#editsale${pros.getId()}"><i class="uil uil-user"></i></a>
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
    
    
    <c:forEach items="${prosale}" var="pros" varStatus="loop">
        <div class="modal fade" id="viewsale${pros.getId()}" tabindex="-1" aria-labelledby="exampleModalLabel${pros.getId()}" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header border-bottom p-3">
                        <h5 class="modal-title" id="exampleModalLabel${pros.getId()}">Sale Detail</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body p-3 pt-4">
                        <div class="d-flex align-items-center">
<!--                            <img src="${ls.getImage()}" class="avatar avatar-small rounded-pill" alt="">-->
                            <h5 class="mb-0 ms-3">${pros.name}</h5>
                        </div>
                        <ul class="list-unstyled mb-0 d-md-flex justify-content-between mt-4">
                            <li>
                                <ul class="list-unstyled mb-0">
                                    <li class="d-flex">
                                        <h6>StartDate: </h6>
                                        <p class="text-muted ms-2">${pros.startdate}</p>
                                    </li>

                                    <li class="d-flex">
                                        <h6>EndDate </h6>
                                        <p class="text-muted ms-2">${pros.enddate}</p>
                                    </li>

                                    <li class="d-flex">
                                        <h6 class="mb-0">ProductInfor Id:</h6>
                                        <p class="text-muted ms-2 mb-0">${pros.proinforId}</p>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <ul class="list-unstyled mb-0">
                                    <li class="d-flex">
                                        <h6>Price Sale: </h6>
                                        <p class="text-muted ms-2">${pros.pricesale} $</p>
                                    </li> 
                                    <li class="d-flex">
                                        <h6>Price Default: </h6>
                                        <p class="text-muted ms-2">${pros.price} $</p>
                                    </li>

                                    <li class="d-flex">
                                        <h6>Percent: </h6>
                                        <p class="text-muted ms-2">${pros.percent*100} %</p>
                                    </li>
                                    <li class="d-flex">
                                        <h6>Image: </h6>
                                        <img src="${pros.image}" alt="Product Image" class="img-fluid ms-2" 
                                             style="height: 200px; width: 150px" />
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
<!--        <div class="modal fade" id="acceptstaff${ls.getId()}" tabindex="-1" aria-labelledby="exampleModalLabel${ls.getId()}" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body py-5">
                        <div class="text-center">
                            <div class="icon d-flex align-items-center justify-content-center bg-soft-success rounded-circle mx-auto" style="height: 95px; width:95px;">
                                <i class="uil uil-check-circle h1 mb-0"></i>
                            </div>
                            <div class="mt-4">
                                <h4>Active staff</h4>
                                <p class="para-desc mx-auto text-muted mb-0">Great doctor if you need your family member to get immediate assistance, emergency treatment.</p>
                                <div class="mt-4">
                                    <a href="status?action=active&id=${ls.getId()}" class="btn btn-soft-success">Active</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>-->
        <!-- Accept Appointment End -->

        <!-- Cancel Appointment Start -->
        <div class="modal fade" id="deletesale${pros.getId()}" tabindex="-1" aria-labelledby="exampleModalLabel${pros.getId()}" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body py-5">
                        <div class="text-center">
                            <div class="icon d-flex align-items-center justify-content-center bg-soft-danger rounded-circle mx-auto" style="height: 95px; width:95px;">
                                <i class="uil uil-times-circle h1 mb-0"></i>
                            </div>
                            <div class="mt-4">
                                <h4>Delete Sale</h4>
                                <p class="para-desc mx-auto text-muted mb-0">Are you sure you want to delete this SaleEvent?</p>
                                <div class="mt-4">
                                    <a href="deleteevent?saleid=${pros.id}" 
                                       class="btn btn-soft-danger">Delete</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<!--        <script>
            function uploadImage${ls.getId()}() {
                var formData = new FormData($('#uploadForm${ls.getId()}')[0]);
                $.ajax({
                    type: 'POST',
                    url: 'uploadimgajax', // Modify to match your servlet mapping
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function (response) {
                        // Display the uploaded image
                        var imgSrc = response ? response : '${ls.getImage()}';
                        $(('#imgAfterUp${ls.getId()}')).attr('src', imgSrc);
                        $('input[name="image"]').attr('value', imgSrc);
                    },
                    error: function (xhr, status, error) {
                        // Handle errors
                        console.error(xhr.responseText);
                    }
                });
            }

        </script>                    -->
        <div class="modal fade" id="editsale${pros.getId()}" tabindex="-1" aria-labelledby="exampleModalLabel${pros.getId()}" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header border-bottom p-3">
                        <h5 class="modal-title" id="exampleModalLabel">Edit Sale</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body p-3 pt-4">
                        <div class="card border-0 p-4 rounded shadow">

                                                                       
                            <form method="post" action="eventedit?id=${pros.getId()}">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="mb-3">
                                            <label class="form-label">Name <span class="text-danger">*</span></label>
                                            <input name="name" id="name${pros.name}" type="text" class="form-control" value="${pros.getName()}">
                                        </div>
                                    </div><!--end col-->
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Start Date</label>
                                            <input name="startdate" id="startdate${pros.startdate}" type="date" class="form-control" value="${pros.startdate}">
                                        </div> 
                                    </div>

                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">End Date<span class="text-danger">*</span></label>
                                            <input name="enddate" id="enddate${pros.enddate}" type="date" class="form-control" value="${pros.enddate}">
                                        </div> 
                                    </div>
                                        <!--end col-->
<!--                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">ProductInfor Id</label>
-->                                            
                                        <input name="proinforid" id="proinforid${pros.proinforId}" type="text" class="form-control" value="${pros.proinforId}" hidden=""><!--
                                        </div>
                                    </div>end col-->
                                    <div class=" col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Percent <span class="text-danger">*</span></label>
                                            <input name="percent" id="percent${pros.percent}" type="tel" class="form-control" value="${pros.percent}">
                                        </div> 
                                    </div>
                          <input name="price" id="percent${pros.price}" type="tel" class="form-control" value="${pros.price}" hidden="">

                                        <!--end col-->
<!--                                    <div class=" col-md-6">
                                        <div class="mb-3">
                                            <label class="form-label">Image <span class="text-danger">*</span></label>
                                            <input name="image" id="image${pros.image}" type="tel" class="form-control" value="${pros.image}">
                                        </div> 
                                    </div>end col-->

<!--                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <label class="form-label">Address <span class="text-danger">*</span></label>
                                            <input name="address" type="text" class="flatpickr flatpickr-input form-control" value="${ls.getAddress()}">
                                        </div>
                                    </div>end col
                                    <input type="text" name="imageBackUp" hidden="" value="${ls.getImage()}">
                                    <input type="text" name="image" hidden="" value="">-->


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
