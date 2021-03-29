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
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Nhà cung cấp</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form:form method="get" action="/supplier/add" modelAttribute="supplierModel" onsubmit="return simpleValidation()">
                    <div class="modal-body form-custom">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>ID danh mục</label>
                                    <form:input path="id" id="id" readonly="true" type="text"
                                                class="form-control"
                                                placeholder="ID"/>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Tên nhà cung cấp</label>
                                    <form:input path="name" id="name" type="text" class="form-control"
                                                placeholder="Nhập tên"/>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Số điện thoại</label>
                                    <form:input path="sdt" id="sdt" type="text" class="form-control"
                                                placeholder="Nhập số điện thoại"/>
                                    <div class="invalid-feedback">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Email</label>
                                    <form:input path="email" id="email" type="email" class="form-control"
                                                placeholder="Nhập email"/>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Địa chỉ</label>
                                    <form:input type="text" path="adress" id="adress" class="form-control"
                                           placeholder="Nhập địa chỉ"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                        <button type="submit" class="btn btn-success" id="btn-luu-lai">Lưu</button>
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
                                Bạn có chắc chắn xóa sản phẩm này không?
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
                    <h1>Quản Lý Nhà Cung Cấp</h1>
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
                    Thêm nhà cung cấp
                </button>
            </div>
            <c:if test="${insertSuccess}">
                <div class="alert alert-success">
                    <strong>Success!</strong> Thêm mới thành công
                </div>
            </c:if>
            <c:if test="${updateSuccess}">
                <div class="alert alert-success" >
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
                                <th scope="col">STT</th>
                                <th scope="col">ID</th>
                                <th scope="col">Tên nhà cung cấp</th>
                                <th scope="col">Số điện thoại</th>
                                <th scope="col">Email</th>
                                <th scope="col">Địa chỉ</th>
                                <th scope="col" style="width: 175px;">Hành Động</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${suppliers}" var="supplier" varStatus="stt">
                                <tr>
                                    <th scope="row">${stt.index}</th>
                                    <td value="${supplier.id}">${supplier.id}</td>
                                    <td value="${supplier.name}">${supplier.name}</td>
                                    <td value="${supplier.sdt}">${supplier.sdt}</td>
                                    <td value="${supplier.email}">${supplier.email}</td>
                                    <td value="${supplier.adress}">${supplier.adress}</td>
                                    <td>
                                        <button type="button" class="btn btn-warning" data-toggle="modal"
                                                data-target="#exampleModal"
                                                id="${supplier.id}"
                                                data-id="${supplier.id}"
                                                data-name="${supplier.name}"
                                                data-sdt="${supplier.sdt}"
                                                data-email="${supplier.email}"
                                                data-adress="${supplier.adress}"
                                                onclick="updateSupplier(${supplier.id})"><i
                                                class="fas fa-pen"></i>
                                            Sửa
                                        </button>
                                        <button type="button" class="btn btn-danger" data-toggle="modal"
                                                data-target="#exampleModal1"
                                                onclick="deleteSupplier(${supplier.id})"><i class=" fas fa-trash-alt
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
<script src="/js/supplier.js"></script>
