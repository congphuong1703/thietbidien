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
                <form:form modelAttribute="userModel" action="/user/add" method="post" onsubmit="return simpleValidation()">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Người dùng</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body form-custom">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>ID</label>
                                    <form:input path="id" id="id" readonly="true" type="text"
                                                class="form-control"
                                                placeholder="ID"/>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Tên người dùng</label>
                                    <form:input path="name" id="name" type="text"
                                                class="form-control"
                                                placeholder="Tên người dùng"/>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Email</label>
                                    <form:input path="email" id="email" type="email" class="form-control"
                                                placeholder="email"/>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Địa chỉ</label>
                                    <form:input path="adress" id="adress" type="text" class="form-control"
                                                placeholder="Địa chỉ"/>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Số điện thoại</label>
                                    <form:input path="phonenumber" id="phonenumber" type="text" class="form-control"
                                                placeholder="Số điện thoại"/>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Ngày sinh</label>
                                    <form:input path="dateOfBirth" id="dateOfBirth" type="date" class="form-control"
                                                placeholder="Ngày sinh"/>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Mật khẩu</label>
                                    <form:input path="pass" id="pass" type="password" class="form-control"
                                                placeholder="Mật khẩu"/>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-check" id="idQuyen">
                                    <label>Quản lý</label>
                                    <form:radiobutton path="idQuyen" data-idQuyen="1" name="idQuyen" value="1"
                                                      checked="true"/> <br>
                                    <label>Nhân viên</label>
                                    <form:radiobutton path="idQuyen" name="idQuyen" data-idQuyen="2" value="2"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                        <button type="submit" class="btn btn-success">Lưu</button>
                    </div>
                </form:form>
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
                                Bạn có chắc chắn xóa người dùng này không?
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
                    <a class="btn btn-danger" id="methodDelete">Xóa</a>
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
            <div style="margin-bottom: 10px">
                <button class="btn btn-outline-primary" id="add" data-toggle="modal"
                        data-target="#exampleModal">
                    Thêm người dùng
                </button>
            </div>
            <c:if test="${insertSuccess}">
                <div class="alert alert-success">
                    <strong>Success!</strong> Thêm mới thành công
                </div>
            </c:if>
            <c:if test="${updateSuccess}">
                <div class="alert alert-success" >
                    <strong>Success!</strong> Cập nhật thành công
                </div>
            </c:if>
            <c:if test="${deleteSuccess}">
                <div class="alert alert-success">
                    <strong>Success!</strong> Xóa thành công
                </div>
            </c:if>
            <c:if test="${fail}">
                <div class="alert alert-danger">
                    <strong>Danger!</strong> Thất bại.
                </div>
            </c:if>
            <div class="row">
                <div class="col-12">
                    <div class="table-responsive">
                        <table id="dtHorizontalVerticalExample" class="table table-striped table-hover table-sm"
                               cellspacing="0"
                               width="100%">
                            <thead>
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
                                                data-target="#exampleModal"
                                                id="${user.id}"
                                                data-id="${user.id}"
                                                data-name="${user.name}"
                                                data-email="${user.email}"
                                                data-adress="${user.adress}"
                                                data-phonenumber="${user.phonenumber}"
                                                data-dateOfBirth="${user.dateOfBirth}"
                                                data-pass="${user.pass}"
                                                data-idQuyen="${user.idQuyen}"
                                                onclick="updateUser(${user.id})"><i
                                                class="fas fa-pen"></i>
                                            Sửa
                                        </button>
                                        <button type="button" class="btn btn-danger" data-toggle="modal"
                                                data-target="#exampleModal1"
                                                onclick="deleteUser(${user.id})"><i class=" fas fa-trash-alt
                                        "></i>
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
<script src="/js/user.js"></script>
<div class="modal fade" id="notification" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="notify">Thông báo</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body form-custom">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Xóa thành công</label><br>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" id="closeNotify" onclick="reloadPage()" class="btn btn-default" data-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>

