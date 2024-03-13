<%@page import="java.net.URLEncoder"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="Helper.StaticMeThod"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <title>KẾT QUẢ THANH TOÁN</title>
        <!-- Bootstrap core CSS -->
        <link href="/vnpay_jsp/assets/bootstrap.min.css" rel="stylesheet"/>
        <!-- Custom styles for this template -->
        <link href="/vnpay_jsp/assets/jumbotron-narrow.css" rel="stylesheet"> 
        <script src="/vnpay_jsp/assets/jquery-1.11.3.min.js"></script>
    </head>
    <body>


        <div class="container">
            <div class="header clearfix">
                <h3 class="text-muted">KẾT QUẢ THANH TOÁN GIAO DỊCH</h3>
            </div>
            <div class="table-responsive">
                <div class="form-group">
                    <label >Mã giao dịch thanh toán:</label>
                    <label><%=request.getParameter("vnp_TxnRef")%></label>
                </div>    
                <div class="form-group">
                    <label >Số tiền:</label>
                    <label><%=request.getParameter("vnp_Amount")%> VND</label>
                </div>  
                <div class="form-group">
                    <label >Mô tả giao dịch:</label>
                    <label><%=request.getParameter("vnp_OrderInfo")%></label>
                </div> 
                <div class="form-group">
                    <label >Mã lỗi thanh toán:</label>
                    <label><%=request.getParameter("vnp_ResponseCode")%></label>
                </div> 
                <div class="form-group">
                    <label >Mã giao dịch tại CTT VNPAY-QR:</label>
                    <label><%=request.getParameter("vnp_TransactionNo")%></label>
                </div> 
                <div class="form-group">
                    <label >Mã ngân hàng thanh toán:</label>
                    <label><%=request.getParameter("vnp_BankCode")%></label>
                </div> 
                <div class="form-group">
                    <label >Thời gian thanh toán:</label>
                    <label><%=request.getParameter("vnp_PayDate")%></label>
                    <div class="form-group">
                        <label >Tình trạng giao dịch:</label>
                        <label id="trangthai">
                            <%
                                Map fields = new HashMap();
                                for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
                                String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
                                String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
                                if ((fieldValue != null) && (fieldValue.length() > 0)) {
                                    fields.put(fieldName, fieldValue);
                                }
                                }

                                String vnp_SecureHash = request.getParameter("vnp_SecureHash");
                                    if (fields.containsKey("vnp_SecureHashType")) {
                                    fields.remove("vnp_SecureHashType");
                                    }
                                if (fields.containsKey("vnp_SecureHash")) {
                                fields.remove("vnp_SecureHash");
                            }
                                String signValue = StaticMeThod.hashAllFields(fields);
                                if (signValue.equals(vnp_SecureHash)) {
                                
                                    if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
                                        out.print("thanh cong");
                                    } else {
                                       out.print("Không thành công");
                                    }

                                } else {
                                    out.print("invalid signature");
                                
                                }
                            %>
                        </label>

                    </div> 
                </div>
                <p id="thongbao"></p>
                <a href="home">Back to Home</a>
                <div id="countdown"></div>
                <p>
                    &nbsp;
                </p>

                <footer class="footer">
                    <p>&copy; VNPAY 2024</p>
                </footer>
                <p id="vedata"></p>

            </div>

            <script>
//                document.addEventListener("DOMContentLoaded", function () {
//                    var status = document.getElementById("trangthai"); // Sửa từ "trangthai" thành "status"
//                    if (status.innerHTML.trim() === "thanh cong") {

//                        $.ajax({
//                            type: 'POST',
//                            url: '/DomManage_longpdhe_new/thanhtoan',
//                            success: function (data) {
//                              // var x = document.getElementById("vedata");
//                              //  x.innerHTML= data ; 
//                                thongbao.innerHTML = "Thành công. Bạn sẽ được chuyển về trang chu trong 10 giây.";
//                                setTimeout(function () {
//                                    window.location.href = 'Views/Home.jsp'; // Thay thế 'URL/x' bằng URL thực tế bạn muốn chuyển đến
//                                }, 10000); // 10000ms = 10 giây
//
//                                var timeLeft = 10; // Bắt đầu từ 10 giây
//                                var countdown = setInterval(function () {
//                                    timeLeft--;
//                                    document.getElementById('countdown').innerHTML = "Chuyển trang trong " + timeLeft + " giây...";
//                                    if (timeLeft <= 0)
//                                        clearInterval(countdown);
//                                }, 1000); // Cập nhật mỗi giây
//                            },
//                            error: function (xhr, status, error) {
//                                    console.log("Error:", xhr.responseText);
//                                    alert('Đã xảy ra lỗi khi gửi yêu cầu. ' + xhr.responseText);
//                                }
//                        });

                        // Chờ 10 giây trước khi chuyển hướng

                        // 10000 milliseconds = 10 giây





//                    }
//                });
//                setTimeout(function () {
//                    window.location.href = 'SWP391-Project-Zara/home'; // Thay 'home.jsp' bằng đường dẫn của trang chủ
//                }, 10000);
//            </script>
    </body>
</html>
