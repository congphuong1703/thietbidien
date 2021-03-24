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

    <title>Đăng nhập</title>

</head>

<body class="login">
<div>
    <a class="hiddenanchor" id="signup"></a>
    <a class="hiddenanchor" id="signin"></a>

    <div class="login_wrapper">
        <div class="animate form login_form">
            <section class="login_content">
                <form class="form" action="actionlogin" >
                    <h1>Login Form</h1>
                    <input name="username" type="text" placeholder="Username" required="required" maxlength="50"
                           autocomplete="off">
                    <input name="password" type="password" placeholder="Password" required="required" maxlength="100"
                           autocomplete="off">
                    <button type="submit" id="login-button">Login</button>
                </form>
            </section>
        </div>
    </div>
</div>
</body>
</html>

