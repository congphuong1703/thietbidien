<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<main>
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Quản Lý Người Dùng</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body form-custom">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Họ và tên</label>
                                <input type="text" class="form-control" id="input-ten1" placeholder="Nhập họ tên">
                                <div class="invalid-feedback">
                                    Error!
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Email</label>
                                <input type="text" class="form-control" id="input-ten" placeholder="Nhập email">
                                <div class="invalid-feedback">
                                    Error!
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Địa chỉ</label>
                                <input type="text" class="form-control" id="input-ten2" placeholder="Nhập địa chỉ">
                                <div class="invalid-feedback">
                                    Error!
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Số điện thoại</label>
                                <input type="number" class="form-control" id="input-ten3"
                                       placeholder="Nhập số điện thoại">
                                <div class="invalid-feedback">
                                    Error!
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Ngày sinh</label>
                                <input type="date" class="form-control" id="input-ten4" placeholder="Nhập ngày sinh">
                                <div class="invalid-feedback">
                                    Error!
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="exampleInputPassword1">Mật khẩu</label>
                                <input type="password" class="form-control" id="exampleInputPassword1"
                                       placeholder="Password">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Quyền</label>
                                <select id="select-loai-san-pham" class="form-control select-loai-san-pham">
                                    <option value="1">Quản lý</option>
                                    <option value="2">Nhân viên bán hàng</option>
                                </select>
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
                    <h1>Quản Lý Người Dùng</h1>
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
                                   width="100%">      <thead>
                            <tr>
                               <th>STT</th>
                               <th>ID</th>
                               <th>Họ và tên</th>
                               <th>Email</th>
                               <th>Địa chỉ</th>
                               <th>Số điện thoại</th>
                               <th>Ngày sinh</th>
                               <th>Quyền</th>
                                <th scope="col">Hành động</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${users}" var="user" varStatus="stt">
                                <tr>
                                    <th scope="row">${stt.index}</th>
                                    <td value="${user.id}">${user.id}</td>
                                    <td value="${user.name}">${user.name}</td>
                                    <td value="${user.email}">${user.email}</td>
                                    <td value="${user.adress}">${user.adress}</td>
                                    <td value="${user.phonenumber}">${user.phonenumber}</td>
                                    <td value="${user.dateOfBirth}">${user.dateOfBirth}</td>
                                    <c:choose>
                                        <c:when test="${user.idQuyen == 1}">
                                            <td value="${user.idQuyen}">Quản lý</td>
                                        </c:when>
                                        <c:otherwise>
                                            <td value="${user.idQuyen}">Nhân viên</td>
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
