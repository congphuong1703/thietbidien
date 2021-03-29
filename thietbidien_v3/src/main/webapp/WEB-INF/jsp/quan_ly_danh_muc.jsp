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
                <form:form modelAttribute="categoryModel" action="/category/add" method="get" onsubmit="return simpleValidation()">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Danh mục sản phẩm</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body form-custom">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>ID danh mục</label>
                                    <form:input path="id" id="id" readonly="true" type="text"
                                                class="form-control"
                                                placeholder="ID"/>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Tên danh mục</label>
                                    <form:input path="name" id="name" type="text" class="form-control"
                                                placeholder="Tên danh mục"/>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="form-check" id="status">
                                    <label>Không bán</label>
                                    <form:radiobutton path="status" name="status" value="false" checked="true"/> <br>
                                    <label>Còn bán</label>
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
    <div class="title-page mt-4">
        <div class="container">
            <div class="row">
                <div class="col-12 text-center">
                    <h1>Quản Lý Danh Mục Sản Phẩm</h1>
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
                    Thêm danh mục
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
                                <th>STT</th>
                                <th>ID</th>
                                <th>Tên danh mục sản phẩm</th>
                                <th scope="col" style="width: 150px;">Tình trạng bán</th>
                                <th scope="col" style="width: 175px;">Hành Động</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${categories}" var="category" varStatus="stt">
                            <tr>
                                <th>${stt.index}</th>
                                <td value="${category.id}">${category.id}</td>
                                <td value="${category.name}">${category.name}</td>
                                <c:choose>
                                    <c:when test="${category.status}">
                                        <td value="${category.status}" class="text-center"><span
                                                class="badge badge-success">Còn bán</span></td>
                                    </c:when>
                                    <c:otherwise>
                                        <td value="${category.status}" class="text-center"><span
                                                class="badge badge-danger">Không bán</span></td>
                                    </c:otherwise>
                                </c:choose>
                                <td>
                                    <button type="button" id="${category.id}" class="btn btn-warning"
                                            data-toggle="modal"
                                            data-target="#exampleModal"
                                            data-id="${category.id}"
                                            data-name="${category.name}"
                                            data-status="${category.status}"
                                            onclick="updateCategory(${category.id})"
                                            value="${category.id}"><i class="fas fa-pen"></i>
                                        Sửa
                                    </button>
                                    <button type="button" class="btn btn-danger" data-toggle="modal"
                                            data-target="#exampleModal1" onclick="deleteCategory(${category.id})"
                                            value="${category.id}">
                                        <i
                                                class="fas fa-trash-alt"></i>
                                        Xóa
                                    </button>
                                </td>
                            </tr>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<script src="/js/category.js"></script>

