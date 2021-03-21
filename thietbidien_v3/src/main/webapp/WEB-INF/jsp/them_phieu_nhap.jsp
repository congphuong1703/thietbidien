<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 25-Feb-21
  Time: 8:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<main>
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                                <label>Tên sản phẩm</label>
                                <select id="select-ten-san-pham" class="form-control">
                                    <option selected >000</option>
                                    <option>001</option>
                                    <option>002</option>
                                </select>
                                <div class="invalid-feedback">
                                    Error!
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Số lượng</label>
                                <input type="number" class="form-control" id="input-sdt" placeholder="Nhập số lượng">
                                <div class="invalid-feedback">
                                    Error!
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Đơn giá</label>
                                <input type="number" class="form-control" id="input-email" placeholder="Nhập đơn giá">
                                <div class="invalid-feedback">
                                    Error!
                                </div>
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
                    <h1>Lập Phiếu Nhập Hàng</h1>
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
                <div class="col-md-12 text-center pb-4">
                    <label for="" style="font-size: 16px;color: rgb(44, 39, 39);">Thời gian lập</label>
                    <input type="text" name="" id="">
                </div>
                <div class="col-md-6 pb-3">
                    <select id="select-ma-nguoi-lap" class="form-control" style="width:200px;margin-left:250px">
                        <option selected >Mã người lập</option>
                        <option>001</option>
                        <option>002</option>
                    </select>
                </div>
                <div class="col-md-6 pb-3">
                    <select id="select-ma-nguoi-lap" class="form-control" style="width:200px;margin-left:145px">
                        <option selected >Tên nhà cung cấp</option>
                        <option>Panasonic</option>
                        <option>jdskdg</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <button id="btn-them" type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal"><i class="fas fa-plus"></i> Thêm sản phẩm</button>
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
                                <th scope="col">Tên sản phẩm</th>
                                <th scope="col">Số lượng</th>
                                <th scope="col">Đơn giá</th>
                                <th scope="col">Thành tiền</th>
                                <th scope="col" style="width: 175px;">Hành Động</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>Dây điện vinacap</td>
                                <td>40</td>
                                <td>50000</td>
                                <td>200000</td>
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
                                <td>Dây điện vinacap</td>
                                <td>40</td>
                                <td>50000</td>
                                <td>200000</td>
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
    <div class="col-md-6">
        <div class="form-group">
            <label style="color: rgb(48, 45, 45);font-size: 16;">Ghi chú</label>
            <textarea class="form-control" id="textarea-gioi-thieu"
                      rows="3"></textarea>
            <div class="invalid-feedback">
                Error!
            </div>
        </div>
    </div>
    <br>
    <div class="col-md-12">
        <div class="nut-cap-nhat">
            <button id="btn-them" type="button" class="btn btn-primary" data-toggle="modal">Lưu phiếu nhập</button>
        </div>
    </div>
</main>
