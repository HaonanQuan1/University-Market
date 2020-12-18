<%--
  Created by IntelliJ IDEA.
  User: quanhaonan
  Date: 12/8/20
  Time: 6:36 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
<%@include file="header.jsp"%>
    <div class="container">
        <div>
            <h2>You Order Has Been Placed!</h2>
            <a class="btn btn-primary btn-lg btn-block" href="${pageContext.request.contextPath}/student/home">Click Here to Main Page</a>
        </div>
    </div>
</body>
</html>
