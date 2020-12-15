<%--
  Created by IntelliJ IDEA.
  User: quanhaonan
  Date: 12/13/20
  Time: 1:36 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="item" value="${item}"/>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%--    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>
    <script src="https://code.jquery.com/jquery-1.11.1.min.js"
            integrity="sha256-VAvG3sHdS5LqTT+5A/aeq/bZGa/Uj04xKxY8KM/w9EE="
            crossorigin="anonymous"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
          crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
          integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
          crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script
            src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Edit Item</title>
</head>
<body>
    <div class="container">
        <div class="row">
<%--            <form:form modelAttribute="item" method="post" action="${contextPath}/item/editItem">--%>
                <form action="${contextPath}/item/editItem" method="post">
                <table class="table table-hover table-striped">
                        <tr>
                            <td>
                                <input type="hidden" value="${item.id}" name="id">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Name:
                            </td>
                            <td>
                                <input type="text" name="name" value="${item.name}">
                            </td>
                        </tr>
                    <tr>
                        <td>
                            Price:
                        </td>
                        <td>
                            <input type="text" name="price" value="${item.price}">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Quantity:
                        </td>
                        <td>
                            <input type="text" name="num" value="${item.num}">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Description:
                        </td>
                        <td>
                            <input type="text" name="description" value="${item.description}">
                        </td>
                    </tr>
                </table>
                <input type="submit" value="submit">
                </form>
        </div>
    </div>
</body>
</html>
