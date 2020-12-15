<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <title>Profile</title>
</head>
<body>
<div class="container">
    <div class="row">
        Account Info:
        <c:set var="contextPath" value="${pageContext.request.contextPath}" />
        <c:set var="student" value="${sessionScope.student}" />
        <c:set var="manager" value="${sessionScope.manager}" />

        Basic Info:<br>
        <form action="${contextPath}/user/detail?action=modify-basic" method="POST">
            <!-- show different info for two roles -->
            <c:if test="${not empty student}">
                <table class="table table-striped table-hover">
                    <thead>
                    <tr>
                        <td>
                            FirstName:

                        </td>
                        <td>
                            LastName:
                        </td>
                        <td>
                            Phone:
                        </td>
                        <td>
                            Address:
                        </td>
                        <td>
                            Email:
                        </td>
                        <td>
                            College:
                        </td>
                        <td>
                            Balance:
                        </td>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>
                            <input type="text" name="firstname" value="${student.firstName}"/>
                        </td>
                        <td>
                            <input type="text" name="lastname" value="${student.lastName}"/>
                        </td>
                        <td>
                            <input type="text" name="phone" value="${student.phoneNumber}"/>
                        </td>
                        <td>
                            <input type="text" name="streetAddress" value="${student.address}"/>
                        </td>
                        <td>
                            <input type="text" name="email" value="${student.email}" disabled="disabled"/>
                        </td>
                        <td>
                            <input type="text" name="college" value="${student.college}"/>
                        </td>
                        <td>
                            <input type="text" name="balance" value="${student.balance}"/>
                        </td>
                    </tr>
                    </tbody>
                </table>

                <%--        Age: <input type="text" name="age" value="${st.age}"/><br>--%>

                <%--        ZipCode: <input type="text" name="zipCode" value="${patient.zipCode}"/><br>--%>
            </c:if>
            <c:if test="${not empty manager}">
                FirstName: <input type="text" name="firstname" value="${manager.firstName}"/><br>
                LastName: <input type="text" name="lastname" value="${manager.lastName}"/><br>
                Email: <input type="text" name="email" value="${manager.email}" disabled="disabled"/><br>
                Phone: <input type="text" name="phone" value="${manager.phoneNUmber}"/><br>
                <%--        Department <input type="text" name="department" value="${doctor.phone}"/><br>--%>
            </c:if>
            <input type="submit" name="Save Change" value="submit Basic Info" class="btn-warning" align="center"/><br>
        </form>

        Change Password:<br>
        <form action="${contextPath}/user/detail?action=modify-password" method="POST">
            <table class="table table-hover table-striped">
                <tbody>
                <tr>
                    <td>
                        Old Password:
                    </td>
                    <td>
                        <input type="password" name="oldPw" id="pw1" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Re-enter:
                    </td>
                    <td>
                        <input type="password" id="pw2" onblur="check2pwd()"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        New Password:
                    </td>
                    <td>
                        <input type="password" name="newPw" />
                    </td>
                </tr>

                </tbody>
            </table>
            <div id="pwNotSame"></div>
            <input type="submit" name="Save Change" value="submit" class="btn-warning" align="center"/>
        </form>
        <a href="${contextPath}/student/home" class="btn-info">Go Back to Main Page</a>
        <a href="${contextPath}/item/upload" class="btn-info">Upload Your Item!</a>
        <a href="${contextPath}/item/viewStudentItem" class="btn-info">View Your Items</a>
    </div>
</div>

<script>
    // check two passwords
    function check2pwd() {
        let input1 = document.getElementById(pw1);
        let input2 = document.getElementById(pw2);
        if(input1.value != input2.value) {
            document.getElementById("pwNotSame").innerHTML="The two input passwords are not the same";
        }
    }
</script>

</body>
</html>