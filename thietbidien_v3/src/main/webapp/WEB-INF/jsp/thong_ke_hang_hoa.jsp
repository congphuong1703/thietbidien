<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <div class="table-data">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="table-responsive">
                        <table id="dtHorizontalVerticalExample" class="table table-striped table-hover table-sm"
                               cellspacing="0"
                               width="100%">
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
                            <c:forEach items="${products}" var="product" varStatus="stt">
                                <tr>
                                    <th scope="row">${stt.index}</th>
                                    <td value="${product.image}"><img src="${product.image}"/></td>
                                    <td value="${product.id}">${product.id}</td>
                                    <td value="${product.name}">${product.name}</td>
                                    <td value="${product.price}">${product.price}</td>
                                    <td value="${product.amount}">${product.amount}</td>
                                    <td value="${product.description}">${product.description}</td>
                                    <td value="${product.specification}">${product.specification}</td>
                                    <td value="${product.guarantee}">${product.guarantee}</td>
                                    <td value="${product.unit}">${product.unit}</td>
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
