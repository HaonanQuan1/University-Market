<%--
  Created by IntelliJ IDEA.
  User: quanhaonan
  Date: 12/14/20
  Time: 6:01 下午
  To change this template use File | Settings | File Templates.
--%>
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
    <title>University Market</title>
    <link rel="stylesheet" href="${contextPath}/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="${contextPath}/css/all.min.css">
    <link rel="stylesheet" href="${contextPath}/css/templatemo-style.css">
    <!--

    TemplateMo 556 Catalog-Z

    https://templatemo.com/tm-556-catalog-z

    -->
</head>
<body>
<!-- Page Loader -->
<div id="loader-wrapper">
    <div id="loader"></div>

    <div class="loader-section section-left"></div>
    <div class="loader-section section-right"></div>

</div>

<%@include file="header.jsp"%>

<div class="container-fluid tm-container-content tm-mt-60">
    <div class="row mb-4">
        <h2 class="col-6 tm-text-primary">
            Latest Items
        </h2>
        <div class="col-6 d-flex justify-content-end align-items-center">
            <form action="" class="tm-text-primary">
                Page <input type="text" value="1" size="1" class="tm-input-paging tm-text-primary"> of 180
            </form>
        </div>
    </div>
    <div class="row tm-mb-90 tm-gallery">
    <c:forEach var="item" items="${list}">
    <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 mb-5">

    <figure class="effect-ming tm-video-item">
               <img src="${contextPath}/img/item/${item.id}.png" alt="Image" class="img-fluid" style="width: 420px; height: 200px;object-fit: cover">
               <figcaption class="d-flex align-items-center justify-content-center">
                   <h2>${item.name}</h2>
                   <a href="${contextPath}/item/detail/${item.id}">View more</a>
               </figcaption>
           </figure>
           <div class="d-flex justify-content-between tm-text-gray">
               <span>${item.name}</span>
               <span>${item.price}</span>
           </div>
    </div>

    </c:forEach>
    </div>


</div> <!-- row -->
    <div class="row tm-mb-90">
        <div class="col-12 d-flex justify-content-between align-items-center tm-paging-col">
            <a href="javascript:void(0);" class="btn btn-primary tm-btn-prev mb-2 disabled">Previous</a>
            <div class="tm-paging d-flex">
                <a href="javascript:void(0);" class="active tm-paging-link">1</a>
                <a href="javascript:void(0);" class="tm-paging-link">2</a>
                <a href="javascript:void(0);" class="tm-paging-link">3</a>
                <a href="javascript:void(0);" class="tm-paging-link">4</a>
            </div>
            <a href="javascript:void(0);" class="btn btn-primary tm-btn-next">Next Page</a>
        </div>
    </div>
 <!-- container-fluid, tm-container-content -->


<%@include file="footer.jsp"%>
<script src="${contextPath}/js/plugins.js"></script>
<script>
    $(window).on("load", function() {
        $('body').addClass('loaded');
    });

    $(function(){
        /************** Video background *********/

        function setVideoSize() {
            const vidWidth = 1280;
            const vidHeight = 720;
            const maxVidHeight = 400;
            let windowWidth = window.innerWidth;
            let newVidWidth = windowWidth;
            let newVidHeight = windowWidth * vidHeight / vidWidth;
            let marginLeft = 0;
            let marginTop = 0;

            if (newVidHeight < maxVidHeight) {
                newVidHeight = maxVidHeight;
                newVidWidth = newVidHeight * vidWidth / vidHeight;
            }

            if(newVidWidth > windowWidth) {
                marginLeft = -((newVidWidth - windowWidth) / 2);
            }

            if(newVidHeight > maxVidHeight) {
                marginTop = -((newVidHeight - $('#tm-video-container').height()) / 2);
            }

            const tmVideo = $('#tm-video');

            tmVideo.css('width', newVidWidth);
            tmVideo.css('height', newVidHeight);
            tmVideo.css('margin-left', marginLeft);
            tmVideo.css('margin-top', marginTop);
        }

        setVideoSize();

        // Set video background size based on window size
        let timeout;
        window.onresize = function () {
            clearTimeout(timeout);
            timeout = setTimeout(setVideoSize, 100);
        };

        // Play/Pause button for video background
        const btn = $("#tm-video-control-button");

        btn.on("click", function (e) {
            const video = document.getElementById("tm-video");
            $(this).removeClass();

            if (video.paused) {
                video.play();
                $(this).addClass("fas fa-pause");
            } else {
                video.pause();
                $(this).addClass("fas fa-play");
            }
        });
    });
</script>
</body>
</html>