<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 25-Feb-21
  Time: 11:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<main>
    <!-- Modal -->

    <div class="title-page mt-4">
        <div class="container">
            <div class="row">
                <div class="col-12 text-center">
                    <h1>Thống Kê Chi Phí Nhập Hàng</h1>
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
                        <option>Tháng</option>
                        <option> 1</option>
                        <option> 2</option>
                        <option> 3</option>
                        <option> 4</option>
                        <option> 5</option>
                    </select>
                </div>
                <div class="col-md-4 mt-1">
                    <select class="form-control select-dsdh-htthanh-toan">
                        <option>Năm</option>
                        <option> 2021</option>
                        <option> 2020</option>
                        <option> 2019</option>
                        <option> 2018</option>
                        <option> 2017</option>
                    </select>
                </div>
            </div>
        </div>
    </div>
    <div class="table-data">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="table-responsive">
                        <table id="dtHorizontalVerticalExample" class="table table-striped table-hover table-sm" cellspacing="0"
                               width="100%">
                            <thead>
                            <tr>
                                <th scope="col">STT</th>
                                <th scope="col">Mã phiếu nhập</th>
                                <th scope="col">Người lập phiếu</th>
                                <th scope="col">Tên nhà cung cấp</th>
                                <th scope="col">Thời gian lập</th>
                                <th scope="col">Ghi chú</th>
                                <th scope="col">Chi phí</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${listReport}" var="list" varStatus="stt">
                                <tr>
                                    <th scope="row">${stt.index}</th>
                                    <td>${list.get('idReceipt')}</td>
                                    <td>${list.get('userName')}</td>
                                    <td>${list.get('supplierName')}</td>
                                    <td>${list.get('dateCreate')}</td>
                                    <td>${list.get('note')}</td>
                                    <td>${list.get('cost')}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>
    <div class="tong-chi-phi text-center" style="color: brown; font-size: 18px;">
        <label >Tổng chi phí:</label>&nbsp;&nbsp;<span>${total}</span>
    </div>
</main>