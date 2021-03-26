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
    <div class="tool-page">
        <div class="container">
            <div class="row">
                <div class="col-md-10">
                    <button id="btn-them" type="button" class="btn btn-primary" data-toggle="modal"
                            data-target="#exampleModal"><i class="fas fa-plus"></i> Thêm danh mục sản phẩm
                    </button>
                </div>
                <div class="col-md-2 mt-1 hienthi">
                    Hiển thị bản ghi <input type="text" readonly style="width:30px">
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
                                <th class="col-2">STT</th>
                                <th class="col-2">Ảnh</th>
                                <th class="col-2">Mã sản phẩm</th>
                                <th class="col-2">Tên sản phẩm</th>
                                <th class="col-2">Giá bán</th>
                                <th class="col-2">Số lượng</th>
                                <th class="col-2">Mô tả</th>
                                <th class="col-2">Thông số kỹ thuật</th>
                                <th class="col-2">Bảo hành</th>
                                <th class="col-2">Đơn vị tính</th>
                                <th class="col-4">Danh mục sản phẩm</th>
                                <th class="col-2" style="width: 150px;">Tình trạng bán</th>
                                <th class="col-2" style="width: 175px;">Hành Động</th>
                            </tr>
                            <tr>
                                <td></td>
                                <form action="/product/search">
                                    <td><input type="text" name="code" class="form-control" id="input-search-ma"></td>
                                    <td><input type="text" name="name" class="form-control" id="input-search-ten"></td>
                                    <td><input type="number" name="price" required class="form-control"
                                               id="input-search-gia">
                                    </td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>
                                        <select name="status" id="select-search-het-hang" class="form-control">
                                            <option disabled value="0" selected>Chọn</option>
                                            <option value="1">Còn hàng</option>
                                            <option value="2">Hết hàng</option>
                                        </select>
                                    </td>
                                    <td>
                                        <button type="submit" class="btn btn-primary" id="btn-tim-kiem">
                                            <i class="fas fa-search"></i> Tìm kiếm
                                        </button>
                                    </td>
                                </form>
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
                                            <td class="text-center"><span class="badge badge-success">Còn bán</span></td>
                                        </c:when>
                                        <c:otherwise>
                                            <td class="text-center"><span class="badge badge-warning">Không bán</span></td>
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
