<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: quanhaonan
  Date: 12/7/20
  Time: 2:53 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         %>
<html>
<head>
    <title>Nav</title>
</head>
<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="${contextPath}/student/home"><img src="${contextPath}/img/logo.svg" style="width: 30px; height: 30px" ></a>
        </div>
        <form class="navbar-form navbar-left" role="search" action="${contextPath}/item/search" method="post">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Search" name = "search" style="width: 600px" id="search" onkeyup="ajaxFunction()">
            </div>

            <button type="submit" class="btn btn-dark">Search</button>
            &nbsp&nbsp&nbsp&nbsp&nbsp            &nbsp&nbsp&nbsp&nbsp&nbsp

            <div class="form-group">
                <a href="${contextPath}/user/logout">
                    <img src="${contextPath}/img/signout.jpg" class="img-circle"/>
                </a>
            </div>
            &nbsp&nbsp&nbsp&nbsp&nbsp
            <div class="form-group">
                <a href="${contextPath}/student/shopCarts">
                    <img src="${contextPath}/img/cart.jpg" class="img-circle"/>
                </a>
            </div>
            &nbsp&nbsp&nbsp&nbsp&nbsp
            <div class="form-group">
                <a href="${contextPath}/student/orders">
                    <img src="${contextPath}/img/order.jpg" class="img-circle"/>
                </a>
            </div>
            &nbsp&nbsp&nbsp&nbsp&nbsp
            <div class="form-group">
                <a href="${contextPath}/user/profile">
                    <img src="${contextPath}/img/profile.jpg" class="img-circle" width="30px" height="30px"/>
                </a>
            </div>
        </form>
        <br>

<%--        <button >sad</button>--%>
    </div>
    <div id="searchHint">

    </div>
</nav>
<script>
    function ajaxFunction(){
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
                    xmlHttp = new ActiveXObject(
                        "Microsoft.XMLHTTP");
                } catch (e) {
                    alert("Your browser does not support AJAX!");
                    return false;
                }
            }
        }

        xmlHttp.onreadystatechange = function() {
            if (xmlHttp.readyState == 4) {
                document.getElementById("searchHint").innerHTML = xmlHttp.responseText;
                JSON.parse(xmlHttp)
            }
        }

        var search = document
            .getElementById("search").value;

        xmlHttp.open("POST", "${contextPath}/searchHint?search=" + search, true);

        xmlHttp.send();
    }
</script>
</body>
</html>
