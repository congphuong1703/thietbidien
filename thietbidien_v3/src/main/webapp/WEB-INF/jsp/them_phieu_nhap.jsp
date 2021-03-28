<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                                <label>Sản phẩm</label>
                                <select id="select-product" class="form-control">
                                    <c:forEach items="${products}" varStatus="stt" var="product">
                                        <option name="${product.name}" value="${product.id}"
                                                id="${product.id}">${product.id} || ${product.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Số lượng</label>
                                <input type="number" class="form-control" id="input-number" required
                                       placeholder="Nhập số lượng">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Đơn giá</label>
                                <input type="number" class="form-control" id="input-price" required
                                       placeholder="Nhập đơn giá">
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
    <div class="tool-page" style="margin-bottom: 10px">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <button id="btn-add-product" type="button" class="btn btn-primary" data-toggle="modal"
                            data-target="#exampleModal"><i class="fas fa-plus"></i> Thêm sản phẩm
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="table-data">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="table-responsive">
                        <table class="table table-striped table-hover table-sm" cellspacing="0" width="100%">
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
                                <td name="id" value="4">4</td>
                                <td name="name">Dây điện vinacap</td>
                                <td name="amount">40</td>
                                <td name="price">50000</td>
                                <td name="total">200000</td>
                                <td>
                                    <button type="button" class="btn btn-warning" data-toggle="modal"
                                            data-target="#exampleModal"><i class="fas fa-pen"></i>
                                        Sửa
                                    </button>
                                    <button type="button" class="btn btn-danger"
                                    ><i class="fas fa-trash-alt"></i>
                                        Xóa
                                    </button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label style="color: rgb(48, 45, 45);font-size: 16px;">Ghi chú</label>
                        <textarea class="form-control" id="textarea-note"
                                  rows="3"></textarea>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="nut-cap-nhat">
                        <button id="btn-add-receipt" onclick="addReceipt()" type="button" class="btn btn-primary"
                                data-toggle="modal">Lưu phiếu nhập
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<script src="/js/receipt.js"></script>
