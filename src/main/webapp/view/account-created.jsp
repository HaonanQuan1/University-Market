<%--
  Created by IntelliJ IDEA.
  User: quanhaonan
  Date: 12/6/20
  Time: 4:52 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
         pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Created</title>
</head>
<body>
<%--Email has been sent to your inbox , please click on the link to activate your account !--%>
 Congratulation! You Have Created You Account!
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<a href="${contextPath}/user/show">Click her to login</a>
</body>
</html>
