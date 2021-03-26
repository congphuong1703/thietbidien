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
                    <h5 class="modal-title" id="exampleModalLabel">Danh mục sản phẩm</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body form-custom">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group" id="ten-danh-muc">
                                <label>Tên danh mục sản phẩm</label>
                                <input type="hidden" id="idCategory">
                                <input type="text" class="form-control" id="input-ten" placeholder="Nhập tên">
                                <div class="invalid-feedback">
                                    Error!
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="checkbox-tinh-trang-ban">
                                <label class="form-check-label">
                                    Không còn bán
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                    <button type="button" class="btn btn-success" id="btn-luu-lai">Lưu</button>
                </div>
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
                    <button type="button" class="btn btn-danger" id="btn-xac-nhan-xoa">Xóa</button>
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
    <div class="tool-page">
        <div class="container">
            <div class="row">
                <div class="col-md-10">
                    <button id="btn-them" type="button" class="btn btn-primary" data-toggle="modal"
                            data-target="#exampleModal"><i class="fas fa-plus"></i> Thêm danh mục sản phẩm
                    </button>
                </div>
                <div class="col-md-4 mt-1 hienthi">
                    Hiển thị bản ghi: <span id="hien-thi" style="border:1px solid #ddd; padding: 3px"></span>
                </div>
            </div>
        </div>
    </div>
    <div class="table-data">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="table-reponsive">
                        <table class="table table-hover table-bordered">
                            <thead>
                            <tr>
                                <th scope="col">STT</th>
                                <th scope="col">ID</th>
                                <th scope="col">Tên danh mục sản phẩm</th>
                                <th scope="col" style="width: 150px;">Tình trạng bán</th>
                                <th scope="col" style="width: 175px;">Hành Động</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${categories}" var="category" varStatus="stt">
                            <tr>
                                <th scope="row">${stt.index}</th>
                                <td value="${category.id}">${category.id}</td>
                                <td value="${category.name}">${category.name}</td>
                                <c:choose>
                                    <c:when test="${category.status}">
                                        <td value="${category.status}" class="text-center"><span
                                                class="badge badge-success">Còn bán</span></td>
                                    </c:when>
                                    <c:otherwise>
                                        <td valu="${category.status}" class="text-center"><span
                                                class="badge badge-danger">Không bán</span></td>
                                    </c:otherwise>
                                </c:choose>
                                <td>
                                    <button type="button" class="btn btn-warning" data-toggle="modal"
                                            data-target="#exampleModal" value="${category.id}"><i
                                            class="fas fa-pen"></i>
                                        Sửa
                                    </button>
                                    <button type="button" class="btn btn-danger" data-toggle="modal"
                                            data-target="#exampleModal1" value="${category.id}"><i class="fas fa-trash-alt"></i>
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
<script src="admin/ajax/quan-ly-san-pham.js"></script>

