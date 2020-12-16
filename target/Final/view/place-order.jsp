<%--
  Created by IntelliJ IDEA.
  User: quanhaonan
  Date: 12/8/20
  Time: 5:16 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="student" value="${sessionScope.student}"/>
<c:set var="order" value="${order}"/>
<c:set var="ordertails" value="${orderDetails}"/>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
<%--    <link rel="icon" href="https://getbootstrap.com/favicon.ico">--%>

    <title>Checkout</title>

    <!-- Bootstrap core CSS -->
    <link href="https://getbootstrap.com/docs/4.1/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="https://getbootstrap.com/docs/4.1/examples/checkout/form-validation.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container">
    <div class="py-5 text-center">
<%--        <img class="d-block mx-auto mb-4" src="https://getbootstrap.com/docs/4.1/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">--%>
        <h2>Checkout</h2>
<%--        <p class="lead">Below is an example form built entirely with Bootstrap's form controls. Each required form group has a validation state that can be triggered by attempting to submit the form without completing it.</p>--%>
    </div>

    <div class="row">
        <div class="col-md-4 order-md-2 mb-4">
            <h4 class="d-flex justify-content-between align-items-center mb-3">
                <span class="text-muted">Your Items</span>
                <span class="badge badge-secondary badge-pill">${orderDetails.size()}</span>
            </h4>
            <ul class="list-group mb-3">
                <c:forEach var="orderdetail" items="${orderDetails}">
                    <li class="list-group-item d-flex justify-content-between lh-condensed">
                        <div>
                            <h6 class="my-0">${orderdetail.item.name}</h6>
                            <small class="text-muted">Price: ${orderdetail.item.price}</small><br>
                            <small class="text-muted">Qunantity: ${orderdetail.num}</small>
                        </div>
                        <span class="text-muted">$${orderdetail.num * orderdetail.item.price}</span>
                    </li>
                </c:forEach>
                <li class="list-group-item d-flex justify-content-between">
                    <span>Total (USD)</span>
                    <strong>${order.totalPrice}</strong>
                </li>
            </ul>

<%--            <form class="card p-2">--%>
<%--                <div class="input-group">--%>
<%--                    <input type="text" class="form-control" placeholder="Promo code">--%>
<%--                    <div class="input-group-append">--%>
<%--                        <button type="submit" class="btn btn-secondary">Redeem</button>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </form>--%>
        </div>
        <div class="col-md-8 order-md-1">
            <h4 class="mb-3">Billing address</h4>
            <form class="needs-validation" novalidate="" action="${contextPath}/student/finishOrder/${order.id}" method="post">
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="firstName">First name</label>
                        <input type="text" class="form-control" id="firstName" placeholder="" value="" required="" name="firstname">
                        <div class="invalid-feedback">
                            Valid first name is required.
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="lastName">Last name</label>
                        <input type="text" class="form-control" id="lastName" placeholder="" value="" required="" name="lastname">
                        <div class="invalid-feedback">
                            Valid last name is required.
                        </div>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="username">Username</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">@</span>
                        </div>
                        <input type="text" class="form-control" id="username" placeholder="Username" required="" name="username">
                        <div class="invalid-feedback" style="width: 100%;">
                            Your username is required.
                        </div>
                    </div>
                </div>

<%--                <div class="mb-3">--%>
<%--                    <label for="email">Email <span class="text-muted">(Optional)</span></label>--%>
<%--                    <input type="email" class="form-control" id="email" placeholder="you@example.com" name="phone">--%>
<%--                    <div class="invalid-feedback">--%>
<%--                        Please enter a valid email address for shipping updates.--%>
<%--                    </div>--%>
<%--                </div>--%>

                <div class="mb-3">
                    <label for="address">Address</label>
                    <input type="text" class="form-control" id="address" placeholder="1234 Main St" required="" name="address1">
                    <div class="invalid-feedback">
                        Please enter your billing address.
                    </div>
                </div>

<%--                <div class="mb-3">--%>
<%--                    <label for="address2">Address 2 <span class="text-muted">(Optional)</span></label>--%>
<%--                    <input type="text" class="form-control" id="address2" placeholder="Apartment or suite">--%>
<%--                </div>--%>

                <div class="row">
                    <div class="col-md-5 mb-3">
                        <label for="country">Country</label>
                        <select class="custom-select d-block w-100" id="country" required="">
                            <option value="">Choose...</option>
                            <option>United States</option>
                        </select>
                        <div class="invalid-feedback">
                            Please select a valid country.
                        </div>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="state">State</label>
                        <select class="custom-select d-block w-100" id="state" required="">
                            <option value="">Choose...</option>
                            <option>California</option>
                            <option>Washington</option>
                            <option>Massachusetts</option>
                        </select>
                        <div class="invalid-feedback">
                            Please provide a valid state.
                        </div>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label for="zip">Zip</label>
                        <input type="text" class="form-control" id="zip" placeholder="" required="">
                        <div class="invalid-feedback">
                            Zip code required.
                        </div>
                    </div>
                </div>
                <hr class="mb-4">
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" id="same-address">
                    <label class="custom-control-label" for="same-address">Shipping address is the same as my billing address</label>
                </div>
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" id="save-info" value="yes" name="save">
                    <label class="custom-control-label" for="save-info">Save this information for next time</label>
                </div>
                <hr class="mb-4">

                <h4 class="mb-3">Payment</h4>

                <div class="d-block my-3">
                    <div class="custom-control custom-radio">
                        <input id="credit" name="paymentMethod" type="radio" class="custom-control-input" checked="" required="">
                        <label class="custom-control-label" for="credit">Credit card</label>
                    </div>
                    <div class="custom-control custom-radio">
                        <input id="debit" name="paymentMethod" type="radio" class="custom-control-input" required="">
                        <label class="custom-control-label" for="debit">Debit card</label>
                    </div>
                    <div class="custom-control custom-radio">
                        <input id="paypal" name="paymentMethod" type="radio" class="custom-control-input" required="">
                        <label class="custom-control-label" for="paypal">PayPal</label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="cc-name">Name on card</label>
                        <input type="text" class="form-control" id="cc-name" placeholder="" required="">
                        <small class="text-muted">Full name as displayed on card</small>
                        <div class="invalid-feedback">
                            Name on card is required
                        </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="cc-number">Credit card number</label>
                        <input type="text" class="form-control" id="cc-number" placeholder="" required="">
                        <div class="invalid-feedback">
                            Credit card number is required
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3 mb-3">
                        <label for="cc-expiration">Expiration</label>
                        <input type="text" class="form-control" id="cc-expiration" placeholder="" required="">
                        <div class="invalid-feedback">
                            Expiration date required
                        </div>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label for="cc-cvv">CVV</label>
                        <input type="text" class="form-control" id="cc-cvv" placeholder="" required="">
                        <div class="invalid-feedback">
                            Security code required
                        </div>
                    </div>
                </div>
                <hr class="mb-4">
                <input class="btn btn-primary btn-lg btn-block" type="submit" value="Continue to checkout">
            </form>
        </div>
    </div>

<%--    <footer class="my-5 pt-5 text-muted text-center text-small">--%>
<%--        <p class="mb-1">© 2017-2018 Company Name</p>--%>
<%--        <ul class="list-inline">--%>
<%--            <li class="list-inline-item"><a href="#">Privacy</a></li>--%>
<%--            <li class="list-inline-item"><a href="#">Terms</a></li>--%>
<%--            <li class="list-inline-item"><a href="#">Support</a></li>--%>
<%--        </ul>--%>
<%--    </footer>--%>
</div>
<br>
<%@include file="footer.jsp"%>
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<%--<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>--%>
<script src="https://getbootstrap.com/docs/4.1/assets/js/vendor/popper.min.js"></script>
<script src="https://getbootstrap.com/docs/4.1/dist/js/bootstrap.min.js"></script>
<script src="https://getbootstrap.com/docs/4.1/assets/js/vendor/holder.min.js"></script>
</body>
</html>


<script
        src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"
></script>
<script
        src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"
></script>
<script
        src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
        integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
        crossorigin="anonymous"
></script>
    <script src="${contextPath}/js/checkout/script.js"></script>

</body>
<%--<html>--%>
<%--<head>--%>
<%--    &lt;%&ndash;    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">&ndash;%&gt;--%>
<%--    <script src="https://code.jquery.com/jquery-1.11.1.min.js"--%>
<%--            integrity="sha256-VAvG3sHdS5LqTT+5A/aeq/bZGa/Uj04xKxY8KM/w9EE="--%>
<%--            crossorigin="anonymous"></script>--%>
<%--    <!-- Latest compiled and minified CSS -->--%>
<%--    <link rel="stylesheet"--%>
<%--          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"--%>
<%--          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"--%>
<%--          crossorigin="anonymous">--%>

<%--    <!-- Optional theme -->--%>
<%--    <link rel="stylesheet"--%>
<%--          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"--%>
<%--          integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"--%>
<%--          crossorigin="anonymous">--%>

<%--    <!-- Latest compiled and minified JavaScript -->--%>
<%--    <script--%>
<%--            src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"--%>
<%--            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"--%>
<%--            crossorigin="anonymous"></script>--%>
<%--    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">--%>
<%--    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>--%>
<%--    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>--%>
<%--    <title>Place Order</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--    <div class="container">--%>
<%--        <%@include file="nav.jsp"%>--%>
<%--        <div class="row">--%>
<%--            <div class="col-md-9 col-sm-9">--%>
<%--                <div class="panel-group">--%>
<%--                <div class="panel panel-default">--%>
<%--                    <div class="panel-heading">--%>
<%--                        <div class="panel-title">--%>
<%--                            <h2>--%>
<%--                                1.Shipping Address--%>
<%--                            </h2>--%>
<%--                        </div>--%>
<%--                        <div class="panel-body">--%>
<%--                            <p>${student.firstName}&nbsp;${student.lastName}</p>--%>
<%--                            <p>${student.address}</p>--%>
<%--                            <p>${student.phoneNumber}</p>--%>
<%--                            <p>${student.email}</p>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                    <div class="panel panel-default">--%>
<%--                        <div class="panel-heading">--%>
<%--                            <div class="panel-title">--%>
<%--                                <h2>--%>
<%--                                    Review items--%>
<%--                                </h2>--%>
<%--                            </div>--%>
<%--                            <div class="panel-body">--%>
<%--                                <table class="table table-hover table-striped">--%>
<%--                                    <thead>--%>
<%--                                    <tr>--%>
<%--                                        <td>--%>
<%--                                            Name:--%>
<%--                                        </td>--%>
<%--                                        <td>--%>
<%--                                            Price:--%>
<%--                                        </td>--%>
<%--                                        <td>--%>
<%--                                            Num:--%>
<%--                                        </td>--%>
<%--                                    </tr>--%>
<%--                                    </thead>--%>
<%--                                    <tbody>--%>
<%--                                    <c:forEach var="item" items="${list}">--%>
<%--                                        <tr>--%>
<%--                                            <td>--%>
<%--                                                <a href="${contextPath}/item/detail/${item.item.id}">${item.item.name}</a>--%>
<%--                                            </td>--%>
<%--                                            <td>--%>
<%--                                                ${item.item.price}--%>
<%--                                            </td>--%>
<%--                                            <td>--%>
<%--                                                ${item.num}--%>
<%--                                            </td>--%>
<%--                                        </tr>--%>
<%--                                    </c:forEach>--%>
<%--                                    </tbody>--%>
<%--                                </table>--%>

<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <form action="${contextPath}/student/finishOrder/${order.id}" method="post">--%>
<%--            <div class="col-md-3 col-sm-3">--%>
<%--                <div class="panel panel-default">--%>
<%--                    <div class="panel-heading">--%>
<%--                        <div class="panel-title">--%>
<%--                            <h2>--%>
<%--                                Order Summary--%>
<%--                            </h2>--%>
<%--                        </div>--%>
<%--                        <div class="panel-body">--%>
<%--                            <label>Order total:</label>--%>
<%--                            <label name="totalPrice">${order.totalPrice}</label>--%>
<%--                            <input type="submit" value="Place Order" class="btn-warning">--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</body>--%>
<%--</html>--%>
