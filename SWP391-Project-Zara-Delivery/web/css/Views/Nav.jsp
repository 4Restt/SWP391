<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Topbar Start -->
<div class="preloader text-white fs-6 text-uppercase overflow-hidden"></div>

<div class="search-popup">
    <div class="search-popup-container">

        <form action="search" method="post" class="form-group" action="index.html">
            <input type="search" id="search-form"
                   class="form-control border-0 border-bottom"
                   placeholder="Type and press enter" value="${txt}" name="txt"/>
            <button type="submit" class="search-submit border-0 position-absolute bg-white" 
                    style="top: 15px;right: 15px;" ><svg class="search" width="24" height="24">
                <use xlink:href="#search"></use></svg></button>
        </form>

        <h5 class="cat-list-title">Browse Categories</h5>

        <ul class="cat-list">
            <li class="cat-list-item">
                <a href="#" title="Jackets">Jackets</a>
            </li>
            <li class="cat-list-item">
                <a href="#" title="T-shirts">T-shirts</a>
            </li>
            <li class="cat-list-item">
                <a href="#" title="Handbags">Handbags</a>
            </li>
            <li class="cat-list-item">
                <a href="#" title="Accessories">Accessories</a>
            </li>
            <li class="cat-list-item">
                <a href="#" title="Cosmetics">Cosmetics</a>
            </li>
            <li class="cat-list-item">
                <a href="#" title="Dresses">Dresses</a>
            </li>
            <li class="cat-list-item">
                <a href="#" title="Jumpsuits">Jumpsuits</a>
            </li>
        </ul>

    </div>
</div>

<div class="offcanvas offcanvas-end" data-bs-scroll="true" tabindex="-1" id="offcanvasCart" aria-labelledby="My Cart" data-bs-theme="dark">
    <div class="offcanvas-header justify-content-center">
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body">
        <div class="order-md-last">
            <h4 class="d-flex justify-content-between align-items-center mb-3">
                <span class="text-primary">Your cart</span>
                <span class="badge bg-primary rounded-pill">3</span>
            </h4>
            <ul class="list-group mb-3">
                <li class="list-group-item d-flex justify-content-between lh-sm">
                    <div>
                        <h6 class="my-0">Growers cider</h6>
                        <small class="text-body-secondary">Brief description</small>
                    </div>
                    <span class="text-body-secondary">$12</span>
                </li>
                <li class="list-group-item d-flex justify-content-between lh-sm">
                    <div>
                        <h6 class="my-0">Fresh grapes</h6>
                        <small class="text-body-secondary">Brief description</small>
                    </div>
                    <span class="text-body-secondary">$8</span>
                </li>
                <li class="list-group-item d-flex justify-content-between lh-sm">
                    <div>
                        <h6 class="my-0">Heinz tomato ketchup</h6>
                        <small class="text-body-secondary">Brief description</small>
                    </div>
                    <span class="text-body-secondary">$5</span>
                </li>
                <li class="list-group-item d-flex justify-content-between">
                    <span>Total (USD)</span>
                    <strong>$20</strong>
                </li>
            </ul>

            <button class="w-100 btn btn-primary btn-lg" type="submit">Continue to checkout</button>
        </div>
    </div>
</div>

<nav class="navbar navbar-expand-lg navbar-light text-white text-uppercase fs-6 p-3 border-bottom border-light align-items-center fixed-top border-opacity-10">
    <div class="container-fluid">
        <div class="row justify-content-between align-items-center w-100">

            <div class="col-auto">
                <a class="navbar-brand" href="home"><img src="images/light-logo.png" alt="logo"></a>
            </div>

            <div class="col-auto">
                <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
                        aria-controls="offcanvasNavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
                    <div class="offcanvas-header">
                        <h5 class="offcanvas-title" id="offcanvasNavbarLabel">Menu</h5>
                        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                    </div>

                    <div class="offcanvas-body">
                        <ul class="navbar-nav justify-content-end flex-grow-1 gap-1 gap-md-5 pe-3">

                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="dropdownShop" data-bs-toggle="dropdown"
                                   aria-haspopup="true" aria-expanded="false">Shop</a>
                                <ul class="dropdown-menu list-unstyled" aria-labelledby="dropdownShop">
                                    <c:forEach items="${listCategory}" var="lc">
                                        <li>
                                            <a href="category?cid=${lc.getId()}" class="dropdown-item item-anchor">${lc.getName()} </a>
                                        </li>       
                                    </c:forEach>
                                </ul>
                            </li>


                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="dropdownPages" data-bs-toggle="dropdown"
                                   aria-haspopup="true" aria-expanded="false">Pages</a>
                                <ul class="dropdown-menu list-unstyled" aria-labelledby="dropdownPages">
                                    <li>
                                        <a href="about" class="dropdown-item item-anchor">About </a>
                                    </li>
                                    <li>
                                        <a href="cart.html" class="dropdown-item item-anchor">Cart </a>
                                    </li>
                                    <li>
                                        <a href="checkout.html" class="dropdown-item item-anchor">Checkout </a>
                                    </li>
                                    <li>
                                        <a href="coming-soon.html" class="dropdown-item item-anchor">Coming Soon </a>
                                    </li>

                                    <li>
                                        <a href="my-account.html" class="dropdown-item item-anchor">My Account </a>
                                    </li>
                                    <li>
                                        <a href="order-tracking.html" class="dropdown-item item-anchor">Order Tracking </a>
                                    </li>
                                    <li>
                                        <a href="wishlist.html" class="dropdown-item item-anchor">Wishlist </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="blog">Blog</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="contact">Contact</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="faqs">FAQS</a>
                            </li>
                            <c:if test="${sessionScope.account != null}">  
                                <li class="nav-item">
                                    <a class="btn btn-outline-primary rounded-pill" 
                                       href="logout">Log out</a>
                                </li>
                            </c:if>

                            <c:if test="${sessionScope.account == null}">
                                <li class="nav-item">
                                    <a class="btn btn-outline-primary rounded-pill" 
                                       href="login">Login</a>
                                </li>                                
                            </c:if> 
                            <c:if test="${sessionScope.account == null}">
                                <li class="nav-item">
                                    <a class="btn btn-outline-primary rounded-pill" 
                                       href="signup">Sign Up</a>
                                </li>                                
                            </c:if>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="col-3 col-lg-auto">
                <ul class="list-unstyled d-flex m-0">
                    <li class="d-none d-lg-block">
                        <a href="wishlist.html" class="text-uppercase mx-3">Wishlist <span class="wishlist-count">(0)</span>
                        </a>
                    </li>
                    <li class="d-none d-lg-block">
                        <a href="cart" class="text-uppercase mx-3" data-bs-toggle="offcanvas" data-bs-target="#offcanvasCart" aria-controls="offcanvasCart">Cart <span class="cart-count">(${totalQ})</span>
                        </a>
                    </li>
                    <li class="d-lg-none">
                        <a href="#" class="mx-2">
                            <svg width="24" height="24" viewBox="0 0 24 24"><use xlink:href="#heart"></use></svg>
                        </a>
                    </li>
                    <li class="d-lg-none">
                        <a href="#" class="mx-2" data-bs-toggle="offcanvas" data-bs-target="#offcanvasCart" aria-controls="offcanvasCart">
                            <svg width="24" height="24" viewBox="0 0 24 24"><use xlink:href="#cart"></use></svg>
                        </a>
                    </li>
                    <li class="search-box mx-2">
                        <a href="#search" class="search-button">
                            <svg width="24" height="24" viewBox="0 0 24 24"><use xlink:href="#search"></use></svg>
                        </a>
                    </li>
                </ul>
            </div>

        </div>

    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script>
                function search() {
                    $.ajax({
                        url: "/SWP391-Project-Zara/searchtest",
                        type: "get",
                        success: function (response) {
                        },
                        error: function () {
                            alert("error");
                        }
                    });

                }
    </script>
</nav>
<!-- Navbar End -->
