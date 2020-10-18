<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Proceed to payment - BookShop</title>
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
                <li class="breadcrumb-item"><a href="AddressController?section=chooseInvoice">Billing Address</a></li>
                <li class="breadcrumb-item"><a href="AddressController?section=chooseDelivery">Shipping Address</a></li>
                <li class="breadcrumb-item active" aria-current="page">Payment</li>
            </ol>
        </nav>
        <!-- Navbar Path .//--!>
        
        <!-- ============================ COMPONENT PAYMENT  ================================= -->
        <section>
            <div class="album py-4 bg-light">
                <div class="container">

                    <!-- ========== PROGRESS BAR  ========== -->
                    <div class="progress">
                        <div class="progress-bar progress-bar-striped" role="progressbar" style="width: 60%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                    </div><div class="album py-2 bg-light"></div>
                    <!-- ========== // PROGRESS BAR // ========== -->

                    <div class="row justify-content-center">
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title mb-4">Payment info</h4>
                                    <form action="OrderController" method="post" role="form">
                                        <div class="form-group">
                                            <label for="username">Name on card</label>
                                            <input type="text" class="form-control" name="username" id="username" placeholder="Ex. Julien Claudel" required>
                                            <span class="erreur text-needed">${form.errors['username']}</span>
                                        </div> <!-- form-group.// -->
                                        <div class="form-group">
                                            <label for="cardNumber">Card number</label>
                                            <div class="input-group">
                                                <input type="number" class="form-control" name="cardNumber" id="cardNumber" required>
                                                <span class="erreur text-needed">${form.errors['cardNumber']}</span>
                                                <div class="input-group-append">
                                                    <span class="input-group-text">
                                                        <i class="fab fa-cc-visa"></i> &nbsp; <i class="fab fa-cc-amex"></i> &nbsp; 
                                                        <i class="fab fa-cc-mastercard"></i> 
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md flex-grow-0">
                                                <div class="form-group">
                                                    <label><span class="hidden-xs">Expiration</span> </label>
                                                    <div class="form-inline" style="min-width: 220px">
                                                        <select class="form-control" style="width:100px" required>
                                                            <c:forEach var="i" items="${months}" >
                                                                <option>${i}</option>
                                                            </c:forEach>
                                                        </select>
                                                        <span style="width:20px; text-align: center"> / </span>
                                                        <select class="form-control" style="width:100px" required>
                                                            <c:forEach var="i" items="${years}" >
                                                                <option>${i}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div> <!-- from-inline .// -->
                                                </div> <!-- form-group .// -->
                                            </div> <!-- col-md flex-grow-0 .// -->
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label data-toggle="cvv" title="" data-original-title="3 digits code on back side of the card">CVV <i class="fa fa-question-circle"></i></label>
                                                    <input class="form-control" name="cvv" id="cvv" type="number" required>
                                                    <span class="erreur text-needed">${form.errors['cvv']}</span>
                                                </div>
                                            </div>
                                        </div> <!-- row.// -->
                                        <input type='hidden' name='section' value='verifPayment'>
                                        <input class="btn btn-primary btn-block" type="submit" name="verifPayment" value="Confirm" id="verifPayment">
                                    </form> <!-- role-form .// -->
                                </div> <!-- card-body.// -->
                            </div> <!-- card .// -->
                        </div> <!-- col-lg-6 .// -->
                    </div> <!-- row justify-content-center .// -->
                </div> <!-- container .// -->

                <!-- ============================ // COMPONENT PAYMENT // ================================= -->

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

            </div> <!-- album py-4 bg-light .// -->
        </section>

        <!-- footer --!>
        <jsp:include page="/footer.jsp" flush="false" />
        <!-- footer .// -->

    </body>
</html>