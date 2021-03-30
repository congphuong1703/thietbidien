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
    <link href="/css/app.css" rel="stylesheet" rel="stylesheet"/>
    <script src="/js/app.js"></script>

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
<div class="wrapper">
    <nav id="sidebar" class="sidebar">
        <div class="sidebar-content js-simplebar">
            <a class="sidebar-brand" href="#">
                <span class="align-middle">Quang Phúc</span>
            </a>

            <ul class="sidebar-nav">

                <li class="sidebar-item">
                    <a class="sidebar-link" href="/category">
                        <i class="align-middle" data-feather="sliders"></i> <span class="align-middle">Danh mục</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="/product">
                        <i class="fas fa-align-center"></i> <span class="align-middle">Sản phẩm</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="/order">
                        <i class="fas fa-shopping-cart"></i> <span class="align-middle">Đơn hàng</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="/supplier">
                        <i class="fas fa-truck"></i> <span
                            class="align-middle">Nhà cung cấp</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="/customer">
                        <i class="fas fa-user-tie"></i> <span class="align-middle">Khách hàng</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="/user">
                        <i class="fas fa-user"></i> <span class="align-middle">Người dùng</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a data-target="#ui" data-toggle="collapse" class="sidebar-link collapsed">
                        <span class="align-middle" style="
    color: rgba(233,236,239,.5);
"><i class="fas fa-receipt"></i>Phiếu nhập</span>
                    </a>
                    <ul id="ui" class="sidebar-dropdown list-unstyled collapse " data-parent="#sidebar">
                        <li class="sidebar-item"><a class="sidebar-link" href="/receipt/add"><i
                                class="fas fa-plus-circle"></i>Thêm phiếu nhập</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="/receipt"><i class="fas fa-list"></i>Danh
                            sách phiếu nhập</a></li>
                    </ul>
                </li>

                <li class="sidebar-item">
                    <a data-target="#forms" data-toggle="collapse" class="sidebar-link collapsed">
                        <span class="align-middle" style="
    color: rgba(233,236,239,.5);
"><i class="fas fa-comments-dollar"></i>Thống kê</span>
                    </a>
                    <ul id="forms" class="sidebar-dropdown list-unstyled collapse " data-parent="#sidebar">
                        <li class="sidebar-item"><a class="sidebar-link" href="/reportRevenue"><i
                                class="fas fa-donate"></i>Thống kê doanh thu</a>
                        </li>
                        <li class="sidebar-item"><a class="sidebar-link" href="/reportProduct"><i
                                class="fas fa-box-open"></i>Thống kê hàng hóa</a>
                        </li>
                        <li class="sidebar-item"><a class="sidebar-link" href="/reportCost"><i
                                class="fas fa-donate"></i>Thống kê chi phí nhập
                            hàng</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="/reportProfit"><i
                                class="fas fa-percentage"></i>Thống kê lợi nhuận</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>

    <div class="main">
        <nav class="navbar navbar-expand navbar-light navbar-bg">
            <a class="sidebar-toggle d-flex">
                <i class="hamburger align-self-center"></i>
            </a>
            <div class="navbar-collapse collapse">
                <ul class="navbar-nav navbar-align">
                    <li class="nav-item dropdown">
                        <a class="nav-icon dropdown-toggle d-inline-block d-sm-none" href="#" data-toggle="dropdown">
                            <i class="align-middle" data-feather="settings"></i>
                        </a>
                        <a class="nav-link dropdown-toggle d-none d-sm-inline-block" href="#" data-toggle="dropdown">
                            <span class="text-dark">Welcome</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                            <a class="dropdown-item" href="/logout">Log out</a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
        <main class="content">
            <div class="container-fluid p-0">
                <div class="row">
                    <div class="col-xl-12 col-xxl-12 d-flex">
                        <jsp:include page="${param.layoutmenu }"></jsp:include>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>
</body>
</html>