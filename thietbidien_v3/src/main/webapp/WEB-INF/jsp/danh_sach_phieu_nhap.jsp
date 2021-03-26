<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
                            <c:forEach varStatus="stt" items="${receipts}" var="receipt">
                                <tr>
                                    <th scope="row">${stt.index}</th>
                                    <td value="${receipt.id}">${receipt.id}</td>
                                    <td value="${receipt.idUser}">${receipt.idUser}</td>
                                    <td value="${receipt.idSupplier}">${receipt.idSupplier}</td>
                                    <td value="${receipt.timeCreate}">${receipt.timeCreate}</td>
                                    <td value="${receipt.note}">${receipt.note}</td>
                                    <c:choose>
                                        <c:when test="${!receipt.statusEnter}">
                                            <td value="${receipt.statusEnter}" class="text-center"><span
                                                    class="badge badge-danger">Chưa nhập</span></td>
                                        </c:when>
                                        <c:otherwise>
                                            <td value="${receipt.statusEnter}" class="text-center"><span
                                                    class="badge badge-success">Đã nhập</span></td>
                                        </c:otherwise>
                                    </c:choose>
                                    <td>
                                        <a class="btn btn-info" href="/receiptDetail/findById?id=${receipt.id}">Xem chi
                                            tiết</a>
                                    </td>
                                    <td>
                                        <select class="form-control select-dsdh-htthanh-toan">
                                            <option>Chưa nhập</option>
                                            <option>Đã nhập</option>
                                        </select>
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
