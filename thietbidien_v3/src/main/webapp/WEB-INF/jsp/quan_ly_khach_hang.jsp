<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<main>
    <main>
        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <form:form modelAttribute="customerModel" action="/customer/add" method="get">
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
                                        <form:input path="name" id="id" type="text"
                                                    class="form-control"
                                                    placeholder="Tên khách hàng"/>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Tên sản phẩm</label>
                                        <form:input path="name" id="name" type="text" class="form-control"
                                                    placeholder="Tên sản phẩm"/>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Giá</label>
                                        <form:input path="price" id="price" type="number" class="form-control"
                                                    placeholder="Giá"/>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Nguồn ảnh</label>
                                        <form:input path="image" id="image" type="text" class="form-control"
                                                    placeholder="Nguồn ảnh"/>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Mô tả</label>
                                        <form:textarea path="description" id="description" type="text" class="form-control"
                                                       placeholder="Mô tả"/>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Số lượng</label>
                                        <form:input path="amount" id="amount" type="number" class="form-control"
                                                    placeholder="Số lượng"/>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Thông số</label>
                                        <form:input path="specification" id="specification" type="text" class="form-control"
                                                    placeholder="Thông số"/>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Bảo hành</label>
                                        <form:input path="guarantee" id="guarantee" type="number" class="form-control"
                                                    placeholder="Bảo hành"/>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>Đơn vị</label>
                                        <form:input path="unit" id="unit" type="text" class="form-control"
                                                    placeholder="Đơn vị"/>
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
                                                data-id="${customer.id}"
                                                data-name="${customer.name}"
                                                data-email="${customer.email}"
                                                data-adress="${customer.adress}"
                                                data-phoneNumber="${customer.phoneNumber}"
                                                data-username="${customer.username}"
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
