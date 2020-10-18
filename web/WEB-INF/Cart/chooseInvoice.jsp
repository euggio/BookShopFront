<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Select a billing address  - BookShop</title>
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
                <li class="breadcrumb-item"><a href="CartController?section=viewCart">Cart</a></li>
                <li class="breadcrumb-item active" aria-current="page">Billing Address</li>
            </ol>
        </nav> 
        <!-- Navbar Path .//--!>
        
        <!-- ============================ COMPONENT CHOOSE INVOICE  ================================= -->
        <section>
            <div class="album py-4 bg-light">
                <div class="container">

                    <!-- ========== PROGRESS BAR  ========== -->
                    <div class="progress">
                        <div class="progress-bar progress-bar-striped" role="progressbar" style="width: 20%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                    </div><div class="album py-2 bg-transparent"></div>
                    <!-- ========== // PROGRESS BAR // ========== -->

                    <div class="card">
                        <div class="album py-3 bg-transparent"></div>
                        <div class="row">
                            <div class="col-md-12 text-center">
                                <h3 class="card-title">Select an Billing address </h3>
                            </div>
                        </div>
                        <div class="album py-2 bg-transparent"></div>
                        <ul class="row" id="listitems" >

                            <!-- Retrieval of the collection "adrInvoice" with address information -->
                            <c:forEach var="adr" items="${sessionScope.adrInvoice}">
                                <div class="col-md-4">
                                    <div class="card mb-3 shadow-sm">
                                        <div class="card-body">
                                            <h6 class="text-muted">Invoiced to ${adr.lastname} ${adr.firstname}</h6>
                                            <div class="d-flex justify-content-between align-items-center">
                                                <p> ${adr.street} <br>
                                                    ${adr.street2} <br>
                                                    ${adr.city}, ${adr.zip}<br>
                                                    ${adr.country}<br>
                                                    ${adr.phone} 
                                                </p>
                                            </div>
                                            <div class="d-flex justify-content-between align-items-center">
                                                <div class="btn-group">
                                                    <li class="list-group-item border-0 px-0"><a href="AddressController?section=chooseDelivery&invoiceAddress=${adr.addressId}" class="btn btn-primary btn-block">Bill to this address</a></li>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <!-- Retrieval of the collection "adrInvoice" with address information .// -->
                        </ul>
                    </div> <!-- card -->
                </div> <!-- container -->

                <!-- ========== BOTTOM ZONE OF THE CART ========== -->
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
                <!-- ========== BOTTOM ZONE OF THE CART .// ========== -->

            </div> <!-- album py-4 bg-light -->
        </section>
        <!-- ============================ // COMPONENT CHOOSE INVOICE // ================================= -->

        <!-- footer -->
        <jsp:include page="/footer.jsp" flush="false" />
        <!-- footer .// -->

    </body>
</html>
