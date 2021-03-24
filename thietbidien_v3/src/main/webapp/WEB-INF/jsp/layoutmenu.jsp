<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 30-Jan-21
  Time: 11:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="/css/custom.scss" rel="stylesheet" type="text/css" />
    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"  />
</head>
<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <div class="col-md-3 left_col">
            <div class="left_col scroll-view">
                <div class="navbar nav_title" style="border: 0;">
                    <a href="layout.jsp" class="site_title"><span>QUANG PHÚC</span></a>
                </div>

                <div class="clearfix"></div>

                <!-- menu profile quick info -->
                <div class="profile clearfix">
                    <div class="profile_pic">
                        <img src="admin/images/img.jpg" alt="..." class="img-circle profile_img">
                    </div>
                    <div class="profile_info">
                        <span>Welcome,</span>
                        <h2>John Doe</h2>
                    </div>
                </div>
                <!-- /menu profile quick info -->

                <br />

                <!-- sidebar menu -->
                <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                    <div class="menu_section">
                        <ul class="nav side-menu">
                            <li><a href="/category"><i class="fa fa-edit"></i> Quản lý danh mục sản phẩm <span class="fa fa-chevron-down"></span></a></li>
                            <li><a href="/product"><i class="fa fa-gift"></i> Quản lý sản phẩm <span class="fa fa-chevron-down"></span></a></li>
                            <li><a href="/order"><i class="fa fa-shopping-bag"></i> Quản lý đơn hàng <span class="fa fa-chevron-down"></span></a></li>
                            <li><a href="/supplier"><i class="fa fa-truck"></i> Quản lý nhà cung cấp <span class="fa fa-chevron-down"></span></a></li>
                            <li><a href="quan-ly-khach-hang.tiles"><i class="fa fa-male"></i> Danh sách khách hàng <span class="fa fa-chevron-down"></span></a></li>
                            <li><a><i class="fa fa-clipboard"></i> Quản lý phiếu nhập <span class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu">
                                    <li><a href="them-phieu-nhap.tiles">Thêm phiếu nhập</a></li>
                                    <li><a href="danh-sach-phieu-nhap.tiles">Danh sách phiếu nhập</a></li>
                                </ul>
                            </li>
                            <li><a href="quan-ly-nguoi-dung.tiles"><i class="fa fa-male"></i> Quản lý người dùng <span class="fa fa-chevron-down"></span></a></li>
                            <li><a><i class="far fa-chart-bar"></i> Thống kê <span class="fa fa-chevron-down"></span></a>
                                <ul class="nav child_menu">
                                    <li><a href="thong-ke-doanh-thu.tiles">Thống kê doanh thu</a></li>
                                    <li><a href="thong-ke-hang-hoa.tiles">Thống kê hàng hóa</a></li>
                                    <li><a href="thong-ke-chi-phi-nhap.tiles">Thống kê chi phí nhập hàng</a></li>
                                    <li><a href="thong-ke-loi-nhuan.tiles">Thống kê lợi nhuận </a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>

                </div>
                <!-- /sidebar menu -->

                <!-- /menu footer buttons -->
                <div class="sidebar-footer hidden-small">
                    <a data-toggle="tooltip" data-placement="top" title="Settings">
                        <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
                    </a>
                    <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                        <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
                    </a>
                    <a data-toggle="tooltip" data-placement="top" title="Lock">
                        <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
                    </a>
                    <a data-toggle="tooltip" data-placement="top" title="Logout" href="admin/view/login.jsp">
                        <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
                    </a>
                </div>
                <!-- /menu footer buttons -->
            </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
            <div class="nav_menu">
                <div class="nav toggle">
                    <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                </div>
                <nav class="nav navbar-nav">
                    <ul class=" navbar-right">
                        <li class="nav-item dropdown open" style="padding-left: 15px;">
                            <a href="javascript:;" class="user-profile dropdown-toggle" aria-haspopup="true" id="navbarDropdown" data-toggle="dropdown" aria-expanded="false">
                                <img src="admin/images/img.jpg" alt="">John Doe
                            </a>
                            <div class="dropdown-menu dropdown-usermenu pull-right" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item"  href="javascript:;">Help</a>
                                <a class="dropdown-item"  href="admin/view/login.jsp"><i class="fa fa-sign-out-alt"></i> Log Out</a>
                            </div>
                        </li>
                    </ul>
                </nav>
            </div>
            <jsp:include page="${param.layoutmenu }"></jsp:include>
        </div>
        <footer>
            <div class="clearfix"></div>
        </footer>
    </div>
</div>
<script src="/js/jquery.min.js"></script>
</body>
</html>