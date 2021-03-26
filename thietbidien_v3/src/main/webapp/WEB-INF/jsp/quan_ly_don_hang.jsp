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
    <div class="tool-page">
        <div class="container">
            <div class="row">
                <div class="col-md-2 mt-1 hienthi">
                    Hiển thị bản ghi <input type="text" readonly style="width:30px;">
                </div>
                <div class="col-md-2 mt-1">
                    <select class="form-control select-dsdh-htthanh-toan">
                        <option>Danh sách đơn hàng theo hình thức thanh toán</option>
                        <option>Nhận hàng mới thanh toán</option>
                        <option>Chuyển khoản</option>
                    </select>
                </div>
                <div class="col-md-2 mt-1">
                    <select class="form-control select-dsdh-thanh-toan" id="status-payment">
                        <option value selected disabled>Danh sách đơn hàng theo trạng thái thanh toán</option>
                        <option value="0">Chưa thanh toán</option>
                        <option value="1">Đã thanh toán</option>
                    </select>
                </div>
                <div class="col-md-2 mt-1">
                    <select class="form-control select-dsdh-trang-thai">
                        <option>Danh sách đơn hàng theo trạng thái đơn hàng</option>
                        <option>Chưa xác nhận</option>
                        <option>Xác nhận</option>
                        <option>Đang giao</option>
                        <option>Hoàn thành</option>
                        <option>Đã hủy</option>
                    </select>
                </div>
                <div class="col-md-4 mt-1 search">
                    <form action="/order/findById">
                        <input type="search" name="id" type="number" id="search-by-id" class="form-control" value=""
                               style="width:200px;">
                        <button type="submit" class="btn btn-primary">Tìm kiếm</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <br>
    <div class="table-data">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="table-reponsive">
                        <table class="table table-hover table-bordered">
                            <thead>
                            <tr>
                                <th class="col-2">Mã đơn hàng</th>
                                <th class="col-2">Thời gian đặt</th>
                                <th class="col-2">Trạng thái đơn hàng</th>
                                <th class="col-2">Hình thức thanh toán</th>
                                <th class="col-2">Trạng thái thanh toán</th>
                                <th class="col-2">Chi tiết đơn hàng</th>
                                <th class="col-2">Cập nhật trạng thái thanh toán</th>
                                <th class="col-2">Cập nhật trạng thái đơn hàng</th>
                            </tr>
                            </thead>
                            <tbody id="tbody-san-pham">
                            <c:if test="${orders.size() > 0}">
                                <c:forEach items="${orders}" var="order" varStatus="stt">
                                    <tr>
                                        <th scope="col">${stt.index}</th>
                                        <td>${order.id}</td>
                                        <td>${order.timecreate}</td>
                                        <td class="text-center">
                                            <c:choose>
                                            <c:when test="${order.idOrderstatus == 1}">
                                            <span class="badge badge-success">Chưa xác nhận</span></td>
                                        </c:when>
                                        <c:when test="${order.idOrderstatus == 2}">
                                            <span class="badge badge-success">Xác nhận</span></td>
                                        </c:when>
                                        <c:when test="${order.idOrderstatus == 3}">
                                            <span class="badge badge-success">Đang giao</span></td>
                                        </c:when>
                                        <c:when test="${order.idOrderstatus == 4}">
                                            <span class="badge badge-success">Hoàn thành</span></td>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge badge-success">Đã hủy</span></td>
                                        </c:otherwise>
                                        </c:choose>
                                        <c:choose>
                                            <c:when test="${order.payments == true}">
                                                <td class="text-center"><span
                                                        class="badge badge-success">Chuyển khoản</span>
                                                </td>
                                            </c:when>
                                            <c:otherwise>
                                                <td class="text-center">
                                                    <span class="badge badge-success">Sau khi nhận hàng</span>
                                                </td>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:choose>
                                            <c:when test="${order.statusPaments == true}">
                                                <td class="text-center">
                                                    <span class="badge badge-success">Đã thanh toán</span>
                                                </td>
                                            </c:when>
                                            <c:otherwise>
                                                <td class="text-center"><span
                                                        class="badge badge-success">Chưa thanh toán</span>
                                                </td>
                                            </c:otherwise>
                                        </c:choose>
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
                            </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
<script src="/js/order-management.js" charset="utf-8"></script>

