<%--
  Created by IntelliJ IDEA.
  User: quanhaonan
  Date: 12/9/20
  Time: 1:57 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="student" value="${student}"/>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%--    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>
    <script src="https://code.jquery.com/jquery-1.11.1.min.js"
            integrity="sha256-VAvG3sHdS5LqTT+5A/aeq/bZGa/Uj04xKxY8KM/w9EE="
            crossorigin="anonymous"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
          crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
          integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
          crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script
            src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Student Detail</title>
</head>
<body>
    <div class="container">
        <div class="row">
            <form action="${contextPath}/manager/updateStudent/${student.id}" method="post">
            <table class="table table-hover table-striped">
<%--                <c:forEach begin="0" end="8">x--%>
                    <tr>
                        <td>
                            <span class="glyphicon">FirstName:</span>
                        </td>
                        <td>
                            <input type="text" name="firstname" value="${student.firstName}">
                        </td>
                    </tr>
    <tr>
        <td>
            LastName:
        </td>
        <td>
            <input type="text" name="lastname" value="${student.lastName}">
        </td>
    </tr>
    <tr>
        <td>
            Address:
        </td>
        <td>
            <input type="text" name="address" value="${student.address}">
        </td>
    </tr>
    <tr>
        <td>
            Phone:
        </td>
        <td>
            <input type="tel" name="phone" value="${student.phoneNumber}">
        </td>
    </tr>
    <tr>
        <td>
            Email:
        </td>
        <td>
            <input type="email" name="email" value="${student.email}">
        </td>
    </tr>
    <tr>
        <td>
            College:
        </td>
        <td>
            <input type="text" name="college" value="${student.college}">
        </td>
    </tr>
    <tr>
        <td>
            UserName:
        </td>
        <td>
            <input type="text" name="username" value="${student.userName}" disabled>
        </td>
    </tr>
    <tr>
        <td>
            Password:
        </td>
        <td>
            <input type="password" name="password" value="${student.password}" pattern=".{5,12}" required title="5 to 12 chatacters">
        </td>
    </tr>
<%--    <tr>--%>
<%--        <td>--%>
<%--            Balance:--%>
<%--        </td>--%>
<%--        <td>--%>
<%--            <input type="text" name="balance" value="${student.balance}">--%>
<%--        </td>--%>
<%--    </tr>--%>
<%--                </c:forEach>--%>
            </table>
                <input class="btn btn-info" type="submit" value="submit">
            </form>
        </div>
    </div>
</body>
</html>
