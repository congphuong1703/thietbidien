<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 02-Feb-21
  Time: 10:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<main>
    <div class="container chi-tiet">
        <div class="row">
            <div class="col-md-12 tieu-de">
                <h1>Chi Tiết Đơn Hàng</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <label>Mã đơn hàng:</label> <span id="ma-don-hang">3</span><br>
                <label>Tên khách hàng:</label> <span id="ten-khach-hang">Hà Thị Lương Hoài</span><br>
                <label>Số điện thoại:</label> <span id="so-dien-thoai">3</span><br>
            </div>
            <div class="col-md-6">
                <label>Mã khách hàng:</label> <span id="ma-khach-hang">1</span><br>
                <label>Email:</label> <span id="email">hoai391998@gmail.com</span><br>
                <label>Địa chỉ:</label> <span id="dia-chi">Kim Đồng - Hoàng Mai - Hà Nội</span><br>
            </div>
        </div>
        <div class="table-data">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="table-reponsive">
                            <table class="table table-hover table-bordered">
                                <thead>
                                <tr>
                                    <th scope="col">Mã sản phẩm</th>
                                    <th scope="col">Tên sản phẩm</th>
                                    <th scope="col">Số lượng</th>
                                    <th scope="col">Đơn giá</th>
                                    <th scope="col">Thành tiền</th>
                                </tr>
                                </thead>
                                <tbody id="tbody-san-pham">
                                <tr>
                                    <th scope="row">1</th>
                                    <td>88</td>
                                    <td>Dây điện Cadivi</td>
                                    <td>5</td>
                                    <td>50.000</td>
                                    <td>250.000</td>
                                </tr>
                                <tr>
                                    <th scope="row">2</th>
                                    <td>89</td>
                                    <td>Dây điện Sino</td>
                                    <td>5</td>
                                    <td>50.000</td>
                                    <td>250.000</td>
                                </tr>
                                <tr>
                                    <th scope="row">3</th>
                                    <td>99</td>
                                    <td>Dây điện Vinacap</td>
                                    <td>5</td>
                                    <td>50.000</td>
                                    <td>250.000</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="tong-tien text-center">
            <label>Tổng tiền:</label><span>2000000</span>
        </div>
        <div class="row">
            <div class="col-md-12">
                <button type="button" class="btn btn-primary">In hóa đơn</button>
            </div>
        </div>
    </div>
</main>
<script src="admin/ajax/chi-tiet-don-hang.js"></script>

