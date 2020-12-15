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
    <title>Login V8</title>
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


<%--<html>--%>
<%--<head>--%>
<%--    <c:set var="contextPath" value="${pageContext.request.contextPath}" />--%>
<%--    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>
<%--    <title>Insert title here</title>--%>
<%--    <!-- bootstrap -->--%>
<%--    <script src="https://code.jquery.com/jquery-1.11.1.min.js"--%>
<%--            integrity="sha256-VAvG3sHdS5LqTT+5A/aeq/bZGa/Uj04xKxY8KM/w9EE="--%>
<%--            crossorigin="anonymous"></script>--%>
<%--    <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">--%>
<%--    <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>--%>
<%--    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">--%>
<%--&lt;%&ndash;    <link href="${contextPath}/resource/css/style.css" rel="stylesheet">&ndash;%&gt;--%>
<%--&lt;%&ndash;    <link href="${contextPath}/resource/css/bootstrap.css" rel = "stylesheet" id="bootstrap-css">&ndash;%&gt;--%>
<%--&lt;%&ndash;    <script src = "${contextPath}/resource/js/bootstrap.js"></script>&ndash;%&gt;--%>
<%--&lt;%&ndash;    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">&ndash;%&gt;--%>
<%--&lt;%&ndash;    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>&ndash;%&gt;--%>
<%--&lt;%&ndash;    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>&ndash;%&gt;--%>
<%--    <title>Login</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<c:set var="mes" value="${message}"/>--%>
<%--<c:set var="contextPath" value="${pageContext.request.contextPath}"/>--%>
<%--<c:set var="student" value="${sessionScope.student}"/>--%>
<%--&lt;%&ndash;<c:if test="${student != null}">&ndash;%&gt;--%>
<%--    <%--%>
<%--        HttpSession session = request.getSession();--%>
<%--        Student student = (Student) session.getAttribute("student");--%>
<%--        String context = request.getContextPath();--%>
<%--        if(student !=null){--%>
<%--            response.sendRedirect(context+"/student/home");--%>
<%--        }--%>
<%--    %>--%>
<%--&lt;%&ndash;</c:if>&ndash;%&gt;--%>
<%--<div id="login-overlay" class="modal-dialog">--%>
<%--    <div class="modal-content">--%>
<%--        <div class="modal-header">--%>
<%--            <div class="container"></div>--%>
<%--            <!-- <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button> -->--%>
<%--            <h4 class="modal-title" id="myModalLabel">Login Now!</h4>--%>
<%--        </div>--%>
<%--        <div class="modal-body">--%>
<%--            <div class="row">--%>
<%--                <div class="col-xs-6">--%>
<%--                    <div class="well">--%>
<%--                        <form id="loginForm" method="POST" action="${contextPath}/user/login" novalidate="novalidate">--%>
<%--                            <div class="form-group">--%>
<%--                                <label for="username" class="control-label">Username</label>--%>
<%--                                <input type="text" class="form-control" id="username" name="username" value="" required="required" title="Please enter you username" >--%>
<%--                                <span class="help-block"></span>--%>
<%--                            </div>--%>
<%--                            <div class="form-group">--%>
<%--                                <label for="password" class="control-label">Password</label>--%>
<%--                                <input type="password" class="form-control" id="password" name="password" value="" required="required" title="Please enter your password">--%>
<%--                                <span class="help-block"></span>--%>
<%--                            </div>--%>
<%--                            <div class="form-group">--%>
<%--                                <label class="control-label">You Are?</label>--%>
<%--                                <input type="radio"  id="role1" name="role" value="Manager">--%>
<%--                                Manager--%>
<%--                                <input type="radio"  id="role2" name="role" value="Student">--%>
<%--                                Student--%>
<%--                                <c:if test="${mes != null}">--%>
<%--                                    <p style="color: red">${mes}!</p>--%>
<%--                                </c:if>--%>
<%--                            </div>--%>
<%--                            <!-- <div id="loginErrorMsg" class="alert alert-error hide">Wrong username og password</div>  -->--%>
<%--                            <div class="checkbox">--%>
<%--                                <label>--%>
<%--                                    <input type="checkbox" name="remember" id="remember"> Remember login--%>
<%--                                </label>--%>
<%--                                <p class="help-block">(if this is a private computer)</p>--%>
<%--                            </div>--%>
<%--                            <button type="submit" class="btn btn-success btn-block">Login</button>--%>
<%--&lt;%&ndash;                            <a href="${contextPath}/user/forgotpassword.htm" class="btn btn-info btn-block">Forget Password</a>&ndash;%&gt;--%>
<%--                        </form>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="col-xs-6">--%>
<%--                    <p class="lead">Register now for <span class="text-success">FREE</span></p>--%>
<%--                    <ul class="list-unstyled" style="line-height: 2">--%>
<%--                        <li><span class="fa fa-check text-success"></span> Sell Your Own Used stuffs</li>--%>
<%--                        <li><span class="fa fa-check text-success"></span> Purchase Used products Like Books</li>--%>
<%--                        <li><span class="fa fa-check text-success"></span> Save Your Money</li>--%>
<%--                        <li><span class="fa fa-check text-success"></span> Deal With Your Classmates</li>--%>
<%--&lt;%&ndash;                        <li><span class="fa fa-check text-success"></span> Search medical records</li>&ndash;%&gt;--%>
<%--                    </ul>--%>
<%--                    <p><a href="${contextPath}/user/showRegisterForm" class="btn btn-info btn-block">Yes please, register now!</a></p>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>
