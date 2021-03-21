<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 01-Feb-21
  Time: 3:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<main>
    <!-- Modal -->
    <div class="title-page mt-4">
        <div class="container">
            <div class="row">
                <div class="col-12 text-center">
                    <h1>Danh Sách Phiếu Nhập</h1>
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
                <div class="col-md-12 mt-1 search">
                    <input type="search" name="" id="input" class="form-control" value="" style="width:200px;">
                    <button type="button" class="btn btn-primary">Tìm kiếm</button>
                </div>
            </div>
        </div>
    </div><br>
    <div class="table-data">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="table-reponsive">
                        <table class="table table-hover table-bordered">
                            <thead>
                            <tr>
                                <th scope="col">STT</th>
                                <th scope="col">Mã phiếu nhập</th>
                                <th scope="col">Người lập phiếu</th>
                                <th scope="col">Mã nhà cung cấp</th>
                                <th scope="col">Thời gian lập</th>
                                <th scope="col">Ghi chú</th>
                                <th scope="col">Tình trạng</th>
                                <th scope="col">Chi tiết phiếu nhập</th>
                                <th scope="col">Cập nhật tình trạng</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>Admin</td>
                                <td>Panasonic</td>
                                <td>22-03-2020</td>
                                <td>50000</td>
                                <td>Đã nhập</td>
                                <td>
                                    <a class="btn btn-info" href="chi-tiet-phieu-nhap.tiles">Xem chi tiết</a>
                                </td>
                                <td>
                                    <select class="form-control select-dsdh-htthanh-toan">
                                        <option>Chưa nhập</option>
                                        <option>Đã nhập</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>Admin</td>
                                <td>Panasonic</td>
                                <td>22-03-2020</td>
                                <td>50000</td>
                                <td>Chưa nhập</td>
                                <td>
                                    <a class="btn btn-info" href="chi-tiet-don-hang.tiles">Xem chi tiết</a>
                                </td>
                                <td>
                                    <select class="form-control select-dsdh-htthanh-toan">
                                        <option>Chưa nhập</option>
                                        <option>Đã nhập</option>
                                    </select>
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
