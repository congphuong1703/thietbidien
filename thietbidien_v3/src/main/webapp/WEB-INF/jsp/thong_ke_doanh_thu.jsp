<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<main>
    <!-- Modal -->

    <div class="title-page mt-4">
        <div class="container">
            <div class="row">
                <div class="col-12 text-center">
                    <h1>Thống Kê Doanh Thu</h1>
                </div>
                <div class="col-12">
                    <hr>
                </div>
            </div>
        </div>
    </div>
    <%--<div class="tool-page pb-4">
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
    </div>--%>
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
                                <th scope="col">Mã đơn hàng</th>
                                <th scope="col">Tổng số sản phẩm</th>
                                <th scope="col">Ngày lập</th>
                                <th scope="col">Số tiền thu được</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${listReport}" var="list" varStatus="stt">
                                <tr>
                                    <th scope="row">${stt.index}</th>
                                    <td> ${list.get('idOrder')}</td>
                                    <td> ${list.get('totalProduct')}</td>
                                    <td> ${list.get('date')}</td>
                                    <td> ${list.get('revenue')}</td>
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
    <div class="tong-doanh-thu text-center" style="color: brown; font-size: 18px;">
        <label>Tổng doanh thu:</label>&nbsp;&nbsp;<span>${total}</span>
    </div>
</main>
