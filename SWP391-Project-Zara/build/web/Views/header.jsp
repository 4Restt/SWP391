<%-- 
    Document   : header
    Created on : Feb 28, 2024, 3:56:53 PM
    Author     : dev
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
    /* Main Color */
    :root {
        --main-color: #ff9843;
    }
</style>

<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: var(--main-color);">
    <div class="container">
        <a class="navbar-brand" href="home">🏨</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="dropdown show text-light">
            <a class="text-light text-decoration-none dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                System Management
            </a>

            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                <a class="dropdown-item" href="user">User Management</a>
                <a class="dropdown-item" href="room">... Management</a>
                <a class="dropdown-item" href="service">... Management</a>
            </div>
        </div>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">

                <c:if test="${not empty sessionScope.account}">
                    <li class="nav-item active">
                        <a class="nav-link" href="viewprofile">Profile/</a> 
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="logout">Logout</a>
                    </li>

                </c:if>
                <c:if test="${empty sessionScope.account}">
                    <li class="nav-item active">
                        <a class="nav-link" href="login">Login</a>
                    </li>
                </c:if>


            </ul>
        </div>
    </div>
</nav>
