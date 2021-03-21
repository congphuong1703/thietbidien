<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 03-Mar-21
  Time: 9:49 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<main>
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Chi Tiết Phiếu Nhập</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body form-custom">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Mã sản phẩm</label>
                                <input type="text" class="form-control" id="input-ten" placeholder="Nhập mã">
                                <div class="invalid-feedback">
                                    Error!
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Mã sản phẩm</label>
                                <input type="text" class="form-control" id="input-ten" placeholder="Nhập mã sản phẩm">
                                <div class="invalid-feedback">
                                    Error!
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Tên sản phẩm</label>
                                <input type="text" class="form-control" id="input-ten" placeholder="Nhập tên sản phẩm">
                                <div class="invalid-feedback">
                                    Error!
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label>Số lượng</label>
                                <input type="text" class="form-control" id="input-ten" placeholder="Nhập số lượng">
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
    <div class="container chi-tiet">
        <div class="row">
            <div class="col-md-12 tieu-de">
                <h1>Chi Tiết Phiếu Nhập</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <label>Mã phiếu nhập:</label> <span id="ma-don-hang">3</span><br>
                <label>Thời gian lập:</label> <span id="ten-khach-hang">23-09-2020</span><br>
            </div>
            <div class="col-md-6">
                <label>Tên nhà cung cấp:</label> <span id="ma-khach-hang">Panasonic</span><br>
                <label>Tên người lập:</label> <span id="so-dien-thoai">Hà Lương Hoài</span><br>
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
                                    <th scope="col">Mã sản phẩm</th>
                                    <th scope="col">Tên sản phẩm</th>
                                    <th scope="col">Số lượng</th>
                                    <th scope="col">Đơn giá</th>
                                    <th scope="col">Thành tiền</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row">1</th>
                                    <td>88</td>
                                    <td>Dây điện Cadivi</td>
                                    <td>5</td>
                                    <td>50.000</td>
                                    <td>250.000</td>
                                </tr>
                                <tr>
                                    <th scope="row">2</th>
                                    <td>89</td>
                                    <td>Dây điện Sino</td>
                                    <td>5</td>
                                    <td>50.000</td>
                                    <td>250.000</td>
                                </tr>
                                <tr>
                                    <th scope="row">3</th>
                                    <td>99</td>
                                    <td>Dây điện Vinacap</td>
                                    <td>5</td>
                                    <td>50.000</td>
                                    <td>250.000</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="tong-tien text-center">
            <label for="">Tổng tiền:</label><span>2000000</span>
        </div>
        <div class="row">
            <div class="col-md-12">
                <button type="button" class="btn btn-primary">In hóa đơn</button>
            </div>
        </div>
    </div>
</main>
