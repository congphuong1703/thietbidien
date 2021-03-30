<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 25-Feb-21
  Time: 6:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<main>
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <form:form modelAttribute="productModel" action="/product/add" method="get"
                           onsubmit="return simpleValidation()">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Sản phẩm</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body form-custom">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>ID</label>
                                    <form:input path="increaseId" id="increaseId" readonly="true" type="text"
                                                class="form-control"
                                                placeholder="ID"/>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Mã sản phẩm</label>
                                    <form:input path="id" id="id" type="text"
                                                class="form-control"
                                                placeholder="Mã sản phẩm"/>
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
                                    <form:input path="price" id="price" type="number" min="1" class="form-control"
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
                                    <form:input path="amount" id="amount" type="number" min="1" class="form-control"
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
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Danh mục</label>
                                    <form:select path="categoryId" id="categoryId" class="form-control" require="true">
                                        <option id="-1" selected value disabled></option>
                                        <c:forEach items="${categories}" var="category">
                                            <form:option data-id="${category.id}"
                                                         value="${category.id}">${category.id} | ${category.name}</form:option>
                                        </c:forEach>
                                    </form:select>

                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-check" id="status">
                                    <label>Còn hàng</label>
                                    <form:radiobutton path="status" name="status" value="false" checked="true"/> <br>
                                    <label>hết hàng</label>
                                    <form:radiobutton path="status" name="status" value="true"/>
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
                    <h1>Quản Lý Sản phẩm</h1>
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
                    Thêm sản phẩm
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
                                <th>Ảnh</th>
                                <th>Mã sản phẩm</th>
                                <th>Tên sản phẩm</th>
                                <th>Giá bán</th>
                                <th>Số lượng</th>
                                <th>Mô tả</th>
                                <th>Thông số kỹ thuật</th>
                                <th>Bảo hành</th>
                                <th>Đơn vị tính</th>
                                <th>Danh mục sản phẩm</th>
                                <th style="width: 150px;">Tình trạng bán</th>
                                <th style="width: 175px;">Hành Động</th>
                            </tr>
                            </thead>
                            <tbody id="tbody-san-pham">
                            <c:forEach items="${products}" var="product" varStatus="stt">
                                <tr>
                                    <th scope="col">${stt.index}</th>
                                    <td><img width="50%" src="${product.image}"></td>
                                    <td>${product.id}</td>
                                    <td>${product.name}</td>
                                    <td>${product.price}</td>
                                    <td>${product.amount}</td>
                                    <td>${product.description}</td>
                                    <td>${product.specification}</td>
                                    <td>${product.guarantee}</td>
                                    <td>${product.unit}</td>
                                    <td>${product.categoryId}</td>
                                    <c:choose>
                                        <c:when test="${product.status}">
                                            <td class="text-center"><span class="badge badge-success">Còn hàng</span>
                                            </td>
                                        </c:when>
                                        <c:otherwise>
                                            <td class="text-center"><span class="badge badge-warning">Hết hàng</span>
                                            </td>
                                        </c:otherwise>
                                    </c:choose>
                                    <td>
                                        <button type="button" class="btn btn-warning" data-toggle="modal"
                                                data-target="#exampleModal"
                                                id="${product.increaseId}"
                                                data-increaseId="${product.increaseId}"
                                                data-id="${product.id}"
                                                data-name="${product.name}"
                                                data-price="${product.price}"
                                                data-image="${product.image}"
                                                data-status="${product.status}"
                                                data-description="${product.description}"
                                                data-amount="${product.amount}"
                                                data-specification="${product.specification}"
                                                data-guarantee="${product.guarantee}"
                                                data-unit="${product.unit}"
                                                data-categoryId="${product.categoryId}"
                                                onclick="updateProduct(${product.increaseId})"><i
                                                class="fas fa-pen"></i>
                                            Sửa
                                        </button>
                                        <button type="button" class="btn btn-danger" data-toggle="modal"
                                                data-target="#exampleModal1"
                                                onclick="deleteProduct(${product.increaseId})"><i class=" fas fa-trash-alt
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
<script src="/js/product.js"></script>