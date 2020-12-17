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

        <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="${contextPath}/css/profile/style.css">
        <link rel="stylesheet" href="${contextPath}/css/item-list/style.css">
    <title>Edit Item</title>
</head>
<body>
<div class="tab-pane" id="tab3">
    <div class="row">
        <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10">
            <div class="tab-content">
                <div class="tab-pane active" id="basic2">
                    <form class="form-horizontal" role="form" action="${contextPath}/item/editItem" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="id" value="${item.id}">
                        <div class="form-group">
                            <label for="inputname" class="col-lg-2 control-label">Name</label>
                            <div class="col-lg-10">
                                <input type="text" class="form-control" id="inputname" placeholder="Name" name="name" value="${item.name}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputprice" class="col-lg-2 control-label">Price</label>
                            <div class="col-lg-10">
                                <input type="text" class="form-control" id="inputprice" placeholder="100.0" name="price" value="${item.price}" >
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputquantity" class="col-lg-2 control-label">Quantity</label>
                            <div class="col-lg-10">
                                <input type="text" class="form-control" id="inputquantity" placeholder="23" name="num" value="${item.num}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputdescription" class="col-lg-2 control-label">Description</label>
                            <div class="col-lg-10">
                                <input type="text" class="form-control" id="inputdescription" placeholder="This is an item" name="description" value="${item.description}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputtag" class="col-lg-2 control-label">Tag</label>
                            <div class="col-lg-10">
                                <input type="text" class="form-control" id="inputtag" placeholder="book" name="tag" value="${item.tag}">
                            </div>
                        </div>


                        <div class="form-group">
                            <label  class="col-lg-2 control-label">Photo</label>
                            <div class="col-lg-10">
                                <input type="file" class="filestyle" data-classbutton="btn btn-default btn-lg" data-input="false" id="filestyle-1" tabindex="-1" style="position: fixed; left: -500px;" name="pic"><div class="bootstrap-filestyle input-group">
                                <input type="text" class="form-control " disabled="" placeholder="Choose file">
                                <span class="input-group-btn" tabindex="0">
                                                        <label for="filestyle-1" class="btn btn-default btn-lg">
                                                            <span class="glyphicon glyphicon-folder-open"></span>
                                                        </label>
                                                    </span>
                            </div>
                            </div>
                        </div>
                        <input type="submit" value="submit" class="btn btn-default btn-lg">
                        &nbsp;
                        <a href="${contextPath}/student/home" class="btn btn-info btn-lg">Main Page</a>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
