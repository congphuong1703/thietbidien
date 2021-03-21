<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 25-Feb-21
  Time: 8:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<main>
    <div class="title-page mt-4">
        <div class="container">
            <div class="row">
                <div class="col-12 text-center">
                    <h1>Danh Sách Khách Hàng</h1>
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
                <div class="col-md-12 mt-1 hienthi">
                    Hiển thị bản ghi <input type="text" readonly style="width:30px">
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
                                <th scope="col">STT</th>
                                <th scope="col">Họ và tên</th>
                                <th scope="col">Số điện thoại</th>
                                <th scope="col">Email</th>
                                <th scope="col">Địa chỉ</th>
                                <th scope="col" style="width: 175px;">Hành Động</th>
                            </tr>
                            <tr>
                                <th scope="row"></th>
                                <td><input type="text" class="form-control" id="input-search-ten"></td>
                                <td><input type="text" class="form-control" id="input-search-sdt"></td>
                                <td><input type="text" class="form-control" id="input-search-email"></td>
                                <td><input type="text" class="form-control" id="input-search-dia-chi"></td>
                                <td>
                                    <button type="button" class="btn btn-primary" id="btn-tim-kiem"><i class="fas fa-search"></i> Tìm kiếm</button>
                                </td>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>Hoai</td>
                                <td>094358496</td>
                                <td>hoai@gmail.com</td>
                                <td>Bắc Giang</td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>Hoai</td>
                                <td>094358496</td>
                                <td>hoai@gmail.com</td>
                                <td>Bắc Giang</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
