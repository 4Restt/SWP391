
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
        <!-- SLIDER -->
        <link href="css/tiny-slider.css" rel="stylesheet" />
        <!-- Icons -->
        <link href="css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
        <link href="css/remixicon.css" rel="stylesheet" type="text/css" />
        <link href="https://unicons.iconscout.com/release/v3.0.6/css/line.css"  rel="stylesheet">
        <!-- Css -->
        <link href="css/style.min.css" rel="stylesheet" type="text/css" id="theme-opt" />

    </head>

    <body>
        <jsp:include page="Sidebar.jsp"></jsp:include>
            <!-- sidebar-wrapper  -->

            <!-- Start Page Content -->
            <main class="page-content bg-light">

                <!-- header -->
            <jsp:include page="HeaderManager.jsp"></jsp:include>
                <!-- end header -->
                <div class="container-fluid">
                    <div class="layout-specing">
                        <div class="d-md-flex justify-content-between">
                            <h5 class="mb-0">Your Profile</h5>

                            <nav aria-label="breadcrumb" class="d-inline-block mt-4 mt-sm-0">
                                <ul class="breadcrumb bg-transparent rounded mb-0 p-0">
                                    
                                    <li class="breadcrumb-item active" aria-current="page">Profile</li>
                                </ul>
                            </nav>
                        </div>

                        <div class="card bg-white rounded shadow overflow-hidden mt-4 border-0">
                            <div class="p-5 bg-primary bg-gradient"></div>
                            <div class="avatar-profile d-flex margin-nagative mt-n5 position-relative ps-3">
                                <img id ="imgAfterUp2" src="${profile.getImage()}" class="rounded-circle shadow-md avatar avatar-medium" alt="">
                            <div class="mt-4 ms-3 pt-3">
                                <h5 class="mt-3 mb-1">${profile.getName()}</h5>
                                <c:choose>
                                    <c:when test="${profile.getRollId() == 1}">
                                        <p class="text-muted mb-0">Admin</p>
                                    </c:when>
                                    <c:when test="${profile.getRollId() == 2}">
                                        <p class="text-muted mb-0">Staff</p>
                                    </c:when>
                                    <c:when test="${profile.getRollId() == 3}">
                                        <p class="text-muted mb-0">Manager</p>
                                    </c:when>
                                    <c:otherwise>

                                        <p class="text-muted mb-0">Unknown</p>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12 mt-4">
                                <div class="card border-0 rounded-0 p-4">
                                    <ul class="nav nav-pills nav-justified flex-column flex-sm-row rounded shadow overflow-hidden bg-light" id="pills-tab" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link rounded-0 active" id="settings-tab" data-bs-toggle="pill" href="#pills-settings" role="tab" aria-controls="pills-settings" aria-selected="false">
                                                <div class="text-center pt-1 pb-1">
                                                    <h4 class="title fw-normal mb-0">Profile</h4>
                                                </div>
                                            </a><!--end nav link-->
                                        </li><!--end nav item-->



                                    </ul><!--end nav pills-->
                                    <div class="tab-content mt-2" id="pills-tabContent">
                                        <div class="tab-pane fade show active" id="pills-settings" role="tabpanel" aria-labelledby="settings-tab">
                                            <h5 class="mb-1">Profile</h5>
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <div class="rounded shadow mt-4">
                                                        <div class="p-4 border-bottom">
                                                            <h6 class="mb-0">Personal Information</h6>
                                                            ${messChange}
                                                        </div>

                                                        <div class="p-4">
                                                            <div class="row align-items-center">
                                                                <div class="row align-items-center">
                                                                    <div class="col-lg-2 col-md-4">
                                                                        <img id ="imgAfterUp" src="${(profile.getImage().isEmpty()) ?  'images/profile-image-default.jpg' :  profile.getImage()}"
                                                                             class="avatar avatar-md-md rounded-pill shadow mx-auto d-block avatar-img" alt="">
                                                                    </div><!--end col-->

                                                                    <div class="col-lg-5 col-md-8 text-center text-md-start mt-4 mt-sm-0">
                                                                        <h5 class="">Upload your picture</h5>
                                                                        <p class="text-muted mb-0">For best results, use an image at least 600px by 600px in either .jpg or .png format</p>
                                                                    </div><!--end col-->
                                                                </div><!--end row-->
                                                                <form id="uploadForm" enctype="multipart/form-data">
                                                                    <div class="col-lg-6 col-md-12 text-lg-end text-center mt-4 mt-lg-0">
                                                                        <input type="file" class="form-control" name="image" id="imageUploadInput" required>
                                                                        <input type="text" name="imageBackUp" hidden="" value="${profile.getImage()}">

                                                                        
                                                                        
                                                                        <input type="button" class="btn btn-primary" value="Upload" onclick="uploadImage()" >
                                                                        <a href="#" class="btn btn-soft-primary ms-2" id="removeButton">Remove</a>
                                                                    </div><!--end col-->
                                                                </form>

                                                                <div id="status"></div>

                                                                <form class="mt-4" action="profile?action=change" method="post">

                                                                    <div class="row">

                                                                        <div class="col-md-6">
                                                                            <div class="mb-3">
                                                                                <label class="form-label"> Name</label>
                                                                                <input name="name" id="name" type="text" class="form-control" value="${profile.getName()}" required>
                                                                            </div>
                                                                        </div><!--end col-->


                                                                        <div class="col-md-6">
                                                                            <div class="mb-3">
                                                                                <label class="form-label">Username</label>
                                                                                <input name="username" id="username" type="text" class="form-control" value="${profile.getAccount()}" required readonly>
                                                                            </div> 
                                                                        </div><!--end col-->

                                                                        
                                                                                <input name="password" id="password" type="password" class="form-control" value="${profile.getPassword()}" hidden>
                                                                        
                                                                                <input name="id" type="text" class="form-control" value="${profile.getId()}" hidden>
                                                                        <div class="col-md-6">
                                                                            <div class="mb-3">
                                                                                <label class="form-label">Your Email</label>
                                                                                <input name="email" id="email" type="email" class="form-control" value="${profile.getEmail()}" required>
                                                                            </div> 
                                                                        </div><!--end col-->

                                                                        <div class="col-md-6">
                                                                            <div class="mb-3">
                                                                                <label class="form-label">Phone no.</label>
                                                                                <input name="phone" id="number" type="text" class="form-control" value="${profile.getPhone()}" required>
                                                                            </div>                                                                               
                                                                        </div>
                                                                        <div class="col-md-12">
                                                                            <div class="mb-3">
                                                                                <label class="form-label">Address</label>
                                                                                <textarea name="address" id="address" rows="3" class="form-control" required>${profile.getAddress()}</textarea>
                                                                            </div>
                                                                        </div>
                                                                    </div><!--end row-->
                                                                    <input type="text" name="imageBackUp" hidden="" value="${profile.getImage()}">
                                                                    <input type="text" name="image" hidden="" value="">
                                                                    <button type="submit" class="btn btn-primary">Change Profile</button>
                                                                </form>
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div><!--end col-->
                                                    <div class="col-lg-6">

                                                        <div class="rounded shadow mt-4">
                                                            <div class="p-4 border-bottom">
                                                                <h6 class="mb-0">Account</h6>
                                                                ${mess}
                                                            </div>

                                                            <div class="p-4">
                                                                <form action="profile?action=changepass" method="post">
                                                                    <div class="row">
                                                                        <div class="col-lg-12">
                                                                            <div class="mb-3">
                                                                                <label class="form-label">Old password :</label>
                                                                                <input type="password" name="oldPassword" class="form-control" placeholder="Old password" required="">
                                                                            </div>
                                                                        </div><!--end col-->

                                                                        <div class="col-lg-12">
                                                                            <div class="mb-3">
                                                                                <label class="form-label">New password :</label>
                                                                                <input type="password" name="newPassword" class="form-control" placeholder="New password" required="">
                                                                            </div>
                                                                        </div><!--end col-->

                                                                        <div class="col-lg-12">
                                                                            <div class="mb-3">
                                                                                <label class="form-label">Re-type New password :</label>
                                                                                <input type="password" name="rePassword" class="form-control" placeholder="Re-type New password" required="">
                                                                            </div>
                                                                        </div><!--end col-->

                                                                        <div class="col-lg-12 mt-2 mb-0">
                                                                            
                                                                                <input type="text" name="id" class="form-control" value="${profile.getId()}"  hidden="" required="">
                                                                                <button type="submit" class="btn btn-danger">Save password</button>
                                                                            
                                                                        </div><!--end col-->
                                                                    </div><!--end row-->
                                                                </form>
                                                            </div>
                                                        </div>
                                                        


                                                        <div class="rounded shadow mt-4">
                                                            <div class="p-4 border-bottom">
                                                                <h6 class="mb-0">Delete Account</h6>
                                                            </div>

                                                            <div class="p-4">
                                                                <div class="p-4 border-bottom">
                                                                    <h5 class="mb-0 text-danger">Delete Account :</h5>
                                                                </div>

                                                                <div class="p-4">
                                                                    <h6 class="mb-0 fw-normal">Do you want to delete the account? Please press below "Delete" button</h6>
                                                                    <div class="mt-4">
                                                                        <form action="profile?action=delete&deleteid=${profile.getId()}" method="post">
                                                                            <button type="submit" class="btn btn-danger">Delete Account</button>
                                                                        </form>
                                                                        
                                                                    </div><!--end col-->
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div><!--end col-->
                                                
                                                </div><!--end row-->
                                            </div><!--end teb pane-->
                                        </div><!--end tab content-->
                                    </div>
                                </div><!--end col-->
                            </div><!--end row-->
                        </div>
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

    <!-- javascript -->
    <script src="js/bootstrap.bundle.min.js"></script>
    <!-- simplebar -->
    <script src="js/simplebar.min.js"></script>
    <!-- SLIDER -->
    <script src="js/tiny-slider.js"></script>
    <script src="js/tiny-slider-init.js"></script>
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
                                                var imgSrc =  response ? response : 'images/profile-image-default.jpg';
                                                $('#imgAfterUp').attr('src', imgSrc);
                                                $('input[name="image"]').attr('value', imgSrc);
                                            },
                                            error: function (xhr, status, error) {
                                                // Handle errors
                                                console.error(xhr.responseText);
                                            }
                                        });
                                    }

    </script>
</body>

</html>
