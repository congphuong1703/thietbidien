<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 25-Feb-21
  Time: 11:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<main>
    <!-- Modal -->

    <div class="title-page mt-4">
        <div class="container">
            <div class="row">
                <div class="col-12 text-center">
                    <h1>Thống Kê Hàng Hóa</h1>
                </div>
                <div class="col-12">
                    <hr>
                </div>
            </div>
        </div>
    </div>
    <div class="tool-page pb-4">
        <div class="container">
            <div class="row">
                <div class="col-md-4 mt-1 hienthi">
                    Hiển thị bản ghi <input type="text" readonly style="width:30px">
                </div>
                <div class="col-md-4 mt-1">
                    <select class="form-control select-dsdh-htthanh-toan">
                        <option>Tình trạng</option>
                        <option> Còn </option>
                        <option> Hết</option>
                        <option> Ít hơn 5 sản phẩm</option>
                    </select>
                </div>
                <div class="col-md-4 mt-1">
                    <select class="form-control select-dsdh-htthanh-toan">
                        <option>Danh mục sản phẩm</option>
                        <option> Dây điện </option>
                        <option> Cáp điện</option>
                    </select>
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
                                <th scope="col">Ảnh</th>
                                <th scope="col">Mã sản phẩm</th>
                                <th scope="col">Tên sản phẩm</th>
                                <th scope="col">Giá bán</th>
                                <th scope="col">Số lượng</th>
                                <th scope="col">Mô tả</th>
                                <th scope="col">Thông số kỹ thuật</th>
                                <th scope="col">Bảo hành</th>
                                <th scope="col">Đơn vị tính</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td></td>
                                <td>SP112</td>
                                <td>Dây điện Cadivi</td>
                                <td>50000</td>
                                <td>50</td>
                                <td>Dây điện</td>
                                <td>15A</td>
                                <td>2</td>
                                <td>Dây</td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td></td>
                                <td>SP115</td>
                                <td>Dây điện Cadivi</td>
                                <td>50000</td>
                                <td>50</td>
                                <td>Dây điện</td>
                                <td>15A</td>
                                <td>2</td>
                                <td>Dây</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
