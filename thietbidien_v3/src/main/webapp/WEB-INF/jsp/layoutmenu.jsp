<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="/vendor/bootstrap/css/jquery.dataTables.css" rel="stylesheet"/>
    <link href="/css/style.css" rel="stylesheet" rel="stylesheet"/>

    <script src="/vendor/jquery/jquery.min.js"></script>
    <script src="/vendor/jquery/jquery.dataTables.js"></script>
    <script src="/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="/vendor/bootstrap/js/proper.min.js"></script>
    <script src="/js/myjs.js"></script>
</head>
<body class="nav-md">
<div class="bs-example" style="padding: 0 5%">
    <nav class="navbar navbar-expand-md navbar-dark bg-primary">
        <a href="#" class="navbar-brand">Quang Phúc</a>
        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
            <div class="navbar-nav">
                <a class="nav-item nav-link active" href="/category"><i class="fa fa-edit"></i>Danh mục<span
                        class="fa fa-chevron-down"></span></a>
                <a class="nav-item nav-link active" href="/product"><i class="fa fa-gift"></i>Sản phẩm<span
                        class="fa fa-chevron-down"></span></a>
                <a class="nav-item nav-link active" href="/order"><i class="fa fa-shopping-bag"></i>Đơn hàng<span
                        class="fa fa-chevron-down"></span></a>
                <a class="nav-item nav-link active" href="/supplier"><i class="fa fa-truck"></i>Nhà cung cấp<span
                        class="fa fa-chevron-down"></span></a>
                <a class="nav-item nav-link active" href="/customer"><i class="fa fa-male"></i>Khách hàng<span
                        class="fa fa-chevron-down"></span></a>
                <a class="nav-item nav-link active" href="/user"><i class="fa fa-male"></i>Người dùng<span
                        class="fa fa-chevron-down"></span></a>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Phiếu nhập</a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="/receipt/add">Thêm phiếu nhập</a>
                        <a class="dropdown-item" href="/receipt">Danh sách phiếu nhập</a>
                    </div>
                </div>
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Thống kê</a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="/reportRevenue">Thống kê doanh thu</a>
                        <a class="dropdown-item" href="/reportProduct">Thống kê hàng hóa</a>
                        <a class="dropdown-item" href="/reportCost">Thống kê chi phí nhập hàng</a>
                        <a class="dropdown-item" href="/reportProfit">Thống kê lợi nhuận </a>
                    </div>
                </div>
            </div>
            <div class="navbar-nav">
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Xin chào,${name}</a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="/logout">Đăng xuất</a>
                    </div>
                </div>
            </div>
        </div>
    </nav>
</div>
<div style="padding:10px">
    <div class="main_container">
        <jsp:include page="${param.layoutmenu }"></jsp:include>
        <footer>
            <div class="clearfix"></div>
        </footer>
    </div>
</div>
</body>
</html>