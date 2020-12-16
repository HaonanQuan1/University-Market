<%--
  Created by IntelliJ IDEA.
  User: quanhaonan
  Date: 12/8/20
  Time: 8:19 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="orderDetails" value="${orderDetailList}"/>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%--    <meta charset="utf-8">--%>
    <title>Order Details</title>
    <link href="${contextPath}/css/order-details/style.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/shopcart/shopcart.css" type="text/css" rel="stylesheet">
</head>

<body>
<div class="container">

    <h2>OrderDetails</h2>
    <div class="TableContainer">
        <table class="TableHolder">
            <tr>
                <th>Product</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>
                    Tag
                </th>
            </tr>
            <c:forEach var="orderdetail" items="${orderDetails}">
                <tr>
                    <td>
                        <a href="${contextPath}/item/detail/${orderdetail.item.id}">
                                ${orderdetail.item.name}
                        </a>
                    </td>
                    <td>
                            ${orderdetail.item.price}
                    </td>
                    <td>
                            ${orderdetail.num}
                    </td>
                    <td>
                            ${orderdetail.item.tag}
                    </td>
                </tr>
            </c:forEach>
        </table>
        <a href="${contextPath}/student/home">Go Back To Main Page</a>
    </div>

</div>
<script type="text/javascript" src="${contextPath}/js/order-details/script.js">

</script>
</body>
</html>