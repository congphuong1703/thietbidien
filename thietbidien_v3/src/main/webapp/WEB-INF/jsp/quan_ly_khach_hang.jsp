<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                                <th scope="col">ID</th>
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
                                    <button type="button" class="btn btn-primary" id="btn-tim-kiem"><i
                                            class="fas fa-search"></i> Tìm kiếm
                                    </button>
                                </td>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${customers}" varStatus="stt" var="customer">
                                <tr>
                                    <th scope="row">${stt.index}</th>
                                    <td value="${customer.id}">${customer.id}</td>
                                    <td value="${customer.name}">${customer.name}</td>
                                    <td value="${customer.phoneNumber}">${customer.phoneNumber}</td>
                                    <td value="${customer.email}">${customer.email}</td>
                                    <td value="${customer.adress}">${customer.adress}</td>
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
