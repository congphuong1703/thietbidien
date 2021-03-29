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
    <link href="/css/app.css" rel="stylesheet" rel="stylesheet"/>


    <script src="/vendor/jquery/jquery.min.js"></script>
    <script src="/vendor/jquery/jquery.dataTables.js"></script>
    <script src="/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="/vendor/bootstrap/js/proper.min.js"></script>
    <script src="/js/myjs.js"></script>
    <script src="/js/app.js"></script>
</head>
<body class="nav-md">
<div class="wrapper">
    <nav id="sidebar" class="sidebar">
        <div class="sidebar-content js-simplebar">
            <a class="sidebar-brand" href="index.html">
                <span class="align-middle">AdminKit</span>
            </a>

            <ul class="sidebar-nav">
                <li class="sidebar-header">
                    Pages
                </li>

                <li class="sidebar-item active">
                    <a class="sidebar-link" href="index.html">
                        <i class="align-middle" data-feather="sliders"></i> <span class="align-middle">Dashboard</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="pages-profile.html">
                        <i class="align-middle" data-feather="user"></i> <span class="align-middle">Profile</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="pages-settings.html">
                        <i class="align-middle" data-feather="settings"></i> <span class="align-middle">Settings</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="pages-invoice.html">
                        <i class="align-middle" data-feather="credit-card"></i> <span class="align-middle">Invoice</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="pages-blank.html">
                        <i class="align-middle" data-feather="book"></i> <span class="align-middle">Blank</span>
                    </a>
                </li>

                <li class="sidebar-header">
                    Tools & Components
                </li>
                <li class="sidebar-item">
                    <a data-target="#ui" data-toggle="collapse" class="sidebar-link collapsed">
                        <i class="align-middle" data-feather="briefcase"></i> <span class="align-middle">UI Elements</span>
                    </a>
                    <ul id="ui" class="sidebar-dropdown list-unstyled collapse " data-parent="#sidebar">
                        <li class="sidebar-item"><a class="sidebar-link" href="ui-alerts.html">Alerts</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="ui-buttons.html">Buttons</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="ui-cards.html">Cards</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="ui-general.html">General</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="ui-grid.html">Grid</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="ui-modals.html">Modals</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="ui-typography.html">Typography</a></li>
                    </ul>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="icons-feather.html">
                        <i class="align-middle" data-feather="coffee"></i> <span class="align-middle">Icons</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a data-target="#forms" data-toggle="collapse" class="sidebar-link collapsed">
                        <i class="align-middle" data-feather="check-circle"></i> <span class="align-middle">Forms</span>
                    </a>
                    <ul id="forms" class="sidebar-dropdown list-unstyled collapse " data-parent="#sidebar">
                        <li class="sidebar-item"><a class="sidebar-link" href="forms-layouts.html">Form Layouts</a></li>
                        <li class="sidebar-item"><a class="sidebar-link" href="forms-basic-inputs.html">Basic Inputs</a></li>
                    </ul>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="tables-bootstrap.html">
                        <i class="align-middle" data-feather="list"></i> <span class="align-middle">Tables</span>
                    </a>
                </li>

                <li class="sidebar-header">
                    Plugins & Addons
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="charts-chartjs.html">
                        <i class="align-middle" data-feather="bar-chart-2"></i> <span class="align-middle">Charts</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="maps-google.html">
                        <i class="align-middle" data-feather="map"></i> <span class="align-middle">Maps</span>
                    </a>
                </li>
            </ul>

            <div class="sidebar-cta">
                <div class="sidebar-cta-content">
                    <strong class="d-inline-block mb-2">Upgrade to Pro</strong>
                    <div class="mb-3 text-sm">
                        Are you looking for more components? Check out our premium version.
                    </div>
                    <a href="https://adminkit.io/pricing" target="_blank" class="btn btn-primary btn-block">Upgrade to Pro</a>
                </div>
            </div>
        </div>
    </nav>

    <div class="main">
        <nav class="navbar navbar-expand navbar-light navbar-bg">
            <a class="sidebar-toggle d-flex">
                <i class="hamburger align-self-center"></i>
            </a>

            <form class="d-none d-sm-inline-block">
                <div class="input-group input-group-navbar">
                    <input type="text" class="form-control" placeholder="Search…" aria-label="Search">
                    <button class="btn" type="button">
                        <i class="align-middle" data-feather="search"></i>
                    </button>
                </div>
            </form>

            <div class="navbar-collapse collapse">
                <ul class="navbar-nav navbar-align">
                    <li class="nav-item dropdown">
                        <a class="nav-icon dropdown-toggle" href="#" id="alertsDropdown" data-toggle="dropdown">
                            <div class="position-relative">
                                <i class="align-middle" data-feather="bell"></i>
                                <span class="indicator">4</span>
                            </div>
                        </a>
                        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right py-0" aria-labelledby="alertsDropdown">
                            <div class="dropdown-menu-header">
                                4 New Notifications
                            </div>
                            <div class="list-group">
                                <a href="#" class="list-group-item">
                                    <div class="row g-0 align-items-center">
                                        <div class="col-2">
                                            <i class="text-danger" data-feather="alert-circle"></i>
                                        </div>
                                        <div class="col-10">
                                            <div class="text-dark">Update completed</div>
                                            <div class="text-muted small mt-1">Restart server 12 to complete the update.</div>
                                            <div class="text-muted small mt-1">30m ago</div>
                                        </div>
                                    </div>
                                </a>
                                <a href="#" class="list-group-item">
                                    <div class="row g-0 align-items-center">
                                        <div class="col-2">
                                            <i class="text-warning" data-feather="bell"></i>
                                        </div>
                                        <div class="col-10">
                                            <div class="text-dark">Lorem ipsum</div>
                                            <div class="text-muted small mt-1">Aliquam ex eros, imperdiet vulputate hendrerit et.</div>
                                            <div class="text-muted small mt-1">2h ago</div>
                                        </div>
                                    </div>
                                </a>
                                <a href="#" class="list-group-item">
                                    <div class="row g-0 align-items-center">
                                        <div class="col-2">
                                            <i class="text-primary" data-feather="home"></i>
                                        </div>
                                        <div class="col-10">
                                            <div class="text-dark">Login from 192.186.1.8</div>
                                            <div class="text-muted small mt-1">5h ago</div>
                                        </div>
                                    </div>
                                </a>
                                <a href="#" class="list-group-item">
                                    <div class="row g-0 align-items-center">
                                        <div class="col-2">
                                            <i class="text-success" data-feather="user-plus"></i>
                                        </div>
                                        <div class="col-10">
                                            <div class="text-dark">New connection</div>
                                            <div class="text-muted small mt-1">Christina accepted your request.</div>
                                            <div class="text-muted small mt-1">14h ago</div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="dropdown-menu-footer">
                                <a href="#" class="text-muted">Show all notifications</a>
                            </div>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-icon dropdown-toggle" href="#" id="messagesDropdown" data-toggle="dropdown">
                            <div class="position-relative">
                                <i class="align-middle" data-feather="message-square"></i>
                            </div>
                        </a>
                        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right py-0" aria-labelledby="messagesDropdown">
                            <div class="dropdown-menu-header">
                                <div class="position-relative">
                                    4 New Messages
                                </div>
                            </div>
                            <div class="list-group">
                                <a href="#" class="list-group-item">
                                    <div class="row g-0 align-items-center">
                                        <div class="col-2">
                                            <img src="img/avatars/avatar-5.jpg" class="avatar img-fluid rounded-circle" alt="Vanessa Tucker">
                                        </div>
                                        <div class="col-10 pl-2">
                                            <div class="text-dark">Vanessa Tucker</div>
                                            <div class="text-muted small mt-1">Nam pretium turpis et arcu. Duis arcu tortor.</div>
                                            <div class="text-muted small mt-1">15m ago</div>
                                        </div>
                                    </div>
                                </a>
                                <a href="#" class="list-group-item">
                                    <div class="row g-0 align-items-center">
                                        <div class="col-2">
                                            <img src="img/avatars/avatar-2.jpg" class="avatar img-fluid rounded-circle" alt="William Harris">
                                        </div>
                                        <div class="col-10 pl-2">
                                            <div class="text-dark">William Harris</div>
                                            <div class="text-muted small mt-1">Curabitur ligula sapien euismod vitae.</div>
                                            <div class="text-muted small mt-1">2h ago</div>
                                        </div>
                                    </div>
                                </a>
                                <a href="#" class="list-group-item">
                                    <div class="row g-0 align-items-center">
                                        <div class="col-2">
                                            <img src="img/avatars/avatar-4.jpg" class="avatar img-fluid rounded-circle" alt="Christina Mason">
                                        </div>
                                        <div class="col-10 pl-2">
                                            <div class="text-dark">Christina Mason</div>
                                            <div class="text-muted small mt-1">Pellentesque auctor neque nec urna.</div>
                                            <div class="text-muted small mt-1">4h ago</div>
                                        </div>
                                    </div>
                                </a>
                                <a href="#" class="list-group-item">
                                    <div class="row g-0 align-items-center">
                                        <div class="col-2">
                                            <img src="img/avatars/avatar-3.jpg" class="avatar img-fluid rounded-circle" alt="Sharon Lessman">
                                        </div>
                                        <div class="col-10 pl-2">
                                            <div class="text-dark">Sharon Lessman</div>
                                            <div class="text-muted small mt-1">Aenean tellus metus, bibendum sed, posuere ac, mattis non.</div>
                                            <div class="text-muted small mt-1">5h ago</div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="dropdown-menu-footer">
                                <a href="#" class="text-muted">Show all messages</a>
                            </div>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-icon dropdown-toggle d-inline-block d-sm-none" href="#" data-toggle="dropdown">
                            <i class="align-middle" data-feather="settings"></i>
                        </a>

                        <a class="nav-link dropdown-toggle d-none d-sm-inline-block" href="#" data-toggle="dropdown">
                            <img src="img/avatars/avatar.jpg" class="avatar img-fluid rounded mr-1" alt="Charles Hall" /> <span class="text-dark">Charles Hall</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right">
                            <a class="dropdown-item" href="pages-profile.html"><i class="align-middle mr-1" data-feather="user"></i> Profile</a>
                            <a class="dropdown-item" href="#"><i class="align-middle mr-1" data-feather="pie-chart"></i> Analytics</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="pages-settings.html"><i class="align-middle mr-1" data-feather="settings"></i> Settings & Privacy</a>
                            <a class="dropdown-item" href="#"><i class="align-middle mr-1" data-feather="help-circle"></i> Help Center</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Log out</a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>

        <main class="content">
            <div class="container-fluid p-0">

                <div class="row mb-2 mb-xl-3">
                    <div class="col-auto d-none d-sm-block">
                        <h3><strong>Analytics</strong> Dashboard</h3>
                    </div>

                    <div class="col-auto ml-auto text-right mt-n1">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb bg-transparent p-0 mt-1 mb-0">
                                <li class="breadcrumb-item"><a href="#">AdminKit</a></li>
                                <li class="breadcrumb-item"><a href="#">Dashboards</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Analytics</li>
                            </ol>
                        </nav>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-12 col-xxl-12 d-flex">
                        <jsp:include page="${param.layoutmenu }"></jsp:include>
                    </div>
                </div>

            </div>
        </main>

        <footer class="footer">
            <div class="container-fluid">
                <div class="row text-muted">
                    <div class="col-6 text-left">
                        <p class="mb-0">
                            <a href="index.html" class="text-muted"><strong>AdminKit Demo</strong></a> &copy;
                        </p>
                    </div>
                    <div class="col-6 text-right">
                        <ul class="list-inline">
                            <li class="list-inline-item">
                                <a class="text-muted" href="#">Support</a>
                            </li>
                            <li class="list-inline-item">
                                <a class="text-muted" href="#">Help Center</a>
                            </li>
                            <li class="list-inline-item">
                                <a class="text-muted" href="#">Privacy</a>
                            </li>
                            <li class="list-inline-item">
                                <a class="text-muted" href="#">Terms</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </footer>
    </div>

</div>
<%--<div class="bs-example" style="padding: 0 5%">--%>
<%--    <nav class="navbar navbar-expand-md navbar-dark bg-primary">--%>
<%--        <a href="#" class="navbar-brand">Quang Phúc</a>--%>
<%--        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">--%>
<%--            <span class="navbar-toggler-icon"></span>--%>
<%--        </button>--%>

<%--        <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">--%>
<%--            <div class="navbar-nav">--%>
<%--                <a class="nav-item nav-link active" href="/category"><i class="fa fa-edit"></i>Danh mục<span--%>
<%--                        class="fa fa-chevron-down"></span></a>--%>
<%--                <a class="nav-item nav-link active" href="/product"><i class="fa fa-gift"></i>Sản phẩm<span--%>
<%--                        class="fa fa-chevron-down"></span></a>--%>
<%--                <a class="nav-item nav-link active" href="/order"><i class="fa fa-shopping-bag"></i>Đơn hàng<span--%>
<%--                        class="fa fa-chevron-down"></span></a>--%>
<%--                <a class="nav-item nav-link active" href="/supplier"><i class="fa fa-truck"></i>Nhà cung cấp<span--%>
<%--                        class="fa fa-chevron-down"></span></a>--%>
<%--                <a class="nav-item nav-link active" href="/customer"><i class="fa fa-male"></i>Khách hàng<span--%>
<%--                        class="fa fa-chevron-down"></span></a>--%>
<%--                <a class="nav-item nav-link active" href="/user"><i class="fa fa-male"></i>Người dùng<span--%>
<%--                        class="fa fa-chevron-down"></span></a>--%>
<%--                <div class="nav-item dropdown">--%>
<%--                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Phiếu nhập</a>--%>
<%--                    <div class="dropdown-menu">--%>
<%--                        <a class="dropdown-item" href="/receipt/add">Thêm phiếu nhập</a>--%>
<%--                        <a class="dropdown-item" href="/receipt">Danh sách phiếu nhập</a>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="nav-item dropdown">--%>
<%--                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Thống kê</a>--%>
<%--                    <div class="dropdown-menu">--%>
<%--                        <a class="dropdown-item" href="/reportRevenue">Thống kê doanh thu</a>--%>
<%--                        <a class="dropdown-item" href="/reportProduct">Thống kê hàng hóa</a>--%>
<%--                        <a class="dropdown-item" href="/reportCost">Thống kê chi phí nhập hàng</a>--%>
<%--                        <a class="dropdown-item" href="/reportProfit">Thống kê lợi nhuận </a>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="navbar-nav">--%>
<%--                <div class="nav-item dropdown">--%>
<%--                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Xin chào,${name}</a>--%>
<%--                    <div class="dropdown-menu">--%>
<%--                        <a class="dropdown-item" href="/logout">Đăng xuất</a>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </nav>--%>
<%--</div>--%>

</body>
</html>