<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Overview of your order  - BookShop</title>
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
                <li class="breadcrumb-item"><a href="OrderController?section=payment">Payment</a></li>
                <li class="breadcrumb-item active" aria-current="page">Overview</li>
            </ol>
        </nav> 
        <!-- Navbar Path .//--!>
        
        <!-- ============================ COMPONENT OVERVIEW  ================================= -->
        <section>
            <div class="album py-4 bg-light">
                <div class="container">

                    <!-- ========== PROGRESS BAR  ========== -->
                    <div class="progress">
                        <div class="progress-bar progress-bar-striped" role="progressbar" style="width: 80%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                    </div><div class="album py-2 bg-light"></div>
                    <!-- ========== // PROGRESS BAR // ========== -->

                    <div class="row">

                        <!-- ========== LEFT ZONE OF THE CART ========== -->
                        <main class="col-md-8">
                            <article class="card mb-4">
                                <div class="card-body">
                                    <h4 class="card-title mb-4">Overview cart</h4>
                                    <div class="row">
                                        <c:forEach var="i" items="${sessionScope.cartSession}">
                                            <c:set var="totalItem" value="${i.quantity * i.price}" />
                                            <c:set var="totalCart" value="${totalCart = totalCart + totalItem}" />  
                                            <div class="col-md-6">
                                                <figure class="itemside  mb-4">
                                                    <div class="aside"><img src="http://lorempixel.com/50/50/" class="border img-sm"></div>
                                                    <figcaption class="info">
                                                        <p>${i.title} </p>
                                                        <span class="text-muted">Quantity : ${i.quantity} x ${i.price} = ${totalItem} € </span>
                                                    </figcaption>
                                                </figure>
                                            </div> <!-- col.// -->
                                        </c:forEach>
                                        <!-- Total with VAT -->
                                        <c:set var="ttc" value="${totalTTC = totalCart * 1.055}"/>
                                        <!-- format totalTTC with 2 digits after the point -->
                                        <fmt:formatNumber var="totalTTC" type="number" value="${totalTTC}" maxFractionDigits="2"/>
                                    </div> <!-- row.// -->
                                </div> <!-- card-body.// -->
                            </article> <!-- card.// -->
                        </main> <!-- col.// -->
                        <!-- ========== // LEFT ZONE OF THE CART // ========== -->

                        <!-- ========== RIGHT ZONE OF THE CART ========== -->
                        <aside class="col-md-4">
                            <div class="card shadow">
                                <div class="card-body">
                                    <h4 class="mb-3">Overview</h4>
                                    <dl class="dlist-align">
                                        <dt class="text-muted">Delivery:</dt>
                                        <dd>Pick-up</dd>
                                    </dl>
                                    <dl class="dlist-align">
                                        <dt class="text-muted">Delivery type:</dt>
                                        <dd>Standard</dd>
                                    </dl>
                                    <dl class="dlist-align">
                                        <dt class="text-muted">Payment method:</dt>
                                        <dd>Bluecard</dd>
                                    </dl>
                                    <hr>
                                    <table class="table table-borderless"">
                                        <thead>
                                            <tr>
                                                <th scope="col" colspan="2"><h4>Total:</h4></th>
                                        <th scope="col" colspan="2"><h4>TTC :</h4></th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td colspan="2"><h5>${totalCart} € </h5></td>
                                                <td colspan="2"><h5><c:out value="${totalTTC}"/> €</h5> </td>
                                            </tr>
                                        </tbody></table>
                                    <hr>
                                    <p class="small mb-3 text-muted">By clicking you are agree with terms of condition </p>
                                    <a href="OrderController?section=confirmOrder" class="btn btn-primary btn-block"> Validate </a>
                                </div> <!-- card-body.// -->
                            </div> <!-- card.// -->
                        </aside> <!-- col.// -->
                        <!-- ========== // RIGHT ZONE OF THE CART // ========== -->

                    </div> <!-- row.// -->
                </div> <!-- container .// -->

                <!-- ============================ COMPONENT OVERVIEW  ================================= -->

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

        <!-- footer -->                            
        <jsp:include page="/footer.jsp" flush="false" />
        <!-- footer .// -->

    </body>
</html>
