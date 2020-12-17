<%--
  Created by IntelliJ IDEA.
  User: quanhaonan
  Date: 12/9/20
  Time: 1:45 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="list" value="${studentList}"/>
<c:set var="page" value="${paging}"/>
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
    <title>Student List</title>
</head>
<body>
    <div class="table table-striped table-hover">
        <div class="row">
            <form action="${contextPath}/manager/deleteStudent" method="post">

            <table class="table-hover table table-striped col-md-10 col-sm-10">
                <thead>
                    <tr>
                        <td>
                            &nbsp
                        </td>
                        <td>
                            FirstName:
                        </td>
                        <td>
                            LastName:
                        </td>
                        <td>
                            Email:
                        </td>
                        <td>
                            Address:
                        </td>
                        <td>
                            UserName:
                        </td>
                        <td>
                            College:
                        </td>

                        <td><input type="checkbox" id="top_cb" /></td>
                        <td>
                            <input class="btn  btn-danger" type="submit" value="Delete">
                        </td>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="student" items="${list}">
                        <tr>
                            <td>
                                &nbsp
                            </td>
                            <td>
                                <span> ${student.firstName}</span>
                            </td>
                            <td>
                                <span>${student.lastName}</span>
                            </td>
                            <td>
                                <span>${student.email}</span>
                            </td>
                            <td>
                                <span>${student.address}</span>
                            </td>
                            <td>
                                <span>${student.userName}</span>
                            </td>
                            <td>
                                <span>${student.college}</span>
                            </td>
<%--                            <td>--%>
<%--                                <span class="glyphicon glyphicon-th">${student.balance}</span>--%>
<%--                            </td>--%>
                            <td>
                                <input name="check" type="checkbox" value="${student.id}">
                            </td>
                            <td>
                                <a href="${contextPath}/manager/editStudent/${student.id}" class="btn btn-warning">Edit</a>
                            </td>

                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            </form>

            <p class="paging" align="center">
                &nbsp
                <a href="${contextPath}/manager/student/?page=${paging.indexpage - 1}&action=view">First</a>
                <a href="${contextPath}/manager/student/?page=${paging.pageNow - 1}&action=view">Previous</a>
                <strong>${paging.pageNow + 1}page/${paging.totalPageNum} Total</strong>
                <a href="${contextPath}/manager/student/?page=${paging.pageNow + 1}&action=view">Next Page</a>
                <a href="${contextPath}/manager/student/?page=${paging.totalPageNum - 1}&action=view">End</a>
            </p>
        </div>
    </div>
<script src="${contextPath}/js/util/page.js">
</script>
</body>
</html>
