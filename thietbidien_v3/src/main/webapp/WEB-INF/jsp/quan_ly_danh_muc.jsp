<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 01-Feb-21
  Time: 12:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<main>
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
    <div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Xác nhận thao tác</h5>
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
                    <button id="btn-them" type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal"><i class="fas fa-plus"></i> Thêm danh mục sản phẩm</button>
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
                                <th scope="col">Tên danh mục sản phẩm</th>
                                <th scope="col" style="width: 150px;">Tình trạng bán</th>
                                <th scope="col" style="width: 175px;">Hành Động</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>Dây điện</td>
                                <td class="text-center"><span class="badge badge-success">Còn bán</span></td>
                                <td>
                                    <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#exampleModal"><i class="fas fa-pen"></i>
                                        Sửa</button>
                                    <button type="button" class="btn btn-danger" data-toggle="modal"
                                            data-target="#exampleModal1"><i class="fas fa-trash-alt"></i>
                                        Xóa</button>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>Thiết bị chiếu sáng</td>
                                <td class="text-center"><span class="badge badge-danger">Không còn bán</span></td>
                                <td>
                                    <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#exampleModal"><i class="fas fa-pen"></i>
                                        Sửa</button>
                                    <button type="button" class="btn btn-danger" data-toggle="modal"
                                            data-target="#exampleModal1"><i class="fas fa-trash-alt"></i>
                                        Xóa</button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<script src="admin/ajax/quan-ly-san-pham.js"></script>

