<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Welcome to the Book shop</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="ressources/css/bootstrap.min.css" >
        <link rel="stylesheet" href="ressources/css/styles.css" >
        <script type="text/javascript" src="ressources/js/jquery-3.5.1.js"></script>
        <script type="text/javascript" src="ressources/js/popper.min.js"></script>
        <script type="text/javascript" src="ressources/js/bootstrap.min.js"></script>
    </head>
    <body>
        <jsp:include page="/header.jsp" flush="false" />
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="controller">Home</a></li>
                <li class="breadcrumb-item"><a href="ProductController?section=allProduct">Products</a></li>
                <li class="breadcrumb-item"><a href="CartController?section=viewCart">Cart</a></li>
                <li class="breadcrumb-item"><a href="CartController?section=chooseDelivery">Delivery</a></li>
                <li class="breadcrumb-item active" aria-current="page">Add Address</li>
            </ol>
        </nav> 
        <!-- ============================ COMPONENT DELIVERY  ================================= -->
        <section>
            <div class="album py-4 bg-light">
                <div class="container">
                    <div class="progress">
                        <div class="progress-bar progress-bar-striped" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                    </div><div class="album py-2 bg-light"></div>
                    <div class="row justify-content-center">
                        <div class="col-lg-10">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title mb-4">Delivery info</h4>
                                    <form action="CartController" method="post">
                                        <div class="form-row">
                                            <div class="col form-group">
                                                <label>Label Address</label>
                                                <input type="text" class="form-control" name="addressLabel" id="addressLabel" value="${sessionScope.addressLabel}">
                                            </div> <!-- form-group end.// -->
                                            <div class="col form-group">
                                                <label>Label Company</label>
                                                <input type="text" class="form-control" name="company" id="company" value="${sessionScope.company}">
                                            </div> <!-- form-group end.// -->
                                        </div> <!-- form-row end.// -->
                                        <div class="form-row">
                                            <div class="col form-group">
                                                <label>First name</label> <span class="text-needed">*</span>
                                                <input type="text" class="form-control" name="firstName" id="firstName" value="${sessionScope.firstName}" required>
                                            </div> <!-- form-group end.// -->
                                            <div class="col form-group">
                                                <label>Last name</label> <span class="text-needed">*</span>
                                                <input type="text" class="form-control" name="lastName" id="lastName" value="${sessionScope.lastName}" required>
                                            </div> <!-- form-group end.// -->
                                        </div> <!-- form-row end.// -->
                                        <div class="form-row">
                                            <div class="col form-group">
                                                <label>Phone number</label>
                                                <input type="number" class="form-control" name="tel" id="tel" value="${sessionScope.tel}" placeholder="">
                                            </div> <!-- form-group end.// -->
                                            <div class="form-group col-md-6">
                                                <label>Country</label> <span class="text-needed">*</span>
                                                <select class="form-control" name="country" id="country" value="${sessionScope.country}" required>
                                                    <c:if test="${!empty sessionScope.country}"><option selected="">${sessionScope.country}</option></c:if> 
                                                    <c:if test="${empty sessionScope.country}"><option selected="">France</option></c:if>
                                                    <c:forEach var="item" items="${country}">
                                                    <option>${item}</option>
                                                    </c:forEach>
                                                </select>
                                            </div> <!-- form-group end.// -->
                                        </div> <!-- form-row end.// -->
                                        <div class="form-row">
                                            <div class="col form-group">
                                                <label>City</label> <span class="text-needed">*</span>
                                                <input type="text" class="form-control" name="city" id="city" value="${sessionScope.city}" required>
                                            </div> <!-- form-group end.// -->
                                            <div class="col form-group">
                                                <label>Zip code</label> <span class="text-needed">*</span>
                                                <input type="number" class="form-control" name="zip" id="zip" value="${sessionScope.zip}" required>
                                            </div> <!-- form-group end.// -->
                                        </div> <!-- form-row.// -->
                                        <div class="form-group">
                                            <label>Adress</label> <span class="text-needed">*</span>
                                            <input type="text" class="form-control" name="address" id="address" value="${sessionScope.address}" placeholder="Mailing address, PO box, company name, c / o" required>
                                        </div> <!-- form-group// -->  
                                        <div class="form-group">
                                            <label>Adress 2</label>
                                            <input type="text" class="form-control" name="address2" id="address2" value="${sessionScope.address2}" placeholder="Apartment, suite, unit, building, floor, etc.">
                                        </div> <!-- form-group// --> 
                                        <input type='hidden' name='section' value='payment'>
                                        <input class="btn btn-primary btn-block" type="submit" name="payment" value="Validate" id="payment">
                                        </form> <!-- form-group// -->
                                </div> <!-- card-body.// -->
                            </div> <!-- card .// -->
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="/footer.jsp" flush="false" />
    </body>
</html>
