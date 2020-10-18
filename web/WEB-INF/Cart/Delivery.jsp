<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Add a shipping address - BookShop</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="ressources/css/bootstrap.min.css" >
        <link rel="stylesheet" href="ressources/css/styles.css" >
        <link rel="stylesheet" href="ressources/css/order.css" >
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
                <li class="breadcrumb-item active" aria-current="page">New Shipping Address</li>
            </ol>
        </nav>
        <!-- Navbar Path .//-->

        <!-- ============================ COMPONENT DELIVERY  ================================= -->
        <section>
            <div class="album py-4 bg-light">
                <div class="container">

                    <!-- ========== PROGRESS BAR  ========== -->    
                    <div class="progress">
                        <div class="progress-bar progress-bar-striped" role="progressbar" style="width: 40%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                    </div><div class="album py-2 bg-light"></div>
                    <!-- ========== // PROGRESS BAR // ========== -->

                    <div class="row justify-content-center">
                        <div class="col-lg-10">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title mb-4">Delivery info</h4>
                                    <form action="AddressController" method="get">
                                        <div class="form-row">
                                            <div class="col form-group">
                                                <label for="addressLabel">Label Address</label>
                                                <input type="text" class="form-control" name="addressLabel" id="addressLabel" value="${sessionScope.addressLabelND}">
                                            </div> <!-- form-group end.// -->
                                            <div class="col form-group">
                                                <label for="company">Label Company</label>
                                                <input type="text" class="form-control" name="company" id="company" value="${sessionScope.companyND}">
                                            </div> <!-- form-group end.// -->
                                        </div> <!-- form-row end.// -->
                                        <div class="form-row">
                                            <div class="col form-group">
                                                <label for="firstName">First name <span class="text-needed">*</span></label>
                                                <input type="text" class="form-control" name="firstName" id="firstName" value="${sessionScope.firstnameND}" required>
                                                <span class="erreur text-needed">${form.errors['firstName']}</span>
                                            </div> <!-- form-group end.// -->
                                            <div class="col form-group">
                                                <label for="lastName">Last name <span class="text-needed">*</span></label>
                                                <input type="text" class="form-control" name="lastName" id="lastName" value="${sessionScope.lastnameND}" required>
                                                <span class="erreur text-needed">${form.errors['lastName']}</span>
                                            </div> <!-- form-group end.// -->
                                        </div> <!-- form-row end.// -->
                                        <div class="form-row">
                                            <div class="col form-group">
                                                <label for="tel">Phone number <span class="text-needed">*</span></label>
                                                <input type="number" class="form-control" name="tel" id="tel" value="${sessionScope.phoneND}" required>
                                                <span class="erreur text-needed">${form.errors['tel']}</span>
                                            </div> <!-- form-group end.// -->

                                            <!-- Basic display "France" otherwise the one previously selected -->    
                                            <div class="form-group col-md-6">
                                                <label for="country">Country <span class="text-needed">*</span></label>
                                                <select class="form-control" name="country" id="country" value="${sessionScope.countryND}" required>
                                                    <c:if test="${!empty sessionScope.country}"><option selected="">${sessionScope.countryND}</option></c:if> 
                                                    <c:if test="${empty sessionScope.country}"><option selected="">France</option></c:if>
                                                    <c:forEach var="item" items="${country}">
                                                        <option>${item}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                            <!-- Basic display "France" otherwise the one previously selected .// -->   

                                        </div>
                                        <div class="form-row">
                                            <div class="col form-group">
                                                <label for="city">City <span class="text-needed">*</span></label>
                                                <input type="text" class="form-control" name="city" id="city" value="${sessionScope.cityND}" required>
                                                <span class="erreur text-needed">${form.errors['city']}</span>
                                            </div> <!-- form-group end.// -->
                                            <div class="col form-group">
                                                <label for="zip">Zip code <span class="text-needed">*</span></label>
                                                <input type="number" class="form-control" name="zip" id="zip" value="${sessionScope.zipND}" required>
                                                <span class="erreur text-needed">${form.errors['zip']}</span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="address">Adress <span class="text-needed">*</span></label>
                                            <input type="text" class="form-control" name="address" id="address" value="${sessionScope.streetND}" placeholder="Mailing address, PO box, company name, c / o" required>
                                            <span class="erreur text-needed">${form.errors['address']}</span>
                                        </div> 
                                        <div class="form-group">
                                            <label for="address">Adress 2</label>
                                            <input type="text" class="form-control" name="address2" id="address2" value="${sessionScope.street2ND}" placeholder="Apartment, suite, unit, building, floor, etc.">
                                        </div> 
                                        <input type='hidden' name='section' value='verifAddr'>
                                        <input class="btn btn-primary btn-block" type="submit" name="verifAddr" value="Validate" id="verifAddr">
                                    </form>
                                </div> <!-- card-body.// -->
                            </div> <!-- card .// -->
                        </div> <!-- col .// -->
                    </div> <!-- row .// -->
                </div> <!-- container .// -->

                <!-- ============================ // COMPONENT DELIVERY // ================================= -->                                

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
