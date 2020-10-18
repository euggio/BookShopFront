<%-- 
    Document   : showCustomer
    Created on : 3 oct. 2020, 13:02:16
    Author     : euggio
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>My account</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="ressources/css/bootstrap.min.css" >
        <link rel="stylesheet" href="ressources/css/styles.css" >
        <link rel="stylesheet" href="ressources/css/signIn.css" >
        <script type="text/javascript" src="ressources/js/jquery-3.5.1.js"></script>
        <script type="text/javascript" src="ressources/js/popper.min.js"></script>
        <script type="text/javascript" src="ressources/js/bootstrap.min.js"></script>
    </head>
    <body>
        <%-- Header --%>
        <jsp:include page="/header.jsp" flush="false" />

        <%-- Navbar --%>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="controller">Home</a></li>
                <li class="breadcrumb-item"><a href="logincustomer?section=dashboard">Account</a></li>
                <li class="breadcrumb-item active" aria-current="page">Edit my address book</li>
            </ol>
        </nav>
        <%-- /Navbar --%>


        <%-- Slide --%>
        <div class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="ressources/pics/register_slide6.jpg" alt="register picture">
                </div>
            </div>
        </div>
        <%-- /Slide --%>

        <%-- Space --%>
        <div class="mt-5"></div>
        <%-- /Space --%>

        <%-- Main --%>
        <div class="album py-4">
            <div class="container-fluid paddingBis">
                <div class="row">

                    <%-- Space --%>
                    <div class="col-md-1"></div>
                    <%-- /Space --%>

                    <%-- Sidebar --%>
                    <div class="col-md-2 d-none d-md-block bg-light sidebar">


                        <h4>My account</h4>
                        <hr>

                        <div>    
                            <a class="outdoors text-dark text-decoration-none myDashboard" href="logincustomer?section=dashboard">My dashboard</a>
                        </div>
                        <div>    
                            <a class="outdoors text-dark text-decoration-none myInformations" href="logincustomer?section=editInformations">My informations</a>
                        </div>
                        <div >    
                            <a class="outdoors text-dark text-decoration-none myAddressBook" href="">My address book</a>
                        </div>
                        <div>  
                            <a class="outdoors text-dark text-decoration-none myOrders" href="logincustomer?section=showOrder">My orders</a>
                        </div>
                        <div>    
                            <a class="outdoors text-dark text-decoration-none myComments" href="logincustomer?section=showComments">My comments</a>
                        </div>
                        <div>    
                            <a class="outdoors text-dark text-decoration-none disconnect" href="controller">Disconnect</a>
                        </div>


                    </div>
                    <div class="col-md-1"></div>
                    <%-- /Sidebar --%>

                    <%-- Main container --%>
                    <div class="col-md-6">


                        <%-- ADDRESS BOOK SECTION --%>
                        <h4>ADDRESS BOOK</h4>
                        <hr>
                        <section>
                            <div class="row">
                                <%-- INVOICE ADDRESS --%>
                                <div class="col">
                                    <div class="col-md-8 mb-3">
                                        <h5 >Invoice addresses</h5>
                                    </div>
                                    <form method="get" action="logincustomer">
                                        <c:forEach var="item" items="${ sessionScope.cucuAddInv }">
                                            <div class="col-md-8">
                                                <div class="card mb-4 shadow-sm">
                                                    <div class="card-body">
                                                        <h6 class="text-muted text-uppercase">${ item.labelAddress }</h6>
                                                        <hr>
                                                        <p>${ sessionScope.cucu.socialTitleLabel } ${ item.firstname } ${ item.lastname }<br>
                                                            <c:if test="${ !empty item.companyAddress }">
                                                                ${ item.companyAddress }<br>
                                                            </c:if>
                                                            ${ item.street }<br>
                                                            <c:if test="${ !empty item.street2 }">
                                                                ${ item.street2 }<br>
                                                            </c:if>
                                                            ${ item.zip }, ${ item.city }<br>
                                                            ${ item.country }</p>  
                                                        <input type="hidden" name="section" value="editInvAddress"/>
                                                        <button type="submit" class="btn btn-secondary">Edit address</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </form>
                                </div>
                                <%-- /INVOICE ADDRESS --%>

                                <%-- DELIVERY ADDRESS --%>
                                <div class="col">
                                    <div class="col-md-8 mb-3">
                                        <h5 >Delivery addresses</h5>
                                    </div>
                                    <form method="get" action="logincustomer">
                                        <c:forEach var="item" items="${ sessionScope.cucuAddDel }">
                                            <div class="col-md-8">
                                                <div class="card mb-4 shadow-sm">
                                                    <div class="card-body">
                                                        <h6 class="text-muted text-uppercase">${ item.labelAddress }</h6>
                                                        <hr>
                                                        <p>${ sessionScope.cucu.socialTitleLabel } ${ item.firstname } ${ item.lastname }<br>
                                                            <c:if test="${ !empty item.companyAddress }">
                                                                ${ item.companyAddress }<br>
                                                            </c:if>
                                                            ${ item.street }<br>
                                                            <c:if test="${ !empty item.street2 }">
                                                                ${ item.street2 }<br>
                                                            </c:if>
                                                            ${ item.zip }, ${ item.city }<br>
                                                            ${ item.country }</p> 
                                                        <input type="hidden" name="section" value="editDelAddress"/>
                                                        <button type="submit" class="btn btn-secondary">Edit address</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </form>
                                </div>
                                <%-- /DELIVERY ADDRESS --%>




                            </div>
                        </section>
                        <%-- /ADDRESS BOOK SECTION --%>
                    </div>
                    <div class="col-md-3"></div>
                    <%-- /Main container --%>


                </div>
            </div>
        </div>
        <%-- /Main --%>

        <%-- Space --%>
        <div class="mb-5"></div>
        <%-- /Space --%>


        <%-- Footer --%>
        <jsp:include page="/footer.jsp" flush="false" />
    </body>
</html>
