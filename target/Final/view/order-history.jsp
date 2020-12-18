<%--
  Created by IntelliJ IDEA.
  User: quanhaonan
  Date: 12/8/20
  Time: 7:38 下午
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8"%>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="orders" value="${orderList}"/>
<%--<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link href="${contextPath}/css/shopcart/shopcart.css" type="text/css" rel="stylesheet">
    <title>Order History</title>
</head>
<body>
<%@include file="header.jsp"%>
<div class="wrap cf">
    <h1 class="projTitle">Order History</h1>
    <div class="heading cf">
        <h1>My Orders</h1>
        <a href="${contextPath}/student/home" class="continue">Go Back</a>
    </div>
    <div class="cart">
        <!--    <ul class="tableHead">
              <li class="prodHeader">Product</li>
              <li>Quantity</li>
              <li>Total</li>
               <li>Remove</li>
            </ul>-->
        <ul class="cartWrap">

            <c:forEach var="order" items="${orders}">
                <li class="items">

                    <div class="infoWrap">
                        <div class="cartSection">
<%--                            <img src="${contextPath}/img/${order}" alt="" class="itemImg" />--%>
<%--                            <p class="itemNumber">#QUE-007544-002</p>--%>
                            <h3>Date:${order.date}</h3>
                             <p class="itemNumber">${order.totalPrice}</p>
                        </div>
                        <div class="cartSection removeWrap">
                            <a href="${contextPath}/student/viewOrders/${order.id}" class="continue">View Details</a>
                        </div>
                    </div>
                </li>
            </c:forEach>


            <!--<li class="items even">Item 2</li>-->

        </ul>
    </div>

    <%--    <div class="promoCode"><label for="promo">Have A Promo Code?</label><input type="text" name="promo" placholder="Enter Code" />--%>
    <%--        <a href="#" class="btn"></a>--%>
    <%--    </div>--%>

<%--    <div class="subtotal cf">--%>
<%--        <ul>--%>
<%--            &lt;%&ndash;            <li class="totalRow"><span class="label">Subtotal</span><span class="value">$35.00</span></li>&ndash;%&gt;--%>

<%--            &lt;%&ndash;            <li class="totalRow"><span class="label">Shipping</span><span class="value">$5.00</span></li>&ndash;%&gt;--%>

<%--            &lt;%&ndash;            <li class="totalRow"><span class="label">Tax</span><span class="value">$4.00</span></li>&ndash;%&gt;--%>
<%--            &lt;%&ndash;            <li class="totalRow final"><span class="label">Total</span><span class="value">$44.00</span></li>&ndash;%&gt;--%>
<%--            <li class="totalRow"><a href="${contextPath}/student/place" class="btn continue">Checkout</a></li>--%>
<%--        </ul>--%>
<%--    </div>--%>
</div>
<%--<%@include file="footer.jsp"%>--%>
<script type="text/javascript" src="${contextPath}/js/shopcart/shopcart.js"/>
<script type="text/javascript" src="${contextPath}/js/loginform/jquery-3.2.1.min.js"/>
<%@include file="footer.jsp"%>
</body>
</html>
