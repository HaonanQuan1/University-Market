<%--
  Created by IntelliJ IDEA.
  User: quanhaonan
  Date: 12/8/20
  Time: 7:38 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="list" value="${list}"/>
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
    <title>Order History</title>
</head>
<body>
    <div class="container">
    <%@include file="nav.jsp"%>
        <table class="table table-striped table-hover">
            <thead>
                <tr>
                    <td>
                        Date:
                    </td>
                    <td>
                        Total Price:
                    </td>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="order" items="${list}">
                    <tr>
                        <td>
                            ${order.date}
                        </td>
                        <td>
                            ${order.totalPrice}
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/student/viewOrders/${order.id}" class="btn-info">View Detail</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
