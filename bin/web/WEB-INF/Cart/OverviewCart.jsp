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
                <li class="breadcrumb-item"><a href="CartController?section=viewCart">Cart</a></li>
                <li class="breadcrumb-item"><a href="CartController?section=delivery">Delivery</a></li>
                <li class="breadcrumb-item"><a href="CartController?section=payment">Payment</a></li>
                <li class="breadcrumb-item active" aria-current="page">Overview</li>
            </ol>
        </nav> 
        <section>
            <div class="album py-4 bg-light">
                <div class="container">
                    <div class="progress">
                        <div class="progress-bar progress-bar-striped" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                    </div><div class="album py-2 bg-light"></div>
                    <div class="row">
                        <main class="col-md-8">
                            <article class="card mb-4">
                                <div class="card-body">
                                    <h4 class="card-title mb-4">Overview cart</h4>
                                    <div class="row">
                                        <c:forEach var="i" items="${sessionScope.panierSession}">
                                            <c:set var="totalArticle" value="${i.quantity * i.price}" />
                                            <c:set var="totalPanier" value="${totalPanier = totalPanier + totalArticle}" />  
                                            <div class="col-md-6">
                                            <figure class="itemside  mb-4">
                                                <div class="aside"><img src="http://lorempixel.com/50/50/" class="border img-sm"></div>
                                                <figcaption class="info">
                                                    <p>${i.title} </p>
                                                    <span class="text-muted">Quantity : ${i.quantity} x ${i.price} = ${totalArticle} € </span>
                                                </figcaption>
                                            </figure>
                                        </div> <!-- col.// -->
                                        </c:forEach>
                                    </div> <!-- row.// -->
                                </div> <!-- card-body.// -->
                            </article> <!-- card.// -->

                        </main> <!-- col.// -->
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
                                        <dd>Cash</dd>
                                    </dl>
                                    <hr>
                                    <dl class="dlist-align">
                                        <dt>Total:</dt>
                                        <dd class="h5">${totalPanier} €</dd>
                                    </dl>
                                    <hr>
                                    <p class="small mb-3 text-muted">By clicking you are agree with terms of condition </p>
                                    <a href="CartController?section=confirmOrder" class="btn btn-primary btn-block"> Validate </a>

                                </div> <!-- card-body.// -->
                            </div> <!-- card.// -->
                        </aside> <!-- col.// -->
                    </div> <!-- row.// -->
                </div>
            </div>
        </section>
        <jsp:include page="/footer.jsp" flush="false" />
    </body>
</html>
