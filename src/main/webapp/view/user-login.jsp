<%@ page import="com.luv2code.Entity.Student" %><%--
  Created by IntelliJ IDEA.
  User: quanhaonan
  Date: 12/5/20
  Time: 3:40 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="${contextPath}/img/favicon.ico"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${contextPath}/css/loginform/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${contextPath}/css/loginform/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${contextPath}/css/loginform/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${contextPath}/css/loginform/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${contextPath}/css/loginform/animsition.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${contextPath}/css/loginform/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${contextPath}/css/loginform/daterangepicker.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${contextPath}/css/loginform/util.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}/css/loginform/main.css">
    <!--===============================================================================================-->
</head>
<body>

<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
            <form class="login100-form validate-form p-l-55 p-r-55 p-t-178" action="${contextPath}/user/login" method="post">
					<span class="login100-form-title">
						Sign In
					</span>

                <div class="wrap-input100 validate-input m-b-16" data-validate="Please enter username">
                    <input class="input100" type="text" name="username" placeholder="Username">
                    <span class="focus-input100"></span>
                </div>

                <div class="wrap-input100 validate-input" data-validate = "Please enter password">
                    <input class="input100" type="password" name="password" placeholder="Password">
                    <span class="focus-input100"></span>
                </div>

                <div class="text-right p-t-13 p-b-23">
						<span class="txt1">
							Forgot
						</span>

                    <a href="#" class="txt2">
                        Username / Password?
                    </a>
                </div>
                <c:if test="${message!=null}">
                    <span style="color: red">${message}</span>
                </c:if>
                <div class="container-login100-form-btn">
                    <input class="login100-form-btn" type="submit"  value="Sign In">
<%--                        Sign in--%>
                </div>

                <div class="flex-col-c p-t-170 p-b-40">
						<span class="txt1 p-b-9">
							Don’t have an account?
						</span>

                    <a href="${contextPath}/user/showRegisterForm" class="txt3">
                        Sign up now
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>


<!--===============================================================================================-->
<script src="${contextPath}/js/loginform/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
<script src="${contextPath}/js/loginform/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="${contextPath}/js/loginform/popper.js"></script>
<script src="${contextPath}/js/loginform/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script src="${contextPath}/js/loginform/select2.min.js"></script>
<!--===============================================================================================-->
<script src="${contextPath}/js/loginform/moment.min.js"></script>
<script src="${contextPath}/js/loginform/daterangepicker.js"></script>
<!--===============================================================================================-->
<script src="${contextPath}/js/loginform/countdowntime.js"></script>
<!--===============================================================================================-->
<script src="${contextPath}/js/loginform/main.js"></script>
<script>
    function checkPassword(){

    }
</script>
</body>
</html>


