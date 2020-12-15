<%--
  Created by IntelliJ IDEA.
  User: quanhaonan
  Date: 12/5/20
  Time: 2:45 下午
  To change this template use File | Settings | File Templates.
--%>

<%@ page session="false"%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Sign Up</title>
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
    <script>
        function ajaxEvent() {

            var xmlHttp;
            try // Firefox, Opera 8.0+, Safari
            {
                xmlHttp = new XMLHttpRequest();
            } catch (e) {
                try // Internet Explorer
                {
                    xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
                } catch (e) {
                    try {
                        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                    } catch (e) {
                        alert("Your browser does not support AJAX!");
                        return false;
                    }
                }
            }

            xmlHttp.onreadystatechange = function() {
                if (xmlHttp.readyState == 4) {
                    document.getElementById("usernameHint").innerHTML = xmlHttp.responseText;
                    // var usernameHint = document.getElementById("usernameHint")
                    // document.getElementById("signup").disable = true;
                }
            }

            var username = document.getElementById("username").value;
            xmlHttp.open("POST", "../checkUserName?username="+username, true);
            xmlHttp.send();
        }
        function emailEvent(){
            var xmlHttp;
            try // Firefox, Opera 8.0+, Safari
            {
                xmlHttp = new XMLHttpRequest();
            } catch (e) {
                try // Internet Explorer
                {
                    xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
                } catch (e) {
                    try {
                        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                    } catch (e) {
                        alert("Your browser does not support AJAX!");
                        return false;
                    }
                }
            }
            xmlHttp.onreadystatechange = function() {
                if (xmlHttp.readyState == 4) {
                    document.getElementById("emailHint").innerHTML = xmlHttp.responseText;
                }
            }

            var email = document.getElementById("email").value;
            xmlHttp.open("POST", "../checkEmail?email="+email, true);
            xmlHttp.send();
        }
    </script>
</head>
<body>

<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
            <form class="login100-form validate-form p-l-55 p-r-55 p-t-178" action="${contextPath}/user/register" method="post">
					<span class="login100-form-title">
						Sign Up
					</span>

                <div class="wrap-input100 validate-input m-b-16" data-validate="Please enter username" >
                    <input class="input100" type="text" name="username" placeholder="Username" onkeyup="ajaxEvent()" id="username">
                    <span class="focus-input100"></span>
                </div>


                <div class="wrap-input100 validate-input m-b-16" data-validate="Please enter email">
                    <input class="input100" type="email" name="Email" placeholder="@northeastern.edu" id="email" onkeyup="emailEvent()">
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
                <div class="container-login100-form-btn">
                    <input class="login100-form-btn" type="submit"  value="Sign Up" id="signup">
                    <%--                        Sign in--%>
                </div>

                <div class="wrap-input100 validate-input m-b-16" data-validate="Please enter username">
                    <%--                    <input class="input100" type="text" name="username" placeholder="Username">--%>
                    <span class="focus-input100" id="usernameHint"></span>
                </div>
                <div class="wrap-input100 validate-input m-b-16" data-validate="Please enter email">
                    <%--                    <input class="input100" type="text" name="username" placeholder="Username">--%>
                    <span class="focus-input100" id="emailHint"></span>
                </div>
                <div class="flex-col-c p-t-170 p-b-40">
						<span class="txt1 p-b-9">
							Don’t have an account?
						</span>

<%--                    <a href="${contextPath}/user/showRegisterForm" class="txt3">--%>
<%--                        Sign up now--%>
<%--                    </a>--%>
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
<%--<body>--%>
<%--<c:set var="contextPath" value="${pageContext.request.contextPath}" />--%>
<%--<c:set var="mes" value="${mes}"/>--%>
<%--<div id="login-overlay" class="modal-dialog" style="width:30%">--%>
<%--    <div class="modal-content">--%>
<%--        <div class="modal-header">--%>
<%--            <!-- <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button> -->--%>
<%--            <h4 class="modal-title" id="myModalLabel">Register to site.com</h4>--%>
<%--        </div>--%>
<%--        <div class="modal-body">--%>
<%--            <div class="row">--%>
<%--                <div class="col-xs-12">--%>
<%--                    <div class="well">--%>
<%--                        <form id="registerForm" method="POST" action="${contextPath}/user/register" novalidate="novalidate">--%>
<%--                            <div class="form-group">--%>
<%--                                <label for="username" class="control-label">Username</label>--%>
<%--                                <input type="text" class="form-control" id="username" name="username" value="" required="required" title="Please enter you username" placeholder="Example : Jack" onkeyup="ajaxEvent()">--%>
<%--                                <div id="usernameHint"></div>--%>
<%--                            </div>--%>
<%--                            <div class="form-group">--%>
<%--                                <label for="email" class="control-label">Email</label>--%>
<%--                                <input type="email" class="form-control" id="email" name="email" value="" required="required" title="Please enter you email" placeholder="example@gmail.com" onkeyup="emailEvent()">--%>
<%--                                <div id="emailHint"></div>--%>
<%--                            </div>--%>
<%--                            <div class="form-group">--%>
<%--                                <label for="password" class="control-label">Password</label>--%>
<%--                                <input type="password" class="form-control" id="password" name="password" value="" required="required" title="Please enter your password">--%>
<%--                            </div>--%>
<%--                            <!-- <div id="loginErrorMsg" class="alert alert-error hide">Wrong username og password</div>  -->--%>
<%--&lt;%&ndash;                            <div class="form-group">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <label for="role" class="control-label">Role</label>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <input type="radio" class="checkbox-inline" name="role" value="Student"> Student&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <input type="radio" class="checkbox-inline" name="role" value="Manager"> Manager&ndash;%&gt;--%>

<%--&lt;%&ndash;                                <div id="roleHint" style="color: red">&ndash;%&gt;--%>
<%--&lt;%&ndash;&lt;%&ndash;                                    <c:if test="${mes != null}">&ndash;%&gt;&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        ${mes}&ndash;%&gt;--%>
<%--&lt;%&ndash;&lt;%&ndash;                                    </c:if>&ndash;%&gt;&ndash;%&gt;--%>

<%--&lt;%&ndash;                                </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <div class="form-group">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                <label for="captchaCode" class="control-label">Retype the characters from the picture:</label>&ndash;%&gt;--%>

<%--&lt;%&ndash;                                <input id="captchaCode" type="text" class="form-control" name="captchaCode" required="required" />&ndash;%&gt;--%>
<%--&lt;%&ndash;                            </div>&ndash;%&gt;--%>

<%--                            <button type="submit" class="btn btn-info btn-block">Register</button>--%>
<%--                        </form>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>