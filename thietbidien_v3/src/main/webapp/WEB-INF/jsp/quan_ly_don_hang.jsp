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
                                                <span class="badge badge-secondary">Chưa xác nhận</span>
                                            </c:when>
                                            <c:when test="${order.idOrderstatus == 2}">
                                                <span class="badge badge-primary">Xác nhận</span>
                                            </c:when>
                                            <c:when test="${order.idOrderstatus == 3}">
                                                <span class="badge badge-warning">Đang giao</span>
                                            </c:when>
                                            <c:when test="${order.idOrderstatus == 4}">
                                                <span class="badge badge-success">Hoàn thành</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge badge-danger">Đã hủy</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td value="${order.payments}">
                                        <c:choose>
                                            <c:when test="${order.payments == true}">
                                                <span class="badge badge-warning">Chuyển khoản</span>
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
                                                <span class="badge badge-danger">Chưa thanh toán</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <a href="/order/orderDetail?id=${order.id}" class="btn btn-info">Xem chi
                                            tiết</a>
                                    </td>
                                    <td>
                                        <select class="form-control select-thanh-toan"
                                                name="${order.id}"
                                                onchange="updateStatusPayment(${order.id})"
                                                id="${order.id}">
                                            <option value selected disabled>Chọn</option>
                                            <c:if test="${order.statusPaments == false}">
                                                <option value="1">Đã thanh toán</option>
                                            </c:if>
                                        </select>
                                    </td>
                                    <td>
                                        <select class="form-control select-trang-thai"
                                                name="${order.id}"
                                                id="${order.id}"
                                                onchange="updateStatusOrder(${order.id})">
                                            <option value selected disabled>Chọn</option>
                                            <c:if test="${order.idOrderstatus == 1}">
                                                <option value="2">Xác nhận</option>
                                            </c:if>
                                            <c:if test="${order.idOrderstatus == 2}">
                                                <c:if test="${order.payments == false || order.statusPaments == true}">
                                                    <option value="3">Đang giao</option>
                                                </c:if>
                                            </c:if>
                                            <c:if test="${order.idOrderstatus == 3}">
                                                <option value="4">Hoàn thành</option>
                                            </c:if>
                                            <c:if test="${order.idOrderstatus != 4 && order.idOrderstatus != 3 && order.statusPaments != false}">
                                                <option value="5">Đã hủy</option>
                                            </c:if>
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
<div class="modal fade" id="notification" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="notify">Thông báo</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body form-custom">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Cập nhật thành công</label><br>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" id="closeNotify" onclick="reloadPage()" class="btn btn-default"
                        data-dismiss="modal">Đóng
                </button>
            </div>
        </div>
    </div>
</div>

