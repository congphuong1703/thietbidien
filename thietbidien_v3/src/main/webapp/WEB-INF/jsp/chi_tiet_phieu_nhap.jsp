<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 03-Mar-21
  Time: 9:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<main>
    <div class="container chi-tiet">
        <div class="row">
            <div class="col-md-12 tieu-de">
                <h1>Chi Tiết Phiếu Nhập</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <label>Mã phiếu nhập:</label> <span id="ma-don-hang">${receipt.id}</span><br>
                <label>Thời gian lập:</label> <span id="ten-khach-hang">${receipt.timeCreate}</span><br>
            </div>
            <div class="col-md-6">
                <label>Tên nhà cung cấp:</label> <span id="ma-khach-hang">${supplier.name}</span><br>
                <label>Tên người lập:</label> <span id="so-dien-thoai">${user.name}</span><br>
            </div>
        </div>
        <div class="table-data">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="table-responsive">
                            <table class="table table-striped table-hover table-sm"
                                   cellspacing="0"
                                   width="100%">
                                <thead>
                                <tr>
                                    <th>STT</th>
                                    <th>Mã sản phẩm</th>
                                    <th>Tên sản phẩm</th>
                                    <th>Số lượng</th>
                                    <th>Đơn giá</th>
                                    <th>Thành tiền</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="l" items="${list}" varStatus="stt">
                                    <tr>
                                        <th scope="row">${stt.index}</th>
                                        <td>${l.get('idProduct')}</td>
                                        <td>${l.get('nameProduct')}</td>
                                        <td>${l.get('amount')}</td>
                                        <td>${l.get('price')}</td>
                                        <td>${l.get('cost')}</td>
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
