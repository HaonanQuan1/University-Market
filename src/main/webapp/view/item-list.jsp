<%--
  Created by IntelliJ IDEA.
  User: quanhaonan
  Date: 12/9/20
  Time: 2:33 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="list" value="${itemList}"/>
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
    <title>Item List</title>
</head>
<body>
<div class="table table-striped table-hover col-md-10 col-sm-10">
    <div class="row">
        <form action="${contextPath}/manager/deleteItem" method="post">
        <table class="table table-hover table-striped">
            <thead>
            <tr>
                <td>
                    &nbsp
                </td>
                <td>
                    Name:
                </td>
                <td>
                    Price:
                </td>
                <td>
                    Description:
                </td>
                <td>
                    Tag:
                </td>
                <td>
                    &nbsp;
                </td>
                <td><input type="checkbox" id="top_cb" /></td>
                <td>
                    <input class="btn  btn-danger" type="submit" value="Delete">
                </td>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${list}">
                <tr>
                    <td>
                        &nbsp
                    </td>
                    <td>
                        <span>${item.name}</span>
                    </td>
                    <td>
                        <span>${item.price}</span>
                    </td>
                    <td>
                        <span>${item.description}</span>
                    </td>
                    <td>
                        <span>${item.tag}</span>
                    </td>
                    <td>
                    <td>
                        <input name="check" type="checkbox" value="${item.id}">
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        </form>
        <p class="paging" align="center">
            &nbsp
            <a href="${contextPath}/manager/items/?page=${paging.indexpage - 1}">First</a>
            <a href="${contextPath}/manager/items/?page=${paging.pageNow - 1}">Previous</a>
            <strong>${paging.pageNow + 1}page/${paging.totalPageNum} Total</strong>
            <a href="${contextPath}/manager/items/?page=${paging.pageNow + 1}">Next Page</a>
            <a href="${contextPath}/manager/items/?page=${paging.totalPageNum - 1}">End</a>
        </p>
    </div>
</div>
<script src="${contextPath}/js/util/page.js">

</script>
</body>
</html>
