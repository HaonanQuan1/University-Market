<%--
  Created by IntelliJ IDEA.
  User: quanhaonan
  Date: 12/8/20
  Time: 5:16 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="student" value="${sessionScope.student}"/>
<c:set var="order" value="${order}"/>
<c:set var="list" value="${orderDetails}"/>
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
    <title>Place Order</title>
</head>
<body>
    <div class="container">
        <%@include file="nav.jsp"%>
        <div class="row">
            <div class="col-md-9 col-sm-9">
                <div class="panel-group">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <h2>
                                1.Shipping Address
                            </h2>
                        </div>
                        <div class="panel-body">
                            <p>${student.firstName}&nbsp;${student.lastName}</p>
                            <p>${student.address}</p>
                            <p>${student.phoneNumber}</p>
                            <p>${student.email}</p>
                        </div>
                    </div>
                </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="panel-title">
                                <h2>
                                    Review items
                                </h2>
                            </div>
                            <div class="panel-body">
                                <table class="table table-hover table-striped">
                                    <thead>
                                    <tr>
                                        <td>
                                            Name:
                                        </td>
                                        <td>
                                            Price:
                                        </td>
                                        <td>
                                            Num:
                                        </td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="item" items="${list}">
                                        <tr>
                                            <td>
                                                <a href="${contextPath}/item/detail/${item.item.id}">${item.item.name}</a>
                                            </td>
                                            <td>
                                                ${item.item.price}
                                            </td>
                                            <td>
                                                ${item.num}
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <form action="${contextPath}/student/finishOrder/${order.id}" method="post">
            <div class="col-md-3 col-sm-3">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <h2>
                                Order Summary
                            </h2>
                        </div>
                        <div class="panel-body">
                            <label>Order total:</label>
                            <label name="totalPrice">${order.totalPrice}</label>
                            <input type="submit" value="Place Order" class="btn-warning">
                        </div>
                    </div>
                </div>
            </div>
            </form>
        </div>
    </div>
</body>
</html>
