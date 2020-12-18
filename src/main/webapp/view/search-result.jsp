<%--
  Created by IntelliJ IDEA.
  User: quanhaonan
  Date: 12/8/20
  Time: 11:19 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%--    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>
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
<%--    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">--%>
<%--    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>--%>
<%--    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>--%>
        <link rel="stylesheet" href="${contextPath}/bootstrap/bootstrap.min.css">
        <link rel="stylesheet" href="${contextPath}/css/all.min.css">
        <link rel="stylesheet" href="${contextPath}/css/templatemo-style.css">
    <title>Search Result</title>
</head>
<body>
    <c:set var="searchResult" value="${searchResult}"/>
    <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%--    <div class="container">--%>
        <%@include file="header.jsp"%>
    <div class="container-fluid tm-container-content tm-mt-60">
        <div class="row mb-4">
            <h2 class="col-6 tm-text-primary">
                Search Result
            </h2>
            <div class="col-6 d-flex justify-content-end align-items-center">
                <form action="" class="tm-text-primary">
                    Page <input type="text" value="1" size="1" class="tm-input-paging tm-text-primary"> of 180
                </form>
            </div>
        </div>
        <c:forEach var="item" items="${searchResult}">
            <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6 col-12 mb-5">
                <figure class="effect-ming tm-video-item">
                    <img src="${contextPath}/img/item/${item.pic}" alt="Image" class="img-fluid" style="width: 420px; height: 200px;object-fit: cover">
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
        <p class="paging" align="center">
            &nbsp
            <a href="${contextPath}/student/home/?page=${paging.indexpage - 1}" class="btn btn-primary tm-btn-prev mb-2">First</a>
            <a href="${contextPath}/student/home/?page=${paging.pageNow - 1}" class="btn btn-primary tm-btn-prev mb-2">Previous</a>
            <strong>${paging.pageNow + 1}&nbsp;page/${paging.totalPageNum} Total</strong>
            <a href="${contextPath}/student/home/?page=${paging.pageNow + 1}" class="btn btn-primary tm-btn-prev mb-2">Next Page</a>
            <a href="${contextPath}/student/home/?page=${paging.totalPageNum - 1}" class="btn btn-primary tm-btn-prev mb-2">End</a>
        </p>
    </div>
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
