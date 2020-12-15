<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false"
         pageEncoding="UTF-8"%>
<html>
<body>
<c:set var="context" value="${pageContext.request.contextPath}"/>
<%--<form action="${context}/user/login" method="get">--%>
<%--    <input type="submit" value="submit">--%>
<%--</form>--%>
<a href="${context}/user/show">Login</a>
<form action="${context}/student/test2" method="get">
    <input type="submit" value="submit">
</form>
</body>
</html>
