<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                <li class="breadcrumb-item active" aria-current="page">Confirm Order</li>
            </ol>
        </nav> 
        <section>
            <div class="album py-4 bg-light">
                <div class="container">
                    <div class="progress">
                        <div class="progress-bar bg-success progress-bar-striped" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <div class="album py-2 bg-light"></div>
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
                                <c:forEach var="i" items="${sessionScope.panierSession}">
                                    <c:set var="totalArticle" value="${i.quantity * i.price}" />
                                    <c:set var="totalPanier" value="${totalPanier = totalPanier + totalArticle}" />  
                                </c:forEach>
                                <c:forEach var="deliver" items="${sessionScope.deliveryAddr}">
                                    <c:set var="label" value="${deliver.labelAddress}"/>
                                    <c:set var="company" value="${deliver.companyAddress}"/>
                                    <c:set var="firstname" value="${deliver.firstname}"/>
                                    <c:set var="lastname" value="${deliver.lastname}"/>
                                    <c:set var="street" value="${deliver.street}"/>
                                    <c:set var="street2" value="${deliver.street2}"/>
                                    <c:set var="zip" value="${deliver.zip}"/>
                                    <c:set var="city" value="${deliver.city}"/>
                                    <c:set var="country" value="${deliver.country}"/>
                                    <c:set var="phone" value="${deliver.phone}"/>
                                </c:forEach>
                                
                                <header class="card-header">
                                    <strong class="d-inline-block mr-3">Order ID: 4659784956</strong>
                                    <span>Order Date: 04 Octobre 2020</span>
                                </header>
                                <div class="card-body">
                                    <div class="row"> 
                                        <div class="col-md-8">
                                            <h6 class="text-muted">Delivery to</h6>
                                            <c:if test="${!empty sessionScope.deliveryAddr}">
                                                <p> ${firstname} ${lastname} <br>  
                                                    Phone : ${phone} <br>
                                                    Email: claudel.julien@live.fr <br>
                                                    Location: ${street}, ${street2}<br> 
                                                    P.O. Box: ${zip}, ${city}, ${country}
                                                </p>
                                            </c:if>
                                            <c:if test="${empty sessionScope.deliveryAddr}">
                                                <p> ${firstName} ${lastName} <br>  
                                                    Phone : ${tel} <br>
                                                    Email: claudel.julien@live.fr <br>
                                                    Location: ${address}, ${address2}<br> 
                                                    P.O. Box: ${zip}, ${city}, ${country}
                                                </p>
                                            </c:if>
                                        </div>
                                        <div class="col-md-4">
                                            <h6 class="text-muted">Payment</h6>
                                            <span class="text-success">
                                                <i class="fab fa-lg fa-cc-visa"></i>
                                                Visa  **** 4216  
                                            </span>
                                            <p>Subtotal: ${totalPanier} €<br>
                                                Shipping fee:  Free <br> 
                                                <span class="b">Total:  ${totalPanier} € </span>
                                            </p>
                                        </div>
                                    </div> <!-- row.// -->
                                </div> <!-- card-body .// -->
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
                                            <c:forEach var="i" items="${sessionScope.panierSession}">    
                                                <c:set var="totalArticle" value="${i.quantity * i.price}" />
                                                <c:set var="totalPanier" value="${totalPanier = totalPanier + totalArticle}" />  
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
                                                        <p class="title mb-0">${totalArticle} € </p> 
                                                    </td>
                                                    <td width="150" style="vertical-align: inherit">
                                                        <a href="#" class="btn btn-light"> Details </a> 
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div> <!-- table-responsive .end// -->
                            </article> <!-- order-group.// --> 
                        </main>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="/footer.jsp" flush="false" />
    </body>
</html>
