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
                <li class="breadcrumb-item active" aria-current="page">Consult my orders</li>
            </ol>
        </nav>
        <%-- /Navbar --%>

        <%-- Slide --%>
        <div class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="ressources/pics/register_slide1.jpg" alt="register picture">
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
                            <a class="outdoors text-dark text-decoration-none myAddressBook" href="logincustomer?section=showAddressBook">My address book</a>
                        </div>
                        <div>  
                            <a class="outdoors text-dark text-decoration-none myOrders" href="">My orders</a>
                        </div>
                        <div>    
                            <a class="outdoors text-dark text-decoration-none myComments" href="logincustomer?section=showComments">My comments</a>
                        </div>
                        <div>    
                            <a class="outdoors text-dark text-decoration-none disconnect" href="logincustomer?section=disconnection">Disconnect</a>
                        </div>


                    </div>
                    <div class="col-md-1"></div>
                    <%-- /Sidebar --%>

                    <%-- Main container --%>
                    <div class="col-md-6">
                        

                        <%-- ORDERS SECTION --%>
                        <h4 class="subcategory">MY ORDERS</h4>
                        <hr>
                        <section>
                            <div class="row">
                                <div class="col">
                                    <table>
                                        <thead class="titleAccount">
                                            <tr>
                                                <th scope="col">Date</th>
                                                <th scope="col">Order number</th>
                                                <th scope="col">Book title</th>
                                                <th scope="col">Quantity</th>
                                                <th scope="col">Price unit</th>
                                                <th scope="col">Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="order" items="${sessionScope.listOrder}" >
                                            <tr>
                                                <td>${ order.orderDate }</td>
                                                <td>${ order.orderNumber }</td>
                                                <td>${ order.title }</td>
                                                <td>${ order.quantity }</td>
                                                <td>${ order.price }€</td>
                                                <td>${ order.orderTotal }€</td>
                                            </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </section>
                        <%-- /ORDERS SECTION --%>

                       
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
