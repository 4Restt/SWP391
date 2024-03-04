<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Tạo mới đơn hàng</title>
        <!-- Bootstrap core CSS -->
        <link href="/vnpay_jsp/assets/bootstrap.min.css" rel="stylesheet"/>
        <!-- Custom styles for this template -->    
        <script src="/vnpay_jsp/assets/jquery-1.11.3.min.js"></script>
        <link href="/vnpay_jsp/assets/jumbotron-narrow.css" rel="stylesheet">  
    </head>

    <body>

        <div class="container">
            <div class="header clearfix">

                <h3 class="text-muted">Thanh Toán Online Kí Túc Xá DMS</h3>
            </div>

            <div class="table-responsive">
<!--               method =  post-->
                <form action="pay" id="frmCreateOrder" method="get">   

<!--                    <div class="form-group">
                        <label for="dob1">Ngày đăng kí ở</label>
                        <input
                            class="form-control"
                            data-val="true"
                            id="dob1"
                            name="startdate"
                            type="date"
                            required
                            />
                    </div>
                    <div class="form-group">
                        <label for="number-month"
                               >Số tháng đăng kí ở(*Lưu ý khoảng thời gian ở tối thiểu là 4
                            tháng)</label
                        >
                        <input
                            class="form-control"
                            id="number-month"
                            name="number-month"
                            type="number"
                            value=""
                            required
                            />
                    </div>

                    <div class="form-group">
                        <label for="dob2">Ngày kết thúc</label>
                        <input
                            class="form-control"
                            data-val="true"
                            id="dob2"
                            name="enddate"
                            type="date"
                            readonly
                            />
                    </div>-->
                    <div class="form-group">
                        <label for="amount">Số tiền phải đóng</label>
                        <input
                            class="form-control"
                            data-val="true"
                            id="amount"
                            name="amount"
                            type="number"
                            value="1000"
                            
                            />
                    </div>
<!--                    <div class="form-group">
                        <label for="checkindate">Ngày đến checkin phòng</label>
                        <input
                            class="form-control"
                            data-val="true"
                            id="checkindate"
                            name="checkindate"
                            type="date"
                            required
                            />
                    </div>-->

                    <h4>Chọn phương thức thanh toán</h4>
                    <div class="form-group">
                        <h5>Cách 1: Chuyển hướng sang Cổng VNPAY chọn phương thức thanh toán</h5>
                        <input type="radio" Checked="True" id="bankCode" name="bankCode" value="">
                        <label for="bankCode">Cổng thanh toán VNPAYQR</label><br>

                        <h5>Cách 2: Tách phương thức tại site của đơn vị kết nối</h5>
                        <input type="radio" id="bankCode" name="bankCode" value="VNPAYQR">
                        <label for="bankCode">Thanh toán bằng ứng dụng hỗ trợ VNPAYQR</label><br>

                        <input type="radio" id="bankCode" name="bankCode" value="VNBANK">
                        <label for="bankCode">Thanh toán qua thẻ ATM/Tài khoản nội địa</label><br>

                        <input type="radio" id="bankCode" name="bankCode" value="INTCARD">
                        <label for="bankCode">Thanh toán qua thẻ quốc tế</label><br>

                    </div>
                    <div class="form-group">
                        <h5>Chọn ngôn ngữ giao diện thanh toán:</h5>
                        <input type="radio" id="language" Checked="True" name="language" value="vn">
                        <label for="language">Tiếng việt</label><br>
                        <input type="radio" id="language" name="language" value="en">
                        <label for="language">Tiếng anh</label><br>

                    </div>
                    <button type="submit" class="btn btn-default" >Thanh toán</button>
                </form>
            </div>
            <p>

            </p>

        </div>
        <script>
//            document.addEventListener("DOMContentLoaded", function () {
//                var today = new Date().toISOString().split("T")[0];
//                document.getElementById("dob1").setAttribute("min", today);
//                document
//                        .getElementById("number-month")
//                        .addEventListener("input", function () {
//                            var numberMonth = parseInt(this.value, 10);
//                            $.ajax({
//                                type: 'GET',
//                                url: '/DomManage_longpdhe_new/pay',
//                                data: {NumberMonth: this.value},
//                                success: function (data) {
//                                    var amount = document.getElementById("amount");
//                                    amount.value = data;
//                                    var startdate = new Date(document.getElementById("dob1").value);
//                                    startdate.setMonth(startdate.getMonth() + numberMonth);
//                                    var enddate = startdate.toISOString().split("T")[0];
//                                    document.getElementById("dob2").value = enddate;
//                                    console.log("Success response:", data);
//                                },
//                                error: function (xhr, status, error) {
//                                    console.log("Error:", xhr.responseText);
//                                    alert('Đã xảy ra lỗi khi gửi yêu cầu. ' + xhr.responseText);
//                                }
//                            });
//
//
//
//                        });
//                document
//                        .getElementById("number-month")
//                        .addEventListener("change", function () {
//                            if (this.value < 4) {
//                                alert("Số tháng ở tối thiểu là 4 tháng");
//                                document.getElementById("dob2").value = "";
//                                document.getElementById("amount").value = "";
//                                this.value = "";
//
//                            }
//                        });
//            });


        </script>


    </body>
</html>