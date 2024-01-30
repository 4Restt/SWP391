<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delivery Page</title>
    <!-- Thêm thư viện CSS và JavaScript của bạn ở đây -->
</head>
<body>

<h2>Orders for Delivery ${deliveryName}</h2>

<!-- Hiển thị danh sách các orders -->
<c:forEach items="${orders}" var="order">
    <div>
        <h3>Order ID: ${order.id}</h3>
        <p>Customer Address: ${order.customer_id}</p> 
        <p>Total Price: ${order.totalprice}</p>
        <p>Date: ${order.date}</p>
        <p>Status: ${order.status}</p>
         Form để giao order 
        <form action="AssignDeliveryServlet" method="post">
            <input type="hidden" name="orderId" value="${order.id}" />
            <input type="submit" value="Deliver this Order" />
        </form>
    </div>
</c:forEach>

<h2>Available Shippers for Delivery ID: ${deliveryId}</h2>

<!-- Hiển thị danh sách các shipper -->
<c:forEach items="${shippers}" var="shipper">
    <div>
        <p>Shipper ID: ${shipper.id}</p>
        <p>Shipper Name: ${shipper.name}</p>
        <p>Location ID: ${shipper.locationId}</p>
        <p>Phone: ${shipper.phone}</p>
    </div>
</c:forEach>

</body>
</html>
