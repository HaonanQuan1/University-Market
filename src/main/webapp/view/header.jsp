<%--
  Created by IntelliJ IDEA.
  User: quanhaonan
  Date: 12/14/20
  Time: 7:13 下午
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="student" value="${sessionScope.student}"/>
<c:set var="list" value="${sessionScope.list}"/>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<%--    <title>Catalog-Z Bootstrap 5.0 HTML Template</title>--%>
    <link rel="stylesheet" href="${contextPath}/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="${contextPath}/css/all.min.css">
    <link rel="stylesheet" href="${contextPath}/css/templatemo-style.css">
    <title>Nav</title>
</head>
<body>
<nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
        <a class="navbar-brand" href="${contextPath}/student/profile">
            <%--            <i class="fas fa-film mr-2"></i>--%>
            Hi&nbsp;${student.firstName}&nbsp;${student.lastName}
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link nav-link-2 active" aria-current="page" href="${contextPath}/student/home">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-3" href="${contextPath}/student/shopCarts">ShopCart</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-4" href="${contextPath}/student/orders">Order History</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-1" href="${contextPath}/user/logout">LogOut</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="tm-hero d-flex justify-content-center align-items-center" id="tm-video-container">
    <video autoplay muted loop id="tm-video">
        <source src="${contextPath}/videos/hero.mp4" type="video/mp4">
    </video>
    <i id="tm-video-control-button" class="fas fa-pause"></i>
    <form class="d-flex position-absolute tm-search-form" method="post" action="${contextPath}/item/search">
        <input class="form-control tm-search-input" type="search" placeholder="Search" aria-label="Search" name="search">
        <button class="btn btn-outline-success tm-search-btn" type="submit">
            <i class="fas fa-search"></i>
        </button>
    </form>
</div>
<script src="${contextPath}/js/plugins.js"></script>

</body>
</html>
