
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                        <h3>${warn}</h3>
                        <div class="row">
                            <div class="col-12 mt-4">
                                <div class="">
                                    <table id="userTable" class="table table-striped table-bordered">
                                        <thead>
                                            <tr>
                                                <th class="border-bottom p-3" style="min-width: 50px; ">#</th>
                                                <th class="border-bottom p-3" style="min-width: 50px; ">Id</th>
                                                <th class="border-bottom p-3" style="min-width: 180px;">Name</th>
                                                <th class="border-bottom p-3" style="min-width: 150px;">Start Date</th>
                                                <th class="border-bottom p-3" style="min-width: 150px;">End Date</th>
                                                <th class="border-bottom p-3" style="min-width: 150px;">Status</th>
                                                <th class="border-bottom p-3" style="min-width: 150px;"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${sale}" var="ls" varStatus="loop">
                                            <tr>
                                                <th class="p-3">${loop.index + 1}</th>
                                                <td class="p-3">${ls.id}</td>
                                                <td class="p-3">${ls.name}</td>
                                                <td class="p-3">${ls.startdate}</td>
                                                <td class="p-3">${ls.enddate}</td>                                              
                                                <td class="p-3">${ls.status}</td>                                              
                                                <td class="text-end p-3">
                                                    <a href="#" class="btn btn-icon btn-pills btn-soft-primary" data-bs-toggle="modal" data-bs-target="#viewsale${ls.id}"><i class="uil uil-eye"></i></a>
                                                    <a href="#" class="btn btn-icon btn-pills btn-soft-success" data-bs-toggle="modal" data-bs-target="#acceptsale${ls.id}"><i class="uil uil-check-circle"></i></a>                                                                                                        
                                                    
                                                    
                                                    <a href="#" class="btn btn-icon btn-pills btn-soft-danger" data-bs-toggle="modal" data-bs-target="#deletesale${ls.id}"><i class="uil uil-check-circle"></i></a>                                                    
                                                    
                                                    <a href="managerevent?saleid=${ls.id}" class="btn btn-icon btn-pills btn-soft-muted"><i class="uil uil-user"></i></a>
                                                    
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

    <c:forEach items="${sale}" var="ls" varStatus="loop">
        <div class="modal fade" id="viewsale${ls.id}" tabindex="-1" aria-labelledby="exampleModalLabel${ls.id}" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" >
                <div class="modal-content" style="width: 1000px; height: ">
                    <div class="modal-header border-bottom p-3">
                        <h5 class="modal-title" id="exampleModalLabel${ls.name}">Sale Detail</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body p-3 pt-4">
                        <ul class="list-unstyled mb-0 d-md-flex justify-content-between mt-4">
                            <li>
                                <ul class="list-unstyled mb-0">
                                    <li class="d-flex">
                                        <h6>Name: </h6>
                                        <p class="text-muted ms-2">${ls.name}</p>
                                    </li>

                                    <li class="d-flex">
                                        <h6>StartDate: </h6>
                                        <p class="text-muted ms-2">${ls.startdate}</p>
                                    </li>

                                    <li class="d-flex">
                                        <h6 class="mb-0">EndDate:</h6>
                                        <p class="text-muted ms-2 mb-0">${ls.enddate}</p>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                                    <table id="userTable" class="table table-striped table-bordered">
                                        <thead>
                                            <tr>
                                                <th class="border-bottom p-3" style="min-width: 50px;">ProductId</th>
                                                <th class="border-bottom p-3" style="min-width: 80px;">Price Default</th>
                                                <th class="border-bottom p-3" style="min-width: 80px;">Image</th>
                                                <th class="border-bottom p-3" style="min-width: 80px;">Percent</th>
                                                <th class="border-bottom p-3" style="min-width: 80px;">Status</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="pros" items="${prosale}">
                                        <c:if test="${pros.id eq ls.id}">
                                            <tr>
                                                <td class="p-3">${pros.proinforId}</td>
                                                <td class="p-3">${pros.price} $</td> 
                                                <td class="p-3"><img src="${pros.image}" alt="alt" style="width: 30px;height: 50px"/></td>                                       
                                                <td class="p-3"><fmt:formatNumber value="${pros.percent*100}" maxFractionDigits="0"/>%</td>
                                                <td class="p-3">${pros.status} </td> 

                                            </tr>
                                            
                                        </c:if>
                                        </c:forEach>
                                    </tbody>
                                </table>
                    </div>
                </div>
            </div>
        </div>
                                    
                                    
        <div class="modal fade" id="acceptsale${ls.id}" tabindex="-1" aria-labelledby="exampleModalLabel${ls.id}" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body py-5">
                        <div class="text-center">
                            <div class="icon d-flex align-items-center justify-content-center bg-soft-success rounded-circle mx-auto" style="height: 95px; width:95px;">
                                <i class="uil uil-check-circle h1 mb-0"></i>
                            </div>
                            <div class="mt-4">
                                <h4>Active Sale</h4>
                                <p class="para-desc mx-auto text-muted mb-0">Are you sure to activate SaleEvent?</p>
                                <div class="mt-4">
                                    <form action="deleteevent" method="POST">
                                        <input type="hidden" name="saleid" value="${ls.id}" />
                                        <button type="submit" class="btn btn-soft-success">Active Event</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                                
                                
                                
        <div class="modal fade" id="deletesale${ls.id}" tabindex="-1" aria-labelledby="exampleModalLabel${ls.id}" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body py-5">
                        <div class="text-center">
                            <div class="icon d-flex align-items-center justify-content-center bg-soft-success rounded-circle mx-auto" style="height: 95px; width:95px;">
                                <i class="uil uil-check-circle h1 mb-0"></i>
                            </div>
                            <div class="mt-4">
                                <h4>Deactive Sale</h4>
                                <p class="para-desc mx-auto text-muted mb-0">Are you sure you want to Deactive this SaleEvent?</p>
                                <div class="mt-4">
                                    <a href="deleteevent?saleid=${ls.id}&startdate=${ls.startdate}&enddate=${ls.enddate}" 
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
    $(document).ready(function () {
        $('#productForm').on('submit', function(e) {
            e.preventDefault(); // Ngăn không cho form submit theo cách truyền thống

            var selectedProductIds = $('input[name="selectedProducts"]:checked').map(function() {
                return this.value;
            }).get();

            console.log(selectedProductIds); // Hiển thị IDs trên console hoặc xử lý theo yêu cầu

            // Gửi `selectedProductIds` đến servlet qua AJAX
            $.ajax({
                url: 'url_to_servlet', // Thay thế với URL thực tế của Servlet
                type: 'POST',
                data: {selectedProducts: selectedProductIds},
                success: function(response) {
                    // Xử lý khi request thành công
                    console.log('Data sent successfully');
                },
                error: function() {
                    // Xử lý khi có lỗi
                    console.error('Error sending data');
                }
            });
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