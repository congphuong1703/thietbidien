<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 02-Feb-21
  Time: 10:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<main>
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <form:form modelAttribute="orderDetailsModel" action="/order/addOrderDetails" method="post" onsubmit="return simpleValidation()">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body form-custom">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Mã đơn hàng</label>
                                    <form:input path="idOrder" id="idOrder" readonly="true" type="text"
                                                class="form-control"
                                                placeholder="Mã đơn hàng"/>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Sản phẩm</label>
                                    <form:select path="idProduct" id="idProduct" class="form-control">
                                        <option selected value disabled id="-1">Sản phẩm</option>
                                        <c:forEach items="${products}" var="product">
                                            <form:option value="${product.increaseId}" data-amount="${product.amount}" data-id="${product.increaseId}">${product.id}
                                                || ${product.name}</form:option>
                                        </c:forEach>
                                    </form:select>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Số lượng</label>
                                    <form:input path="amount" id="amount" type="number"
                                                class="form-control"
                                                placeholder="Số lượng"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                        <button type="submit" class="btn btn-success">Lưu</button>
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
                                Bạn có chắc chắn xóa danh mục sản phẩm này không?
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
    <div class="container chi-tiet">
        <div class="row">
            <div class="col-md-12 tieu-de">
                <h1>Chi Tiết Đơn Hàng</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <label>Mã đơn hàng:</label> <span id="ma-don-hang" value="${order.id}">${order.id}</span><br>
                <label>Tên khách hàng:</label> <span id="ten-khach-hang"
                                                     value="${customer.id}">${customer.name}</span><br>
                <label>Số điện thoại:</label> <span id="so-dien-thoai">${customer.phoneNumber}</span><br>
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
                <c:if test="${insertSuccess}">
                    <div class="alert alert-success">
                        <strong>Success!</strong> Thêm mới thành công
                    </div>
                </c:if>
                <c:if test="${updateSuccess}">
                    <div class="alert alert-success">
                        <strong>Success!</strong> Cập nhật thành công
                    </div>
                </c:if>
                <c:if test="${deleteSuccess}">
                    <div class="alert alert-success">
                        <strong>Success!</strong> Xóa thành công
                    </div>
                </c:if>
                <c:if test="${fail}">
                    <div class="alert alert-danger">
                        <strong>Danger!</strong> Thất bại.
                    </div>
                </c:if>
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
                                    <th scope="col" style="width: 175px;">Hành Động</th>
                                </tr>
                                </thead>
                                <tbody id="tbody-san-pham">
                                <c:forEach items="${list}" var="l">
                                    <tr>
                                        <td value="${l.get('productId')}">${l.get('productId')}</td>
                                        <td value="${l.get('productName')}">${l.get('productName')}</td>
                                        <td value="${l.get('amount')}">${l.get('amount')}</td>
                                        <td value="${l.get('price')}">${l.get('price')}</td>
                                        <td value="${l.get('money')}">${l.get('money')}</td>
                                        <td>
                                            <button type="button" id="${order.id}" class="btn btn-warning"
                                                    data-toggle="modal"
                                                    data-target="#exampleModal"
                                                    data-idOrder="${order.id}"
                                                    data-idProduct="${l.get('productIncrease')}"
                                                    data-amount="${l.get('amount')}"
                                                    onclick="updateOrderDetails(${order.id})"
                                                    value="${order.id}"><i class="fas fa-pen"></i>
                                                Sửa
                                            </button>
                                            <button type="button" class="btn btn-danger" data-toggle="modal"
                                                    data-target="#exampleModal1"
                                                    id="delete${order.id}"
                                                    data-productId=${l.get('productIncrease')}
                                                            onclick="deleteOrderDetails(${order.id})"
                                                    value="${order.id}">
                                                <i
                                                        class="fas fa-trash-alt"></i>
                                                Xóa
                                            </button>
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

<script src="/js/orderdetails.js"></script>