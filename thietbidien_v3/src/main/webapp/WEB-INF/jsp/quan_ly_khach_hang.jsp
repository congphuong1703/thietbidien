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
                <form:form modelAttribute="customerModel" action="/customer/add" method="get" onsubmit="return simpleValidation()">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Khách hàng</h5>
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
                                    <label>Tên khách hàng</label>
                                    <form:input path="name" id="name" type="text"
                                                class="form-control"
                                                placeholder="Tên khách hàng"/>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Email</label>
                                    <form:input path="email" id="email" type="email" class="form-control"
                                                placeholder="email"/>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Địa chỉ</label>
                                    <form:input path="adress" id="adress" type="text" class="form-control"
                                                placeholder="Địa chỉ"/>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Số điện thoại</label>
                                    <form:input path="phoneNumber" id="phoneNumber" type="text" class="form-control"
                                                placeholder="Số điện thoại"/>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Username</label>
                                    <form:input path="username" id="username" type="text" class="form-control"
                                                placeholder="Username"/>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Password</label>
                                    <form:input path="password" id="password" type="text" class="form-control"
                                                placeholder="Password"/>
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
                                Bạn có chắc chắn xóa khách hàng này không?
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
                    <h1>Quản Lý Khách Hàng</h1>
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
                    Thêm khách hàng
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
                                <th>STT</th>
                                <th>ID</th>
                                <th>Họ và tên</th>
                                <th>Số điện thoại</th>
                                <th>Email</th>
                                <th>Địa chỉ</th>
                                <th scope="col" style="width: 175px;">Hành Động</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${customers}" varStatus="stt" var="customer">
                                <tr>
                                    <th scope="row">${stt.index}</th>
                                    <td value="${customer.id}">${customer.id}</td>
                                    <td value="${customer.name}">${customer.name}</td>
                                    <td value="${customer.phoneNumber}">${customer.phoneNumber}</td>
                                    <td value="${customer.email}">${customer.email}</td>
                                    <td value="${customer.adress}">${customer.adress}</td>
                                    <td>
                                        <button type="button" class="btn btn-warning" data-toggle="modal"
                                                data-target="#exampleModal"
                                                id="${customer.id}"
                                                data-id="${customer.id}"
                                                data-name="${customer.name}"
                                                data-email="${customer.email}"
                                                data-adress="${customer.adress}"
                                                data-phoneNumber="${customer.phoneNumber}"
                                                data-username="${customer.username}"
                                                data-password="${customer.password}"
                                                onclick="updateCustomer(${customer.id})"><i
                                                class="fas fa-pen"></i>
                                            Sửa
                                        </button>
                                        <button type="button" class="btn btn-danger" data-toggle="modal"
                                                data-target="#exampleModal1"
                                                onclick="deleteCustomer(${customer.id})"><i class=" fas fa-trash-alt
                                        "></i>
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
</main>
<script src="/js/customer.js"></script>