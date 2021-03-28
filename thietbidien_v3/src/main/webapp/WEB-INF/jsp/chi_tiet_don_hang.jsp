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
                        <div class="table-responsive">
                            <table id="dtHorizontalVerticalExample" class="table table-striped table-hover table-sm"
                                   cellspacing="0"
                                   width="100%">
                                <thead>
                                <tr>
                                   <th>Mã sản phẩm</th>
                                   <th>Tên sản phẩm</th>
                                   <th>Số lượng</th>
                                   <th>Đơn giá</th>
                                   <th>Thành tiền</th>
                                </tr>
                                </thead>
                                <tbody id="tbody-san-pham">
                                <c:forEach items="${products}" var="product">
                                    <tr>
                                        <td value="${product.id}" id="${product.id}">${product.id}</td>
                                        <td value="${product.name}">${product.name}</td>
                                        <td value="${product.amount}">${product.amount}</td>
                                        <td value="${product.price}">${product.price}</td>
                                        <td value="${product.total}">${product.total}</td>
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

