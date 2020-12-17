<%--
  Created by IntelliJ IDEA.
  User: quanhaonan
  Date: 12/7/20
  Time: 3:53 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="shopcarts" value="${cart}"/>
<%--<c:set var="total" value="0"/>--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link href="${contextPath}/css/shopcart/shopcart.css" type="text/css" rel="stylesheet">
    <title>University Market</title>
</head>
<body>
<%@include file="header.jsp"%>
<div class="wrap cf">
    <h1 class="projTitle">University Market Shopping Cart</h1>
    <div class="heading cf">
        <h1>My Cart</h1>
        <a href="${contextPath}/student/home" class="continue">Continue Shopping</a>
    </div>
    <div class="cart">
        <!--    <ul class="tableHead">
              <li class="prodHeader">Product</li>
              <li>Quantity</li>
              <li>Total</li>
               <li>Remove</li>
            </ul>-->
        <ul class="cartWrap">

            <c:forEach var="shop" items="${shopcarts}">
                <li class="items">

                    <div class="infoWrap">
                        <div class="cartSection">
                            <input type="hidden" value="${shop.item.id}" id="id">
                            <img src="${contextPath}/img/item/${shop.item.id}.png" alt="" class="itemImg" />
<%--                            <p class="itemNumber">#QUE-007544-002</p>--%>
                            <h3>${shop.item.name}</h3>
<%--                            <form action="${}"--%>
                            <p>${shop.item.description}</p>
<%--                            <p> <input type="text"  class="qty" placeholder="1" name="num" id="num" onkeyup="checkNum()" /> x $${shop.item.price}</p>--%>
<%--                            <input type="hidden" id="price" value="${shop.item.price}">--%>
<%--                            <p class="stockStatus"> In Stock</p>--%>
                        </div>


                        <div class="prodTotal cartSection">
                            <p id="total">$${shop.num * shop.item.price}</p>
                        </div>
                        <div class="cartSection removeWrap">
                            <a href="${contextPath}/student/updateShopCarts/${shop.id}" class="remove">x</a>
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

    <div class="subtotal cf">
        <ul>
<%--            <li class="totalRow"><span class="label">Subtotal</span><span class="value">$35.00</span></li>--%>

<%--            <li class="totalRow"><span class="label">Shipping</span><span class="value">$5.00</span></li>--%>

<%--            <li class="totalRow"><span class="label">Tax</span><span class="value">$4.00</span></li>--%>
<%--            <li class="totalRow final"><span class="label">Total</span><span class="value">$44.00</span></li>--%>
            <li class="totalRow"><a href="${contextPath}/student/place" class="btn continue">Checkout</a></li>
        </ul>
    </div>
</div>
<%--<%@include file="footer.jsp"%>--%>
<script type="text/javascript" src="${contextPath}/js/shopcart/shopcart.js"/>
<script type="text/javascript" src="${contextPath}/js/loginform/jquery-3.2.1.min.js"/>
<%--<script>--%>
<%--    function checkNum(){--%>
<%--        var xmlHttp;--%>
<%--        try // Firefox, Opera 8.0+, Safari--%>
<%--        {--%>
<%--            xmlHttp = new XMLHttpRequest();--%>
<%--        } catch (e) {--%>
<%--            try // Internet Explorer--%>
<%--            {--%>
<%--                xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");--%>
<%--            } catch (e) {--%>
<%--                try {--%>
<%--                    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");--%>
<%--                } catch (e) {--%>
<%--                    alert("Your browser does not support AJAX!");--%>
<%--                    return false;--%>
<%--                }--%>
<%--            }--%>
<%--        }--%>
<%--        xmlHttp.onreadystatechange = function() {--%>
<%--            if (xmlHttp.readyState == 4) {--%>
<%--                document.getElementById("num").innerHTML = xmlHttp.responseText;--%>
<%--                // document.getElementById("total").innerText = document.getElementById("num")*document.getElementById()--%>
<%--                // var usernameHint = document.getElementById("usernameHint")--%>
<%--                // document.getElementById("signup").disable = true;--%>
<%--                updateTotalPrice();--%>
<%--            }--%>
<%--        }--%>
<%--        var num = document.getElementById("num").value;--%>
<%--        var id = document.getElementById("id").value;--%>
<%--        alert(num);--%>
<%--        xmlHttp.open("POST", "../updateShopCartNum?num="+num, true);--%>
<%--        xmlHttp.send();--%>
<%--    }--%>
<%--    function updateTotalPrice(){--%>
<%--        var total = 0;--%>
<%--        var num = document.getElementById("num").value();--%>
<%--        var price = document.getElementById("price").value();--%>
<%--        total = num * price;--%>
<%--        document.getElementById("total").innerHTML = total;--%>
<%--    }--%>
<%--</script>--%>
</body>
</html>
<%--<html>--%>
<%--<head>--%>
<%--    &lt;%&ndash;    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">&ndash;%&gt;--%>
<%--    <script src="https://code.jquery.com/jquery-1.11.1.min.js"--%>
<%--            integrity="sha256-VAvG3sHdS5LqTT+5A/aeq/bZGa/Uj04xKxY8KM/w9EE="--%>
<%--            crossorigin="anonymous"></script>--%>
<%--    <!-- Latest compiled and minified CSS -->--%>
<%--    <link rel="stylesheet"--%>
<%--          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"--%>
<%--          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"--%>
<%--          crossorigin="anonymous">--%>

<%--    <!-- Optional theme -->--%>
<%--    <link rel="stylesheet"--%>
<%--          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"--%>
<%--          integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"--%>
<%--          crossorigin="anonymous">--%>

<%--    <!-- Latest compiled and minified JavaScript -->--%>
<%--    <script--%>
<%--            src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"--%>
<%--            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"--%>
<%--            crossorigin="anonymous"></script>--%>
<%--        <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">--%>
<%--        <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>--%>
<%--        <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>--%>
<%--    <title>ShopCarts</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--&lt;%&ndash;<c:set var="student" value="${sessionScope.student}"/>&ndash;%&gt;--%>
<%--&lt;%&ndash;<c:set var="cart" value="${student.getCart()}"/>&ndash;%&gt;--%>
<%--<c:set var="cart" value="${list}"/>--%>
<%--<c:set var="contextPath" value="${pageContext.request.contextPath}"/>--%>
<%--<div class="container">--%>
<%--    <%@include file="nav.jsp"%>--%>
<%--    <div class="row">--%>
<%--        <form action="${contextPath}/student/place" method="post">--%>
<%--        <table class="table table-hover table-striped">--%>
<%--            <thead>--%>
<%--                <tr>--%>
<%--                    <th>--%>
<%--                        Name--%>
<%--                    </th>--%>
<%--                    <th>--%>
<%--                        Description--%>
<%--                    </th>--%>
<%--                    <th>--%>
<%--                        Price--%>
<%--                    </th>--%>
<%--                    <th>--%>
<%--                        Num--%>
<%--                    </th>--%>
<%--                </tr>--%>
<%--            </thead>--%>
<%--            <tbody>--%>
<%--                <c:forEach var="item" items="${list}">--%>
<%--                        <tr>--%>

<%--                            <td>--%>
<%--                                    <a href="${contextPath}/item/detail/${item.item.id}">${item.item.name}</a>--%>
<%--                            </td>--%>

<%--                            <td>--%>
<%--                                    ${item.item.description}--%>
<%--                            </td>--%>
<%--                            <td>--%>
<%--                                    ${item.item.price}--%>
<%--                            </td>--%>
<%--                            <td>--%>
<%--                                    ${item.num}--%>
<%--                            </td>--%>
<%--                            <td>--%>
<%--&lt;%&ndash;                                <input type="submit" value="Delete" class="btn-warning">&ndash;%&gt;--%>
<%--                                    <a href="${contextPath}/student/updateShopCarts/${item.id}" class="btn btn-warning">Delete</a>--%>
<%--                            </td>--%>
<%--                        </tr>--%>
<%--                </c:forEach>--%>
<%--            </tbody>--%>
<%--        </table>--%>
<%--            <input type="submit" class="btn-info" value="Place Your Order!">--%>
<%--        </form>--%>
<%--&lt;%&ndash;        <form action="${contextPath}/student/place" method="post">&ndash;%&gt;--%>
<%--&lt;%&ndash;            <input type="submit" value="submit">&ndash;%&gt;--%>
<%--&lt;%&ndash;        </form>&ndash;%&gt;--%>
<%--    </div>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>
