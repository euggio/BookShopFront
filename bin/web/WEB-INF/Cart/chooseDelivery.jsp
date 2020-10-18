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
                <li class="breadcrumb-item active" aria-current="page">Delivery</li>
            </ol>
        </nav> 
        <!-- ============================ COMPONENT DELIVERY  ================================= -->
        <section>

            <div class="album py-4 bg-light">
                <div class="container">
                    <div class="progress">
                        <div class="progress-bar progress-bar-striped" role="progressbar" style="width: 25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                    </div><div class="album py-2 bg-transparent"></div>
                    <div class="card">
                        <div class="album py-3 bg-transparent"></div>
                        <div class="row">
                            <div class="col-md-12 text-center">
                            <h3 class="card-title">Select a shipping address </h3>
                            <p class="small mb-3 text-muted"> Is the address you'd like to use displayed below? If so, click the corresponding "Deliver to this address" button. Or you can enter a new shipping address.</p>
                        </div>
                        </div>
                        <div class="album py-2 bg-transparent"></div>
                        <form action="CartController" method="post">
                            <ul class="row" id="listitems" >
                                <c:forEach var="adr" items="${sessionScope.adrDelivery}">
                                    <div class="col-md-5">
                                        <div class="card mb-3 shadow-sm">
                                            <div class="card-body">
                                                <h6 class="text-muted">Delivery to ${adr.firstname} ${adr.lastname}</h6>
                                                <div class="d-flex justify-content-between align-items-center">
                                                    <p> Phone : ${adr.phone} <br>
                                                        Location: ${adr.street}, ${adr.street2} <br> 
                                                        P.O. Box: ${adr.zip}, ${adr.city}, ${adr.country} 
                                                    </p>
                                                </div>
                                                <div class="d-flex justify-content-between align-items-center">
                                                    <div class="btn-group">
                                                        <input type='hidden' name='section' value='payment'>
                                                        <input type='hidden' name='deliverAddress' value='${adr.addressId}'>
                                                        <input class="btn btn-primary btn-block" type="submit" name="payment" value="Deliver to this address" id="payment">
                                                    </div>    
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </ul>
                        </form>
                        <div class="row justify-content-center">
                            <div class="form-group col-md-4">
                                <form action="CartController" method="post">
                                    <input type='hidden' name='section' value='delivery'>
                                    <input class="btn btn-primary btn-block" type="submit" name="delivery" value="Enter a new shipping address " id="delivery">
                                    <div class="album py-2 bg-transparent"></div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="/footer.jsp" flush="false" />
    </body>
</html>
