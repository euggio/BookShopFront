<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>BookShop Shopping Cart</title>
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
                <li class="breadcrumb-item active" aria-current="page">Cart</li>
            </ol>
        </nav> 
        <!-- Navbar Path .//--!>
        
        <!-- ============================ COMPONENT CART  ================================= -->
        <section>
            <div class="album py-4 bg-light">

                <!-- if the cart is empty it will be written " Empty Cart " -->
                <c:if test="${emptyCart}">
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <div class="card wish-list mb-2">
                                    <div class="card-body">
                                        <h3 class="card-title text-center justify-content-center">Empty Cart!</h3> 
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>

                <!-- if the cart is not empty it will appear -->
                <c:if test="${!emptyCart}">
                    <div class="container">

                        <!-- ========== LEFT ZONE OF THE CART ========== -->
                        <div class="row">
                            <div class="col-lg-8">
                                <div class="card wish-list mb-3">
                                    <div class="card-body">
                                        <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
                                            <h2 class="title-page"> Shopping cart</h2>
                                            <span> 

                                                <!-- Clear the cart -->
                                                <a href="CartController?section=manageCart&clear=${i.id}">
                                                    <svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                    <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                                    <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                                                    </svg>
                                                </a>
                                            </span>
                                        </li>

                                        <!-- Retrieval of the collection "list" with cart information -->
                                        <c:forEach var="i" items="${list}">    
                                            <hr class="mb-4">

                                            <!-- Creation of the total price of an item based on its quantity -->
                                            <c:set var="totalItem" value="${i.quantity * i.price}" />
                                            <!-- Creation of the total price of the cart based on the total of each item -->
                                            <c:set var="totalCart" value="${totalCart = totalCart + totalItem}" />
                                            <!-- Total with VAT -->
                                            <c:set var = "ttc" value = "${totalTTC = totalCart * 1.055}"  />
                                            <!-- format totalTTC with 2 digits after the point -->
                                            <fmt:formatNumber var = "totalTTC" type="number" value = "${totalTTC}" maxFractionDigits="2"/>

                                            <div class="row mb-4">
                                                <div class="col-md-5 col-lg-3 col-xl-3">
                                                    <div class="view zoom overlay z-depth-1 rounded mb-3 mb-md-0">
                                                        <!-- Click on the image to see the details of the item -->
                                                        <a href="ProductController?section=viewProduct&view=${i.isbn}"><img class="img-fluid w-100"src="${i.cover}" alt="Sample"></a>
                                                    </div>
                                                </div>
                                                <div class="col-md-7 col-lg-9 col-xl-9">
                                                    <div>
                                                        <div class="d-flex justify-content-between">
                                                            <div>
                                                                <h5>${i.title}</h5>
                                                                <p class="mb-3 text-muted text-uppercase small">${i.subtitle}</p>
                                                                <p class="mb-2 text-muted text-uppercase small">Price : ${i.price} €</p>
                                                            </div>
                                                            <div>
                                                                <div class="def-number-input number-input safari_only mb-0 w-100">

                                                                    <!-- Reduce the quantity of the item -->
                                                                    <a href="CartController?section=manageCart&dec=${i.id}">
                                                                        <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-dash-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                                        <path fill-rule="evenodd" d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                                                                        <path fill-rule="evenodd" d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                                                                        </svg>
                                                                    </a>
                                                                    <input class="quantity col-lg-6 text-center" min="1" max="99" name="quantity" value="${i.quantity}" type="number" readonly >

                                                                    <!-- Increase the quantity of the item -->
                                                                    <a href="CartController?section=manageCart&inc=${i.id}">
                                                                        <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-plus-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                                        <path fill-rule="evenodd" d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                                                                        <path fill-rule="evenodd" d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                                                                        </svg>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="d-flex justify-content-between align-items-center">
                                                            <div>

                                                                <!-- Delete an item -->
                                                                <a href="CartController?section=manageCart&del=${i.id}" type="button" class="card-link-secondary small text-uppercase mr-3"><i class="fas fa-trash-alt mr-1"></i> Remove item </a>
                                                            </div>
                                                            <p class="mb-0"><span><strong>${totalItem} €</strong></span></p>
                                                        </div>
                                                    </div>
                                                </div> <!-- col-m-7 col-lg-9 col-xl-9 -->
                                            </div> <!-- row mb-4 -->
                                        </c:forEach>
                                    </div> <!-- card-body -->

                                    <!-- Continue the shopping -->
                                    <div class="card-body border-top">
                                        <a href="ProductController?section=allProduct" class="btn btn-light float-md-right"> Continue shopping <i class="fa fa-chevron-right"></i> </a>
                                    </div>	
                                    <!-- Continue the shopping .// -->

                                </div> <!-- card wish-list mb-3 -->
                            </div> <!-- col-lg-8 -->
                            <!-- ========== // LEFT ZONE OF THE CART // ========== -->

                            <!-- ========== RIGHT ZONE OF THE CART ========== -->
                            <div class="col-lg-4">
                                <div class="card mb-3">
                                    <div class="card-body">
                                        <h2 class="title-page">Total Amount</h2>
                                        <ul class="list-group list-group-flush">
                                            <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">Temporary amount<span>${totalCart} €</span>
                                            </li>
                                            <li class="list-group-item d-flex justify-content-between align-items-center px-0">
                                                Shipping
                                                <span>Free</span>
                                            </li>
                                            <li class="list-group-item d-flex justify-content-between align-items-center px-0">
                                                VAT
                                                <span>5.5%</span>
                                            </li>
                                            <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
                                                <div>
                                                    <strong>The total amount of</strong>
                                                    <strong>
                                                        <p class="mb-0">(including VAT)</p>
                                                    </strong>
                                                </div>
                                                <!-- Display cart total -->

                                                <span><strong>${totalTTC} €</strong></span>
                                            </li>
                                        </ul>

                                        <!-- Process to checkout -->
                                        <a href="AddressController?section=chooseInvoice&totalCart=${totalCart}" class="btn btn-primary btn-block"> Checkout </a>
                                        <!-- Process to checkout .// -->

                                    </div> <!-- card-body -->
                                </div> <!-- card mb-3 -->

                                <!-- Discount code -->
                                <div class="card mb-3">
                                    <div class="card-body">
                                        <a class="dark-grey-text d-flex justify-content-between" data-toggle="collapse" href="#collapseExample1"
                                           aria-expanded="false" aria-controls="collapseExample1">
                                            Add a discount code (optional)
                                            <span><i class="fas fa-chevron-down pt-1"></i></span>
                                        </a>
                                        <div class="collapse" id="collapseExample1">
                                            <div class="mt-3">
                                                <div class="md-form md-outline mb-0">
                                                    <input type="text" id="discount-code1" class="form-control font-weight-light" placeholder="Enter discount code">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- Discount code .// -->

                            </div> <!-- col-lg-4 -->
                        </div> <!-- row -->
                    </div> <!-- container -->
                    <!-- ========== // RIGHT ZONE OF THE CART // ========== -->

                    <!-- ========== BOTTOM ZONE OF THE CART ========== -->
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

                </c:if>   
                <!-- End of the cart condition .// -->

            </div> <!-- album py-4 bg-light -->
        </section>
        <!-- ============================ // COMPONENT CART //  ================================= -->

        <!-- footer --!>
        <jsp:include page="/footer.jsp" flush="false" />
        <!-- footer -->
    </body>
</html>