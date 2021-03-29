<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="/css/mycss.css" rel="stylesheet"/>

    <title>Đăng nhập</title>

</head>
<body class="text-center">

<main class="login-form">
    <div class="cotainer">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">Đăng nhập</div>
                    <div class="card-body">
                        <c:if test="${logoutSuccess}">
                            <div class="alert alert-success">
                                <strong>Success!</strong> Đăng xuất thành công
                            </div>
                        </c:if>
                        <c:if test="${loginFail}">
                            <div class="alert alert-danger">
                                <strong>Danger!</strong>Đăng nhập thất bại
                            </div>
                        </c:if>
                        <form action="actionlogin">
                            <div class="form-group row">
                                <label for="Email" class="col-md-4 col-form-label text-md-right">Email</label>
                                <div class="col-md-6">
                                    <input name="username" id="Email" type="email" placeholder="Email"
                                           required="required" class="form-control" maxlength="50"
                                           autocomplete="off">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="password" class="col-md-4 col-form-label text-md-right">Password</label>
                                <div class="col-md-6">
                                    <input name="password" id="password"  class="form-control" type="password" placeholder="Password"
                                           required="required" maxlength="100"
                                           autocomplete="off">
                                </div>
                            </div>
                            <button type="submit" class="btn btn-primary">Đăng nhập</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>

</main>
</body>
</html>

