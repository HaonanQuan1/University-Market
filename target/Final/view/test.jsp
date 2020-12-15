<%--
  Created by IntelliJ IDEA.
  User: quanhaonan
  Date: 12/5/20
  Time: 2:45 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Test</title>
</head>
<body>
${list.get(0)};
<%--    <c:set var = "student" value="${student}"/>--%>
<%--    <label>${student.email}</label>--%>
<%--    <c:set var = "list" value="${list}"/>--%>
<%--        ${student.getShopCarts()}--%>
<%--    <c:forEach var="item" begin="1" end="2" >--%>
<%--        ${item}--%>
<%--    </c:forEach>--%>
<form action="${pageContext.request.contextPath}/student/test3" method="post">
    <label name="test" value="${list.get(0).num}">${list.get(0).num}</label>
    <input type="submit" value="submit">
</form>
</body>
</html>
