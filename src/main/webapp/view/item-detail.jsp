<%--
  Created by IntelliJ IDEA.
  User: quanhaonan
  Date: 12/14/20
  Time: 7:16 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="student" value="${sessionScope.student}"/>
<c:set var="item" value="${item}"/>
<c:set var="tags" value="${requestScope.list}"/>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Item Detail</title>
    <link rel="stylesheet" href="${contextPath}/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="${contextPath}/css/all.min.css">
    <link rel="stylesheet" href="${contextPath}/css/templatemo-style.css">
    <title>Item Detail</title>
</head>
<body>
<div id="loader-wrapper">
    <div id="loader"></div>

    <div class="loader-section section-left"></div>
    <div class="loader-section section-right"></div>

</div>
<%@include file="header.jsp"%>
<div class="container-fluid tm-container-content tm-mt-60">
    <div class="row mb-4">
        <h2 class="col-12 tm-text-primary">${item.name}</h2>
    </div>
    <div class="row tm-mb-90">
        <div class="col-xl-8 col-lg-7 col-md-6 col-sm-12">
            <img src="${contextPath}/img/item/${item.pic}" alt="Image" class="img-fluid">
        </div>
        <div class="col-xl-4 col-lg-5 col-md-6 col-sm-12">
            <div class="tm-bg-gray tm-video-details">
                <form action="${contextPath}/student/addCart/${item.id}" method="post">
                <div class="mb-4">
                    <h3 class="tm-text-gray-dark mb-3">Description</h3>
                    <p>${item.description}</p>
                </div>
                <div class="mb-4">
                    <h3 class="tm-text-gray-dark mb-3">Price</h3>
                    <p>${item.price}</p>
                </div>
                <div class="mb-4">
                    <h3 class="tm-text-gray-dark mb-3">Sold By</h3>
                    <p> ${item.student.firstName}&nbsp;${item.student.lastName}</p>
                </div>

                <div>
                    <h3 class="tm-text-gray-dark mb-3">Tags</h3>
                    <a href="${contextPath}/item/searchByTag/${item.tag}" class="tm-text-primary mr-4 mb-2 d-inline-block">${item.tag}</a>
                </div>
                    <div class="text-center mb-5">
                        <c:if test="${sessionScope.student.id != item.student.id}">
                            <a href="${contextPath}/student/addCart/${item.id}" class="btn btn-primary tm-btn-big" >Add to Cart</a>
<%--                            <a href="${contextPath}/item/report/${item.id}" class="btn btn-primary tm-btn-big">Report</a>--%>
                        </c:if>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="row mb-4">
        <h2 class="col-12 tm-text-primary">
            Related Items
        </h2>
    </div>
    <div class="row mb-3 tm-gallery">
        <c:forEach var="item" items="${tags}">
            <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 mb-5">
                <figure class="effect-ming tm-video-item">
                    <img src="${contextPath}/img/item/${item.id}.png" alt="Image" class="img-fluid">
                    <figcaption class="d-flex align-items-center justify-content-center">
                        <h2>${item.name}</h2>
                        <a href="${contextPath}/item/detail/${item.id}">View more</a>
                    </figcaption>
                </figure>
                <div class="d-flex justify-content-between tm-text-gray">
                    <span class="tm-text-gray-light">${item.name}</span>
                    <span>${item.price}</span>
                </div>
            </div>
        </c:forEach>



    </div> <!-- row -->
    </div>
<%@include file="footer.jsp"%>
<script src="${contextPath}/js/plugins.js"></script>
<script>
    $(window).on("load", function() {
        $('body').addClass('loaded');
    });
</script>
</body>
</html>
