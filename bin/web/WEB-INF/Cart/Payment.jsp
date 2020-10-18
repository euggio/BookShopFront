<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                <li class="breadcrumb-item active" aria-current="page">Payment</li>
            </ol>
        </nav> 
        <!-- ============================ COMPONENT PAYMENT  ================================= -->
        <section>
            <div class="album py-4 bg-light">
                <div class="container">
                    <div class="progress">
                    <div class="progress-bar progress-bar-striped" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                    </div><div class="album py-2 bg-light"></div>
                    <div class="row justify-content-center">
                            <div class="col-lg-6">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title mb-4">Payment info</h4>
                            <form role="form">
                                <div class="form-group">
                                    <label for="username">Name on card</label>
                                    <input type="text" class="form-control" name="username" placeholder="Ex. Julien Claudel" required="">
                                </div> <!-- form-group.// -->

                                <div class="form-group">
                                    <label for="cardNumber">Card number</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="cardNumber" placeholder="">
                                        <div class="input-group-append">
                                            <span class="input-group-text">
                                                <i class="fab fa-cc-visa"></i> &nbsp; <i class="fab fa-cc-amex"></i> &nbsp; 
                                                <i class="fab fa-cc-mastercard"></i> 
                                            </span>
                                        </div>
                                    </div> <!-- input-group.// -->
                                </div> <!-- form-group.// -->
                                <div class="row">
                                    <div class="col-md flex-grow-0">
                                        <div class="form-group">
                                            <label><span class="hidden-xs">Expiration</span> </label>
                                            <div class="form-inline" style="min-width: 220px">
                                                <select class="form-control" style="width:100px">
                                                    <option>MM</option>
                                                    <option>01 - January</option>
                                                    <option>02 - February</option>
                                                    <option>03 - March</option>
                                                    <option>04 - April</option>
                                                    <option>05 - May</option>
                                                    <option>06 - June</option>
                                                    <option>07 - July</option>
                                                    <option>08 - August</option>
                                                    <option>09 - September</option>
                                                    <option>10 - October</option>
                                                    <option>11 - November</option>
                                                    <option>12 - December</option>
                                                </select>
                                                <span style="width:20px; text-align: center"> / </span>
                                                <select class="form-control" style="width:100px">
                                                    <option>YY</option>
                                                    <option>20</option>
                                                    <option>21</option>
                                                    <option>22</option>
                                                    <option>23</option>
                                                    <option>24</option>
                                                    <option>25</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label data-toggle="tooltip" title="" data-original-title="3 digits code on back side of the card">CVV <i class="fa fa-question-circle"></i></label>
                                            <input class="form-control" required="" type="text">
                                        </div> <!-- form-group.// -->
                                    </div>
                                </div> <!-- row.// -->
                                <a href="CartController?section=overview" class="btn btn-primary btn-block">Confirm</a>
                            </form>
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