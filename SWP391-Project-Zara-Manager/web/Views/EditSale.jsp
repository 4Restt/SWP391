<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<!--                            <div class="col-xl-9 col-lg-6 col-md-4">
                                <h5 class="mb-0">Staff List</h5>
                                <nav aria-label="breadcrumb" class="d-inline-block mt-2">
                                    <ul class="breadcrumb breadcrumb-muted bg-transparent rounded mb-0 p-0">
                                        <li class="breadcrumb-item"><a href="#">Sale</a></li>
                                        <li class="breadcrumb-item active" aria-current="#">Sale List</li>
                                    </ul>
                                </nav>
                            </div>end col-->

                            <div class="col-xl-3 col-lg-6 col-md-8 mt-4 mt-md-0">
                                <div class="justify-content-md-end">
<!--                                    <form>
                                        <div class="row justify-content-between align-items-center">
                                            <div class="col-sm-12 col-md-5">
                                                <div class="mb-0 position-relative">
                                                    <select class="form-control time-during select2input" hidden>
                                                        <option value="EY">Today</option>
                                                        <option value="GY">Tomorrow</option>
                                                        <option value="PS">Yesterday</option>
                                                    </select>
                                                </div>
                                            </div>end col

                                            <div class="col-sm-12 col-md-7 mt-4 mt-sm-0">
                                                <div class="d-grid">
                                                    <a href="#" class="btn btn-primary">Add Staff</a>
                                                </div>
                                            </div>end col
                                        </div>end row
                                    </form>end form-->
                                </div>
                            </div><!--end col-->
                        </div><!--end row-->
                        <h1>${warn}</h1>
                        <div class="row">
                            <h3>Products are in SaleEvent</h3>
                            <div class="col-12 mt-4">
                                <div class="">
                                    <table id="userTable" class="table table-striped table-bordered">
                                        <thead>
                                            <tr>
                                                <input name="saleid" value="${saleid}" hidden="">
                                                <th class="border-bottom p-3" style="min-width: 100px; ">#</th>
                                                <th class="border-bottom p-3" style="min-width: 100px; ">Id</th>
                                                <th class="border-bottom p-3" style="min-width: 100px;">Price Default</th>
                                                <th class="border-bottom p-3" style="min-width: 100px;">Price Sale</th>
                                                <th class="border-bottom p-3" style="min-width: 100px;">Image</th>
                                                <th class="border-bottom p-3" style="min-width: 100px;">Status</th>
                                                <th class="border-bottom p-3" style="min-width: 100px;"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${productsale}" var="ls" varStatus="loop">
                                            <tr>
                                                <th class="p-3">${loop.index + 1}</th>
                                                <td class="p-3">${ls.proinforId}</td>
                                                <td class="p-3">${ls.price}</td>                                             
                                                <td class="p-3">${ls.pricesale}</td>                                             
                                                <td class="p-3"><img src="${ls.image}" alt="alt" style="width: 100px; height: 150px"/></td>                                              
                                                <td class="p-3">${ls.status}</td>                                                                                            
                                                <td class="text-end p-3">
                                                    <a href="#" class="btn btn-icon btn-pills btn-soft-success" data-bs-toggle="modal" data-bs-target="#acceptsale${ls.proinforId}"><i class="uil uil-check-circle"></i></a>                                                                                                         
                                                    <a href="#" class="btn btn-icon btn-pills btn-soft-danger" data-bs-toggle="modal" data-bs-target="#deletesale${ls.proinforId}"><i class="uil uil-check-circle"></i></a>                                                    
                                                </td>
                                            </tr>
                                        </c:forEach>    

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div><!--end row-->
                    <br>
                    <br>
                    <br>
                    
                    <form action="deleteproductsale" method="post">                        
                        <div class="row">
                            
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Name of Event</label>
                                                <input value="${sl.name}" required="" name="name" id="nameevent" type="text" class="form-control" placeholder="Name of Event :">
                                            </div>
                                        </div><!--end col-->

                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Start Date</label>
                                                <input value="${sl.startdate}" required="" name="startdate" id="startdate" type="date" class="form-control" placeholder="Start Date :">
                                            </div>
                                        </div><!--end col-->

                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">End Date</label>
                                                <input value="${sl.enddate}" required="" name="enddate" id="enddate" type="date" class="form-control" placeholder="End Date :">
                                            </div> 
                                        </div><!--end col-->

                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label class="form-label">Percent</label>
                                                
                                                <input value="<fmt:formatNumber value="${sl.percent*100}" maxFractionDigits="0"/>%" name="percent1" id="percent" type="text" class="form-control" 
                                                placeholder="Percent :" required="" pattern="^100(\.0{1,2})?%$|^\d{1,2}(\.0{1,2})?%$"
                                   title="Sales percentage must be greater than 0% and less than 100%"
                                   oninvalid="setCustomValidity('Sales percentage must be greater than 0% and less than 100%')"
                                   oninput="setCustomValidity('')">
                                                
                                                
                                            </div> 
                                        </div><!--end col-->                                                                              
                            <div class="col-12 mt-4">
                                <div class="">
                                    <table id="userTable" class="table table-striped table-bordered">
                                        <thead>
                                            <tr>
                                                <th class="border-bottom p-3" style="min-width: 120px; ">#</th>
                                                <th class="border-bottom p-3" style="min-width: 120px; ">Select</th>
                                                <th class="border-bottom p-3" style="min-width: 120px; ">Id</th>
                                                <th class="border-bottom p-3" style="min-width: 120px;">Price</th>
                                                <th class="border-bottom p-3" style="min-width: 120px;">Image</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${product}" var="pro" varStatus="loop">
                                            <c:set var="found" value="false" />
                                            <c:forEach items="${productsale}" var="sa">
                                                <c:if test="${pro.productInfoId eq sa.proinforId}">
                                                    <c:set var="found" value="true" />
                                                </c:if>
                                            </c:forEach>
                                            <c:if test="${!found}">
                                                <tr>
                                                    <th class="p-3">${loop.index + 1}</th>
                                                    <td>
                                                        <input type="checkbox" name="selectedProducts" value="${pro.productInfoId}"/>
                                                    </td>
                                                    <td class="p-3">${pro.productInfoId}</td>
                                                    <td class="p-3">${pro.price}</td>                                             
                                                    <td class="p-3"><img src="${pro.imgDefault}" alt="alt" style="width: 100px; height: 150px"/></td>                                              
                                                </tr>
                                            </c:if>                                               
                                        </c:forEach>  
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                        <input type="submit" value="Update Sale">
                        <input type="text" value="${sl.proinforId}" name="proinforid" hidden="">
                        <input type="text" value="${saleid}" name="saleid" hidden="">
                        <input type="text" value="${sl.price}" name="price" hidden="">
                </form>
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

    
    
    <c:forEach items="${productsale}" var="ls" varStatus="loop">
        <div class="modal fade" id="deletesale${ls.proinforId}" tabindex="-1" aria-labelledby="exampleModalLabel${ls.proinforId}" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body py-5">
                        <div class="text-center">
                            <div class="icon d-flex align-items-center justify-content-center bg-soft-success rounded-circle mx-auto" style="height: 95px; width:95px;">
                                <i class="uil uil-check-circle h1 mb-0"></i>
                            </div>
                            <div class="mt-4">
                                <h4>Deactive Product From SaleEvent</h4>
                                <p class="para-desc mx-auto text-muted mb-0">Are you sure you want to Deactive Product From SaleEvent?</p>
                                <div class="mt-4">
                                    <a href="deleteproductsale?proid=${ls.proinforId}&saleid=${saleid}&pricedefault=${ls.price}" 
                                       class="btn btn-soft-danger">Deactive</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                                       
        <div class="modal fade" id="acceptsale${ls.proinforId}" tabindex="-1" aria-labelledby="exampleModalLabel${ls.id}" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body py-5">
                        <div class="text-center">
                            <div class="icon d-flex align-items-center justify-content-center bg-soft-success rounded-circle mx-auto" style="height: 95px; width:95px;">
                                <i class="uil uil-check-circle h1 mb-0"></i>
                            </div>
                            <div class="mt-4">
                                <h4>Active Sale</h4>
                                <p class="para-desc mx-auto text-muted mb-0">Are you sure to Active Product From SaleEvent?</p>
                                <div class="mt-4">
                                    <a href="activeproduct?proid=${ls.proinforId}&saleid=${saleid}&pricedefault=${ls.price}
                                       &startdate=${ls.startdate}&enddate=${ls.enddate}&percent=${ls.percent}" 
                                       class="btn btn-soft-danger">Deactive</a>
                                </div>
                            </div>
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
                                                "pageLength": 2,
                                                "lengthChange": false
                                            });
                                        });
    </script>        
    
    <script>
        function changeStatus(btn, status, id) {
            $.ajax({
                url: 'status',
                type: 'GET',
                data: {
                    id: id,
                    action: status
                },
                success: function (response) {
                    // Update status cell content and classes
                    var statusCell = $('#status_' + id);
                    statusCell.text(response);
                    statusCell.removeClass('text-success text-danger');
                    if (response === 'Activated') {
                        statusCell.addClass('text-success');
                    } else {
                        statusCell.addClass('text-danger');
                    }

                    // Close the modal
                    $(btn).closest('.modal').modal('hide');
                },
                error: function (xhr, status, error) {
                    console.log('Error:', error);
                }
            });
        }
    </script>






</body>

</html>