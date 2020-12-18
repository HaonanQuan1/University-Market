<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: quanhaonan
  Date: 12/17/20
  Time: 3:41 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="mes" value="${mes}"/>
<html>
<head>
    <title>Manager-profile</title>
</head>
<body>
    <form method="post" action="${contextPath}/manager/changePassword">
    <table class="table">
        <tr>
            <td>
                Old Password:
            </td>
            <td>
                <input type="password" name="old" pattern=".{5,12}" required title="5 to 12 chatacters">
            </td>
        </tr>
        <tr>
            <td>
                New Password:
            </td>
            <td>
                <input type="password" name="new" pattern=".{5,12}" required title="5 to 12 chatacters">
            </td>
        </tr>
    </table>
        <input type="submit" value="submit" class="btn btn-info">
    </form>
    <c:if test="${mes != null}">
        <p style="color: red">${mes}</p>
    </c:if>
</body>
</html>
