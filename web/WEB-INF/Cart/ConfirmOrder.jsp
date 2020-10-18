<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Thank you for your purchase - BookShop</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="ressources/css/bootstrap.min.css" >
        <link rel="stylesheet" href="ressources/css/styles.css" >
        <script type="text/javascript" src="ressources/js/jquery-3.5.1.js"></script>
        <script type="text/javascript" src="ressources/js/popper.min.js"></script>
        <script type="text/javascript" src="ressources/js/bootstrap.min.js"></script>
    </head>
    <body>

        <!-- header --!>
        <jsp:include page="/header.jsp" flush="false" />
        <!-- header .// -->

        <!-- Navbar Path  -->
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="controller">Home</a></li>
                <li class="breadcrumb-item"><a href="ProductController?section=allProduct">Products</a></li>
                <li class="breadcrumb-item active" aria-current="page">Confirm Order</li>
            </ol>
        </nav> 
        <!-- Navbar Path .//--!>
        
        <!-- ============================ COMPONENT CONFIRM ORDER  ================================= -->
        <section>
            <div class="album py-4 bg-light">
                <div class="container">

                    <!-- ========== PROGRESS BAR  ========== -->
                    <div class="progress">
                        <div class="progress-bar bg-success progress-bar-striped" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <div class="album py-2 bg-light"></div>
                    <!-- ========== // PROGRESS BAR // ========== -->

                    <!-- ========== TOP OF THE CONFIRM ORDER ========== -->
                    <div class="jumbotron jumbotron2 text-center">
                        <h1 class="display-3">Thank You for your purchase !</h1>
                        <p class="lead"><strong>Please check your email</strong> for further instructions on how to track your order.</p>
                        <hr>
                        <p class="lead">
                            <a class="btn btn-primary btn-sm" href="controller" role="button">Continue to homepage</a>
                        </p>
                    </div>
                    <div class="album py-2 bg-light"></div>
                    <div class="row justify-content-center">
                        <main class="col-md-9">
                            <article class="card">

                                <!-- Retrieval of the collection "cartSession" with price information -->
                                <c:forEach var="cart" items="${sessionScope.cartSession}">
                                    <c:set var="totalItem" value="${cart.quantity * cart.price}" />
                                    <c:set var="totalCart" value="${totalCart = totalCart + totalItem}" />  
                                </c:forEach>
                                <!-- Total with VAT -->
                                <c:set var = "ttc" value = "${totalTTC = totalCart * 1.055}"  />
                                <!-- format totalTTC with 2 digits after the point -->
                                <fmt:formatNumber var = "totalTTC" type="number" value = "${totalTTC}" maxFractionDigits="2"/>
                                <!-- Retrieval of the collection "cartSession" with price information .// -->

                                <!-- Retrieval of the collection "invoiceAddr" with address information -->
                                <c:forEach var="invoice" items="${sessionScope.adrInvoice}">
                                    <c:set var="labelI" value="${invoice.labelAddress}"/>
                                    <c:set var="companyI" value="${invoice.companyAddress}"/>
                                    <c:set var="firstnameI" value="${invoice.firstname}"/>
                                    <c:set var="lastnameI" value="${invoice.lastname}"/>
                                    <c:set var="streetI" value="${invoice.street}"/>
                                    <c:set var="street2I" value="${invoice.street2}"/>
                                    <c:set var="zipI" value="${invoice.zip}"/>
                                    <c:set var="cityI" value="${invoice.city}"/>
                                    <c:set var="countryI" value="${invoice.country}"/>
                                    <c:set var="phoneI" value="${invoice.phone}"/>
                                </c:forEach>
                                <!-- Retrieval of the collection "invoiceAddr" with address information .// -->

                                <!-- Retrieval of the collection "deliveryAddr" with address information -->
                                <c:forEach var="deliver" items="${sessionScope.deliveryAddr}">
                                    <c:set var="labelSD" value="${deliver.labelAddress}"/>
                                    <c:set var="companySD" value="${deliver.companyAddress}"/>
                                    <c:set var="firstnameSD" value="${deliver.firstname}"/>
                                    <c:set var="lastnameSD" value="${deliver.lastname}"/>
                                    <c:set var="streetSD" value="${deliver.street}"/>
                                    <c:set var="street2SD" value="${deliver.street2}"/>
                                    <c:set var="zipSD" value="${deliver.zip}"/>
                                    <c:set var="citySD" value="${deliver.city}"/>
                                    <c:set var="countrySD" value="${deliver.country}"/>
                                    <c:set var="phoneSD" value="${deliver.phone}"/>
                                </c:forEach>
                                <!-- Retrieval of the collection "deliveryAddr" with address information .// -->

                                <c:forEach var="order" items="${sessionScope.orderData}">
                                    <c:set var="orderId" value="${order.orderId}"/>
                                    <c:set var="orderDate" value="${order.orderDate}"/>
                                </c:forEach>

                                <header class="card-header">
                                    <strong class="d-inline-block mr-3">Order ID: ${orderId} </strong>
                                    <span>Order Date: ${orderDate}</span>
                                </header>
                                <div class="card-body">
                                    <div class="row"> 
                                        <div class="col-md-8">
                                            <!-- Show address information if there is an address that has been selected -->
                                            <!-- "SD" is for a Selected Delivery address -->
                                            <c:if test="${!empty sessionScope.deliveryAddr}">
                                                <h6 class="text-muted">Delivery to ${lastnameSD} ${firstnameSD}</h6>
                                                <div class="d-flex justify-content-between align-items-center">
                                                    <p> ${streetSD} <br>
                                                        ${street2SD} <br>
                                                        ${citySD}, ${zipSD}<br>
                                                        ${countrySD}<br>
                                                        ${phoneSD} 
                                                    </p>
                                                </div>
                                            </c:if>
                                            <!-- Show address information if there is an address that has been selected .// --> 

                                            <!-- Show address information if there is an address that has been created -->  
                                            <!-- "ND" is for a New Delivery address -->
                                            <c:if test="${empty sessionScope.deliveryAddr}">
                                                <h6 class="text-muted">Delivery to ${lastnameND} ${firstnameND}</h6>
                                                <div class="d-flex justify-content-between align-items-center">
                                                    <p> ${streetND} <br>
                                                        ${street2ND} <br>
                                                        ${cityND}, ${zipND}<br>
                                                        ${countryND}<br>
                                                        ${phoneND} 
                                                    </p>
                                                </div>
                                            </c:if>
                                            <!-- Show address information if there is an address that has been created .// -->  

                                        </div>
                                        <div class="col-md-4">
                                            <h6 class="text-muted">Payment</h6>
                                            <span class="text-success">
                                                <i class="fab fa-lg fa-cc-visa"></i>
                                                Visa  **** 4216  
                                            </span>
                                            <p>Subtotal: ${totalCart} €<br>
                                                Shipping fee:  Free <br> 
                                                VAT : 5,5 %
                                                <span class="b">Total TTC :  ${totalTTC} € </span>
                                            </p>
                                        </div>
                                    </div> <!-- row.// -->
                                </div> <!-- card-body .// -->

                                <!-- A table grouping the items purchased -->
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th scope="col" colspan="2" style="padding-left:6rem">Title</th>
                                                <th scope="col">Quantity</th>
                                                <th scope="col">Price</th>
                                                <th scope="col">Details</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="i" items="${sessionScope.cartSession}">    
                                                <c:set var="totalItem" value="${i.quantity * i.price}" />
                                                <tr>
                                                    <td width="65">
                                                        <img src="http://lorempixel.com/50/50/" class="img-xs border">
                                                    </td>
                                                    <td>
                                                        <p class="title mb-0">${i.title} </p>
                                                        <var class="price text-muted">${i.price} €</var>
                                                    </td>
                                                    <td width="150" style="vertical-align: inherit">
                                                        <p class="title mb-0">${i.quantity} </p>
                                                    </td>
                                                    <td width="200" style="vertical-align: inherit"> 
                                                        <p class="title mb-0">${totalItem} € </p> 
                                                    </td>
                                                    <td width="150" style="vertical-align: inherit">
                                                        <a href="#" class="btn btn-light"> Details </a> 
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div> <!-- table-responsive .end// -->
                                <!-- A table grouping the items purchased .// -->

                            </article>
                        </main>
                    </div> <!-- row .//-->
                </div> <!-- container -->

                <!-- ============================ // COMPONENT CONFIRM ORDER //  ================================= -->                                    

                <!-- ========== BOTTOM ZONE OF THE CONFIRMORDER ========== -->
                <div class="album py-2 bg-light"></div>
                <article class="card card-body">
                    <div class="container">
                        <div class="row">

                            <!-- First paragraph -->
                            <div class="col-md-4">	
                                <figure>
                                    <span class="text-primary"><img src="ressources/pics/fast.png" ></span>
                                    <figcaption class="pt-3">
                                        <h5 class="title">Fast delivery</h5>
                                        <p>Dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                            tempor incididunt ut labore </p>
                                    </figcaption>
                                </figure>
                            </div>
                            <!-- First paragraph .// -->

                            <!-- Second paragraph -->
                            <div class="col-md-4">
                                <figure>
                                    <span class="text-primary"><img src="ressources/pics/quality.png" ></span>	
                                    <figcaption class="pt-3">
                                        <h5 class="title">Creative Strategy</h5>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                        </p>
                                    </figcaption>
                                </figure>
                            </div>
                            <!-- Second paragraph .// -->

                            <!-- Third paragraph -->
                            <div class="col-md-4">
                                <figure>
                                    <span class="text-primary"><img src="ressources/pics/secured.png" ></span>
                                    <figcaption class="pt-3">
                                        <h5 class="title">High secured </h5>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                                        </p>
                                    </figcaption>
                                </figure>
                            </div>
                            <!-- Third paragraph .// -->

                        </div> <!-- row -->
                    </div> <!-- container -->
                </article>
                <!-- ========== BOTTOM ZONE OF THE CONFIRMORDER .// ========== -->

            </div> <!-- album py-4 bg-light -->
        </section>

        <!-- footer -->
        <jsp:include page="/footer.jsp" flush="false" />
        <!-- footer .// -->

    </body>
</html>
