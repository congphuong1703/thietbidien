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
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Sản phẩm</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body form-custom">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Mã sản phẩm</label>
                                <input type="text" class="form-control" placeholder="Nhập mã sản phẩm">
                                <div class="invalid-feedback">
                                    Error!
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Tên sản phẩm</label>
                                <input type="text" class="form-control" placeholder="Nhập tên sản phẩm">
                                <div class="invalid-feedback">
                                    Error!
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Danh mục sản phẩm</label>
                                <select id="select-loai-san-pham" class="form-control select-loai-san-pham">
                                    <option value="1">Dây điện</option>
                                    <option value="2">Cáp điện</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Giá bán</label>
                                <input type="text" class="form-control" placeholder="Nhập giá bán">
                                <div class="invalid-feedback">
                                    Error!
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Số lượng</label>
                                <input type="number" class="form-control" placeholder="Nhập Số lượng">
                                <div class="invalid-feedback">
                                    Error!
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Bảo hành</label>
                                <input type="number" class="form-control"
                                       placeholder="Nhập số tháng bảo hành">
                                <div class="invalid-feedback">
                                    Error!
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Ảnh</label>
                                <input type="file" class="form-control-file" id="file-anh">
                                <div class="invalid-feedback">
                                    Error!
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Đơn vị tính</label>
                                <input type="text" class="form-control" id="input-ten" placeholder="Nhập đơn vị tính">
                                <div class="invalid-feedback">
                                    Error!
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Mô tả</label>
                                <textarea class="form-control is-invalid"
                                          rows="3"></textarea>
                                <div class="invalid-feedback">
                                    Error!
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Thông số kỹ thuật</label>
                                <textarea class="form-control is-invalid" id="textarea-gioi-thieu"
                                          rows="3"></textarea>
                                <div class="invalid-feedback">
                                    Error!
                                </div>
                            </div>
                        </div>


                        <div class="col-md-12">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="checkbox-het-hang">
                                <label class="form-check-label">
                                    Hết hàng
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
                                Bạn có chắc chắn xóa sản phẩm này không?
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
                    <h1>Quản Lý Sản Phẩm</h1>
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
                                    <td><img src="${product.image}"></td>
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
                                            <td class="text-center"><span class="badge badge-success">Còn bán</span>
                                            </td>
                                        </c:when>
                                        <c:otherwise>
                                            <td class="text-center"><span class="badge badge-warning">Không bán</span>
                                            </td>
                                        </c:otherwise>
                                    </c:choose>
                                    <td>
                                        <button type="button" class="btn btn-warning" data-toggle="modal"
                                                data-target="#exampleModal"><i class="fas fa-pen"></i>
                                            Sửa
                                        </button>
                                        <button type="button" class="btn btn-danger" data-toggle="modal"
                                                data-target="#exampleModal1"><i class="fas fa-trash-alt"></i>
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
