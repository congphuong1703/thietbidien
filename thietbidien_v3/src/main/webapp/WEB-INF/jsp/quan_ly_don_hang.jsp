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
                    <h1>Quản Lý Đơn Hàng</h1>
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
                <div class="col-md-2 mt-1 hienthi">
                    Hiển thị bản ghi <input type="text" readonly style="width:30px;">
                </div>
                <div class="col-md-2 mt-1">
                    <select class="form-control select-dsdh-htthanh-toan">
                        <option>Danh sách đơn hàng theo hình thức thanh toán</option>
                        <option>Nhận hàng mới thanh toán</option>
                        <option>Chuyển khoản</option>
                    </select>
                </div>
                <div class="col-md-2 mt-1">
                    <select class="form-control select-dsdh-thanh-toan" id="status-payment">
                        <option value="false">Danh sách đơn hàng theo trạng thái thanh toán</option>
                        <option value="true">Chưa thanh toán</option>
                        <option>Đã thanh toán</option>
                    </select>
                </div>
                <div class="col-md-2 mt-1">
                    <select class="form-control select-dsdh-trang-thai">
                        <option>Danh sách đơn hàng theo trạng thái đơn hàng</option>
                        <option>Chưa xác nhận</option>
                        <option>Xác nhận</option>
                        <option>Đang giao</option>
                        <option>Hoàn thành</option>
                        <option>Đã hủy</option>
                    </select>
                </div>
                <div class="col-md-4 mt-1 search">
                    <input type="search" name="" id="search-by-id" class="form-control" value="" style="width:200px;">
                    <button type="button" class="btn btn-primary" onclick="searchById()">Tìm kiếm</button>
                </div>
            </div>
        </div>
    </div>
    <br>
    <div class="table-data">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="table-reponsive">
                        <table class="table table-hover table-bordered">
                            <thead>
                            <tr>
                                <th scope="col">Mã đơn hàng</th>
                                <th scope="col">Thời gian đặt</th>
                                <th scope="col">Trạng thái đơn hàng</th>
                                <th scope="col">Hình thức thanh toán</th>
                                <th scope="col">Trạng thái thanh toán</th>
                                <th scope="col">Chi tiết đơn hàng</th>
                                <th scope="col">Cập nhật trạng thái thanh toán</th>
                                <th scope="col">Cập nhật trạng thái đơn hàng</th>
                            </tr>
                            </thead>
                            <tbody id="tbody-san-pham">
                            <tr>
                                <td>4</td>
                                <td>01/02/2020</td>
                                <td class="text-center"><span class="badge badge-success">Xác nhận</span></td>
                                <td>Chuyển khoản</td>
                                <td class="text-center"><span class="badge badge-success">Đã thanh toán</span></td>
                                <td>
                                    <button type="button" class="btn btn-info">Xem chi tiết</button>
                                </td>
                                <td>
                                    <select class="form-control select-thanh-toan">
                                        <option>Chưa thanh toán</option>
                                        <option>Đã thanh toán</option>
                                    </select>
                                </td>
                                <td>
                                    <select class="form-control select-trang-thai" >
                                        <option>Chưa xác nhận</option>
                                        <option>Xác nhận</option>
                                        <option>Đang giao</option>
                                        <option>Hoàn thành</option>
                                        <option>Đã hủy</option>
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
<script src="admin/ajax/quan-ly-don-hang.js" charset="utf-8"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous"></script>
