<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <label>Mã đơn hàng:</label> <span id="ma-don-hang">${order.id}</span><br>
                <label>Tên khách hàng:</label> <span id="ten-khach-hang">${customer.name}</span><br>
                <label>Số điện thoại:</label> <span id="so-dien-thoai">${customer.phoneNumber}</span><br>
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
                                <c:forEach items="products" var="product">
                                    <tr>
                                        <th scope="row">${product.id}</th>
                                        <td>${product.name}</td>
                                        <td>${product.amount}</td>
                                        <td>${product.price}</td>
                                        <td>${product.total}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="tong-tien text-center">
            <label>Tổng tiền:</label><span>${total}</span>
        </div>
        <div class="row">
            <div class="col-md-12">
                <button type="button" class="btn btn-primary">In hóa đơn</button>
            </div>
        </div>
    </div>
</main>

