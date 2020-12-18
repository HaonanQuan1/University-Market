<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
        <c:set var="student" value="${sessionScope.student}" />
<c:set var="items" value="${items}"/>
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
        <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="${contextPath}/css/profile/style.css">
        <link rel="stylesheet" href="${contextPath}/css/item-list/style.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Profile</title>
</head>
<body>
<div class="container bootstrap snippets bootdey">
    <hr>
<%--    <ol class="breadcrumb">--%>
<%--        <li><a href="#">Users</a></li>--%>
<%--        <li><a href="#">Profile</a></li>--%>
<%--        <li class="pull-right"><a href="" class="text-muted"><i class="fa fa-refresh"></i></a></li>--%>
<%--    </ol>--%>
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div class="well profile">
                <img class="user img-circle pull-left clearfix" height="54" src="https://bootdey.com/img/Content/user_1.jpg" alt="">
                <h3 class="name pull-left clearfix">${student.userName}</h3>
                <a href="${contextPath}/student/home" class="btn btn-info" style="float: right">Main Page</a>
                <div class="clearfix"></div>
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="#tab" data-toggle="tab">
                            Account
                        </a>
                    </li>
                    <li class="">
                        <a href="#tab2" data-toggle="tab">
                            View Your Items
                        </a>
                    </li>
                    <li class="">
                        <a href="#tab3" data-toggle="tab">
                            Upload Your Item!
                        </a>
                    </li>

                </ul>
                <br>
                <div class="tab-content">
                    <div class="tab-pane active" id="tab">
                        <div class="row">
                            <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10">
                                <div class="tab-content">
                                    <div class="tab-pane active" id="basic">
                                        <form class="form-horizontal" role="form" action="${contextPath}/student/updateStudent" method="post" enctype="multipart/form-data">
                                            <div class="form-group">
                                                <label for="inputfullname" class="col-lg-2 control-label">First Name</label>
                                                <div class="col-lg-10">
                                                    <input type="text" class="form-control" id="inputfullname" placeholder="First Name" name="firstname" value="${student.firstName}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputlastname" class="col-lg-2 control-label">Last Name</label>
                                                <div class="col-lg-10">
                                                    <input type="text" class="form-control" id="inputlastname" placeholder="Last Name" name="lastname" value="${student.lastName}" >
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputlastname" class="col-lg-2 control-label">Phone</label>
                                                <div class="col-lg-10">
                                                    <input type="tel" class="form-control" id="inputphone" placeholder="phone" name="phone" value="${student.phoneNumber}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputemail" class="col-lg-2 control-label">Address</label>
                                                <div class="col-lg-10">
                                                    <input type="text" class="form-control" id="inputemail" placeholder="address" name="address" value="${student.address}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputlastname" class="col-lg-2 control-label">College</label>
                                                <div class="col-lg-10">
                                                    <input type="text" class="form-control" id="inputcollege" placeholder="college" name="college" value="${student.college}">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputpassword" class="col-lg-2 control-label" >Password</label>
                                                <div class="col-lg-10">
                                                    <input type="password" class="form-control" id="inputpassword" placeholder="Password" name="password" value="${student.password}" pattern=".{5,12}" required title="5 to 12 chatacters">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label  class="col-lg-2 control-label">Photo</label>
                                                <div class="col-lg-10">
                                                    <input type="file" class="filestyle" data-classbutton="btn btn-default btn-lg" data-input="false" id="filestyle-0" tabindex="-1" style="position: fixed; left: -500px;" name="pic"><div class="bootstrap-filestyle input-group">
                                                    <input type="text" class="form-control " disabled="" placeholder="Choose file">
                                                    <span class="input-group-btn" tabindex="0">
                                                        <label for="filestyle-0" class="btn btn-default btn-lg">
                                                            <span class="glyphicon glyphicon-folder-open"></span>
                                                        </label>
                                                    </span>
                                                </div>
                                                </div>
                                            </div>
                                            <input type="submit" value="submit" class="btn btn-default btn-lg">
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
    <div class="tab-pane" id="tab2">
        <div class="row">
            <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10">
                <div class="tab-content">
                    <h1>My Items</h1>
                    <form action="${contextPath}/item/delete" method="post">
                    <table class="striped">
                        <thead>
                        <tr>
<%--                            <th></th>--%>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Description</th>
                            <th>Tag</th>
                            <th>Quantity</th>
<%--                            <th>Header</th>--%>
                            <th><input type="submit" value="delete" class="btn-danger btn"> </th>
                            <th>Edit</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="item" items="${items}">
                            <tr>
                                <td><a href="${contextPath}/item/detail/${item.id}">${item.name}</a></td>
                                <td>${item.price}</td>
                                <td>${item.description}</td>
                                <td>${item.tag}</td>
                                <td>${item.num}</td>
                                <td><input type="checkbox" name="select" value="${item.id}"></td>
                                <td><a href="${contextPath}/item/editDetail/${item.id}" class="btn btn-info">Edit</a> </td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                    </form>



                </div>
            </div>
        </div>
    </div>
    <div class="tab-pane" id="tab3">
        <div class="row">
            <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10">
                <div class="tab-content">
                    <div class="tab-pane active" id="basic2">
                        <form class="form-horizontal" role="form" action="${contextPath}/item/uploadItem" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label for="inputname" class="col-lg-2 control-label">Name</label>
                                <div class="col-lg-10">
                                    <input type="text" class="form-control" id="inputname" placeholder="Name" name="name" >
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputprice" class="col-lg-2 control-label">Price</label>
                                <div class="col-lg-10">
                                    <input type="text" class="form-control" id="inputprice" placeholder="100.0" name="price"  >
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputquantity" class="col-lg-2 control-label">Quantity</label>
                                <div class="col-lg-10">
                                    <input type="text" class="form-control" id="inputquantity" placeholder="23" name="num">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputdescription" class="col-lg-2 control-label">Description</label>
                                <div class="col-lg-10">
                                    <input type="text" class="form-control" id="inputdescription" placeholder="This is an item" name="description">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="inputtag" class="col-lg-2 control-label">Tag</label>
                                <div class="col-lg-10">
                                    <input type="text" class="form-control" id="inputtag" placeholder="book" name="tag" >
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
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%--<div class="container">--%>
<%--    <div class="row">--%>
<%--        Account Info:--%>
<%--        <c:set var="contextPath" value="${pageContext.request.contextPath}" />--%>
<%--        <c:set var="student" value="${sessionScope.student}" />--%>
<%--        <c:set var="manager" value="${sessionScope.manager}" />--%>

<%--        Basic Info:<br>--%>
<%--        <form action="${contextPath}/user/detail?action=modify-basic" method="POST">--%>
<%--            <!-- show different info for two roles -->--%>
<%--            <c:if test="${not empty student}">--%>
<%--                <table class="table table-striped table-hover">--%>
<%--                    <thead>--%>
<%--                    <tr>--%>
<%--                        <td>--%>
<%--                            FirstName:--%>

<%--                        </td>--%>
<%--                        <td>--%>
<%--                            LastName:--%>
<%--                        </td>--%>
<%--                        <td>--%>
<%--                            Phone:--%>
<%--                        </td>--%>
<%--                        <td>--%>
<%--                            Address:--%>
<%--                        </td>--%>
<%--                        <td>--%>
<%--                            Email:--%>
<%--                        </td>--%>
<%--                        <td>--%>
<%--                            College:--%>
<%--                        </td>--%>
<%--                        <td>--%>
<%--                            Balance:--%>
<%--                        </td>--%>
<%--                    </tr>--%>
<%--                    </thead>--%>
<%--                    <tbody>--%>
<%--                    <tr>--%>
<%--                        <td>--%>
<%--                            <input type="text" name="firstname" value="${student.firstName}"/>--%>
<%--                        </td>--%>
<%--                        <td>--%>
<%--                            <input type="text" name="lastname" value="${student.lastName}"/>--%>
<%--                        </td>--%>
<%--                        <td>--%>
<%--                            <input type="text" name="phone" value="${student.phoneNumber}"/>--%>
<%--                        </td>--%>
<%--                        <td>--%>
<%--                            <input type="text" name="streetAddress" value="${student.address}"/>--%>
<%--                        </td>--%>
<%--                        <td>--%>
<%--                            <input type="text" name="email" value="${student.email}" disabled="disabled"/>--%>
<%--                        </td>--%>
<%--                        <td>--%>
<%--                            <input type="text" name="college" value="${student.college}"/>--%>
<%--                        </td>--%>
<%--                        <td>--%>
<%--                            <input type="text" name="balance" value="${student.balance}"/>--%>
<%--                        </td>--%>
<%--                    </tr>--%>
<%--                    </tbody>--%>
<%--                </table>--%>

<%--                &lt;%&ndash;        Age: <input type="text" name="age" value="${st.age}"/><br>&ndash;%&gt;--%>

<%--                &lt;%&ndash;        ZipCode: <input type="text" name="zipCode" value="${patient.zipCode}"/><br>&ndash;%&gt;--%>
<%--            </c:if>--%>
<%--            <c:if test="${not empty manager}">--%>
<%--                FirstName: <input type="text" name="firstname" value="${manager.firstName}"/><br>--%>
<%--                LastName: <input type="text" name="lastname" value="${manager.lastName}"/><br>--%>
<%--                Email: <input type="text" name="email" value="${manager.email}" disabled="disabled"/><br>--%>
<%--                Phone: <input type="text" name="phone" value="${manager.phoneNUmber}"/><br>--%>
<%--                &lt;%&ndash;        Department <input type="text" name="department" value="${doctor.phone}"/><br>&ndash;%&gt;--%>
<%--            </c:if>--%>
<%--            <input type="submit" name="Save Change" value="submit Basic Info" class="btn-warning" align="center"/><br>--%>
<%--        </form>--%>

<%--        Change Password:<br>--%>
<%--        <form action="${contextPath}/user/detail?action=modify-password" method="POST">--%>
<%--            <table class="table table-hover table-striped">--%>
<%--                <tbody>--%>
<%--                <tr>--%>
<%--                    <td>--%>
<%--                        Old Password:--%>
<%--                    </td>--%>
<%--                    <td>--%>
<%--                        <input type="password" name="oldPw" id="pw1" />--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>--%>
<%--                        Re-enter:--%>
<%--                    </td>--%>
<%--                    <td>--%>
<%--                        <input type="password" id="pw2" onblur="check2pwd()"/>--%>
<%--                    </td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td>--%>
<%--                        New Password:--%>
<%--                    </td>--%>
<%--                    <td>--%>
<%--                        <input type="password" name="newPw" />--%>
<%--                    </td>--%>
<%--                </tr>--%>

<%--                </tbody>--%>
<%--            </table>--%>
<%--            <div id="pwNotSame"></div>--%>
<%--            <input type="submit" name="Save Change" value="submit" class="btn-warning" align="center"/>--%>
<%--        </form>--%>
<%--        <a href="${contextPath}/student/home" class="btn-info">Go Back to Main Page</a>--%>
<%--        <a href="${contextPath}/item/upload" class="btn-info">Upload Your Item!</a>--%>
<%--        <a href="${contextPath}/item/viewStudentItem" class="btn-info">View Your Items</a>--%>
<%--    </div>--%>
<%--</div>--%>

<%--<script>--%>
<%--    // check two passwords--%>
<%--    function check2pwd() {--%>
<%--        let input1 = document.getElementById(pw1);--%>
<%--        let input2 = document.getElementById(pw2);--%>
<%--        if(input1.value != input2.value) {--%>
<%--            document.getElementById("pwNotSame").innerHTML="The two input passwords are not the same";--%>
<%--        }--%>
<%--    }--%>
<%--</script>--%>

</body>
</html>