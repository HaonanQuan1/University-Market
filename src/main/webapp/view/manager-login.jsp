<%--
  Created by IntelliJ IDEA.
  User: quanhaonan
  Date: 12/17/20
  Time: 12:55 上午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="mes" value="${message}"/>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">
<%--<head>--%>
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>
<title>Insert title here</title>
<!-- bootstrap -->
<script src="https://code.jquery.com/jquery-1.11.1.min.js"
        integrity="sha256-VAvG3sHdS5LqTT+5A/aeq/bZGa/Uj04xKxY8KM/w9EE="
        crossorigin="anonymous"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
<c:set var="mes" value="${message}"/>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%--<c:set var="student" value="${sessionScope.student}"/>--%>
<%--<c:if test="${student != null}">--%>
<%--</c:if>--%>
<div id="login-overlay" class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <div class="container"></div>
            <!-- <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button> -->
            <h4 class="modal-title" id="myModalLabel">Login Now!</h4>
        </div>
        <div class="modal-body">
            <div class="row">
                <div class="col-xs-6">
                    <div class="well">
                        <form id="loginForm" method="POST" action="${contextPath}/manager/loginForm" novalidate="novalidate">
                            <div class="form-group">
                                <label for="username" class="control-label">Username</label>
                                <input type="text" class="form-control" id="username" name="username" value="" required="required" title="Please enter you username" >
                                <span class="help-block"></span>
                            </div>
                            <div class="form-group">
                                <label for="password" class="control-label">Password</label>
                                <input type="password" class="form-control" id="password" name="password" value="" required="required" title="Please enter your password">
                                <span class="help-block"></span>
                            </div>
<%--                            <div class="form-group">--%>
<%--                                <label class="control-label">You Are?</label>--%>
                                <c:if test="${mes != null}">
                                    <p style="color: red">${mes}!</p>
                                </c:if>
<%--                            </div>--%>
                            <!-- <div id="loginErrorMsg" class="alert alert-error hide">Wrong username og password</div>  -->
<%--                            <div class="checkbox">--%>
<%--                                <label>--%>
<%--                                    <input type="checkbox" name="remember" id="remember"> Remember login--%>
<%--                                </label>--%>
<%--                                <p class="help-block">(if this is a private computer)</p>--%>
<%--                            </div>--%>
                            <button type="submit" class="btn btn-success btn-block">Login</button>
<%--                            <a href="${contextPath}/user/forgotpassword.htm" class="btn btn-info btn-block">Forget Password</a>--%>
                        </form>
                    </div>
                </div>
                <div class="col-xs-6">
                    <p class="lead">Register now for <span class="text-success">FREE</span></p>
                    <ul class="list-unstyled" style="line-height: 2">
                        <li><span class="fa fa-check text-success"></span> Sell Your Own Used stuffs</li>
                        <li><span class="fa fa-check text-success"></span> Purchase Used products Like Books</li>
                        <li><span class="fa fa-check text-success"></span> Save Your Money</li>
                        <li><span class="fa fa-check text-success"></span> Deal With Your Classmates</li>
<%--                        <li><span class="fa fa-check text-success"></span> Search medical records</li>--%>
                    </ul>
                    <p><a href="${contextPath}/user/showRegisterForm" class="btn btn-info btn-block">Yes please, register now!</a></p>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
