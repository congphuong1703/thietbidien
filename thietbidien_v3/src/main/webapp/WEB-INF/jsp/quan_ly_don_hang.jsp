<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 01-Feb-21
  Time: 3:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<main>
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <form:form modelAttribute="orderModel" action="/order/add" method="get">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Đơn hàng</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body form-custom">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>ID</label>
                                    <form:input path="id" id="id" readonly="true" type="text"
                                                class="form-control"
                                                placeholder="ID"/>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Ghi chú</label>
                                    <form:textarea path="note" id="note" type="text" class="form-control"
                                                   placeholder="Ghi chú"/>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Người lập đơn</label>
                                    <form:select path="idUser" id="idUser" class="form-control" require="true">
                                        <option id="-1" selected value disabled></option>
                                        <c:forEach items="${users}" var="user">
                                            <form:option data-id="${user.id}"
                                                         value="${user.id}">${user.id} | ${user.name}</form:option>
                                        </c:forEach>
                                    </form:select>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Khách hàng</label>
                                    <form:select path="idCustomer" id="idCustomer" class="form-control" require="true">
                                        <option id="-1" selected value disabled></option>
                                        <c:forEach items="${customers}" var="customer">
                                            <form:option data-id="${customer.id}"
                                                         value="${customer.id}">${customer.id} | ${customer.name}</form:option>
                                        </c:forEach>
                                    </form:select>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Trạng thái đơn hàng</label>
                                    <form:select path="orderStatus" id="orderStatus" class="form-control" require="true">
                                        <option id="-1" selected value disabled></option>
                                        <c:forEach items="${orderStatuses}" var="orderStatus">
                                            <form:option data-id="${orderStatus.id}"
                                                         value="${orderStatus.id}">${orderStatus.id} | ${orderStatus.name}</form:option>
                                        </c:forEach>
                                    </form:select>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-check" id="statusPaments">
                                    <label>Đã thanh toán</label>
                                    <form:radiobutton path="statusPaments" name="statusPaments" value="false" checked="true"/> <br>
                                    <label>Chưa thanh toán</label>
                                    <form:radiobutton path="statusPaments" name="statusPaments" value="true"/>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-check" id="payments">
                                    <label>Chuyển khoản</label>
                                    <form:radiobutton path="status" name="status" value="false" checked="true"/> <br>
                                    <label>Thanh toán sau khi nhận hàng</label>
                                    <form:radiobutton path="status" name="status" value="true"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                        <button type="submit" class="btn btn-default">Lưu</button>

                    </div>
                </form:form>
            </div>
        </div>
    </div>
    <div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel1">Xác nhận thao tác</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                Bạn có chắc chắn xóa đơn hàng này không?
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                    <a class="btn btn-danger" id="methodDelete">Xóa</a>
                </div>
            </div>
        </div>
    </div>
    <div class="title-page mt-4">
        <div class="container">
            <div class="row">
                <div class="col-12 text-center">
                    <h1>Quản Lý Đơn Hàng</h1>
                </div>
                <div class="col-12">
                    <hr>
                </div>
            </div>
        </div>
    </div>

    <div class="table-data">
        <div class="container">
            <div style="margin-bottom: 10px">
                <button class="btn btn-outline-primary" id="add" data-toggle="modal"
                        data-target="#exampleModal">
                    Thêm đơn hàng
                </button>
            </div>
            <div class="alert alert-success" hidden="${insertSuccess}">
                <strong>Success!</strong> Thêm mới thành công
            </div>
            <div class="alert alert-success" hidden="${updateSuccess}">
                <strong>Success!</strong> Cập nhật thành công
            </div>
            <div class="alert alert-success" hidden="${deleteSuccess}">
                <strong>Success!</strong> Xóa thành công
            </div>
            <div class="alert alert-danger" hidden="${fail}">
                <strong>Danger!</strong> Thất bại.
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="table-responsive">
                        <table id="dtHorizontalVerticalExample" class="table table-striped table-hover table-sm"
                               cellspacing="0"
                               width="100%">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>Mã đơn hàng</th>
                                <th>Thời gian đặt</th>
                                <th>Trạng thái đơn hàng</th>
                                <th>Hình thức thanh toán</th>
                                <th>Trạng thái thanh toán</th>
                                <th>Chi tiết đơn hàng</th>
                                <th>Cập nhật trạng thái thanh toán</th>
                                <th>Cập nhật trạng thái đơn hàng</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${orders}" var="order" varStatus="stt">
                                <tr>
                                    <th scope="row">${stt.index}</th>
                                    <td value="${order.id}">${order.id}</td>
                                    <td value="${order.timecreate}">${order.timecreate}</td>
                                    <td value="${order.idOrderstatus}">
                                        <c:choose>
                                            <c:when test="${order.idOrderstatus == 1}">
                                                <span class="badge badge-success">Chưa xác nhận</span>
                                            </c:when>
                                            <c:when test="${order.idOrderstatus == 2}">
                                                <span class="badge badge-success">Xác nhận</span>
                                            </c:when>
                                            <c:when test="${order.idOrderstatus == 3}">
                                                <span class="badge badge-success">Đang giao</span>
                                            </c:when>
                                            <c:when test="${order.idOrderstatus == 4}">
                                                <span class="badge badge-success">Hoàn thành</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge badge-success">Đã hủy</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td value="${order.payments}">
                                        <c:choose>
                                            <c:when test="${order.payments == true}">
                                            <span class="badge badge-success">Chuyển khoản</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge badge-success">Sau khi nhận hàng</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td value="${order.statusPaments}">
                                    <c:choose>
                                            <c:when test="${order.statusPaments == true}">
                                                <span class="badge badge-success">Đã thanh toán</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge badge-success">Chưa thanh toán</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <a href="/orderDetail?id=${order.id}" class="btn btn-info">Xem chi tiết</a>
                                    </td>
                                    <td>
                                        <select class="form-control select-thanh-toan"
                                                name="${order.id}"
                                                onchange="updateStatusPayment(${order.id})"
                                                id="${order.id}">
                                            <option value selected disabled>Chọn</option>
                                            <option value="0">Chưa thanh toán</option>
                                            <option value="1">Đã thanh toán</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="form-control select-trang-thai"
                                                name="${order.id}"
                                                id="${order.id}"
                                                onchange="updateStatusOrder(${order.id})">
                                            <option value selected disabled>Chọn</option>
                                            <option value="1">Chưa xác nhận</option>
                                            <option value="2">Xác nhận</option>
                                            <option value="3">Đang giao</option>
                                            <option value="4">Hoàn thành</option>
                                            <option value="5">Đã hủy</option>
                                        </select>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<script src="/js/order-management.js" charset="utf-8"></script>

