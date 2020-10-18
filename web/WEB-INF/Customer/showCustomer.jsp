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
                <li class="breadcrumb-item active" aria-current="page">Account / My dashboard</li>
            </ol>
        </nav>
        <%-- /Navbar --%>

        <%-- Slide --%>
        <div class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="ressources/pics/register_slide2.jpg" alt="register picture">
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
                            <a class="outdoors text-dark text-decoration-none myDashboard" href="">My dashboard</a>
                        </div>
                        <div>    
                            <a class="outdoors text-dark text-decoration-none myInformations" href="logincustomer?section=editInformations">My informations</a>
                        </div>
                        <div >    
                            <a class="outdoors text-dark text-decoration-none myAddressBook" href="logincustomer?section=showAddressBook">My address book</a>
                        </div>
                        <div>  
                            <a class="outdoors text-dark text-decoration-none myOrders" href="logincustomer?section=showOrder">My orders</a>
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
                        <%-- ACCOUNT INFORMATIONS SECTION --%>
                        <h4>ACCOUNT INFORMATIONS</h4>
                        <hr>
                        <section>
                            <div class="row">

                                <div class="col">

                                    <%-- FULL NAME --%>
                                    <label class="titleAccount" for="custoName">Name:</label>
                                    <c:if test="${ sessionScope.cucu.socialTitleLabel == null || sessionScope.cucu.lastname == null || sessionScope.cucu.firstname == null}">
                                        <p><a href="logincustomer?section=editInformations">Register my full name</a></p>
                                    </c:if>
                                    <c:if test="${ sessionScope.cucu.lastname != null || sessionScope.cucu.firstname != null}">
                                        <p>${ sessionScope.cucu.socialTitleLabel } ${ sessionScope.cucu.firstname } ${ sessionScope.cucu.lastname }</p>                                  
                                    </c:if>
                                    <%-- /FULL NAME --%> 

                                    <%-- EMAIL ADDRESS --%>
                                    <label class="titleAccount" for="custoMail">Email address:</label>
                                    <p>${ sessionScope.cucu.mail }</p>  
                                    <%-- /EMAIL ADDRESS --%>

                                    <%-- BIRTHDATE --%>
                                    <label class="titleAccount" for="custoBirthdate">Birthdate:</label>
                                    <c:if test="${ sessionScope.cucu.birthdate == null }">
                                        <p><a href="logincustomer?section=editInformations">Register my birthdate</a></p>
                                    </c:if>
                                    <c:if test="${ sessionScope.cucu.birthdate != null }">
                                        <p>${ sessionScope.cucu.birthdate }</p>
                                    </c:if>
                                    <%-- /BIRTHDATE --%>

                                </div>

                                <div class="col">

                                    <%-- PHONE NUMBER --%>
                                    <label class="titleAccount" for="custoPhone">Phone number:</label>
                                    <c:if test="${ sessionScope.cucu.phone == null }">
                                        <p><a href="logincustomer?section=editInformations">Register a phone number</a></p>
                                    </c:if>
                                    <c:if test="${ sessionScope.cucu.phone != null }">
                                        <p>${ sessionScope.cucu.phone }</p>
                                    </c:if>
                                    <%-- /PHONE NUMBER --%>

                                    <%-- DATE SIGNIN --%>
                                    <label class="titleAccount" for="custoDateSignin">Member since:</label>
                                    <p>${ sessionScope.cucu.dateSignIn }</p>
                                    <%-- /DATE SIGNIN --%>

                                </div>
                            </div>
                        </section>
                        <%-- /ACCOUNT INFORMATIONS SECTION --%>

                        <%-- ADDRESS BOOK SECTION --%>
                        <h4 class="subcategory">ADDRESS BOOK</h4>
                        <hr>
                        <section>
                            <div class="row">
                                <%-- INVOICE ADDRESS --%>
                                <div class="col">
                                    <ul>
                                        <div class="btn-group show">
                                            <button type="button" class="btn btn-dark dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                Invoice Adresses:
                                            </button>
                                            <div class="dropdown-menu">
                                                <c:forEach var="item" items="${ sessionScope.cucuAddInv }">
                                                    <p class="dropdown-item">${ item.labelAddress }</p>
                                                </c:forEach>
                                            </div>
                                        </div>

                                        <c:forEach begin="0" end="0" var="item" items="${ sessionScope.cucuAddInv }">
                                            <li>${ sessionScope.cucu.socialTitleLabel } ${ item.firstname } ${ item.lastname }</li>
                                            <li>${ item.labelAddress }</li>   
                                            <li>${ item.companyAddress }</li>     
                                            <li>${ item.street }</li>   
                                            <li>${ item.street2 }</li>   
                                            <li>${ item.zip }</li>   
                                            <li>${ item.city }</li>   
                                            <li>${ item.country }</li>   
                                            </c:forEach>
                                    </ul>
                                </div>
                                <%-- /INVOICE ADDRESS --%>

                                <%-- DELIVERY ADDRESS --%>
                                <div class="col">
                                    <ul>
                                        <div class="btn-group show">
                                            <button type="button" class="btn btn-dark dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                Delivery addresses:
                                            </button>
                                            <div class="dropdown-menu">
                                                <c:forEach var="item" items="${ sessionScope.cucuAddDel }">
                                                    <p class="dropdown-item">${ item.labelAddress }</p>
                                                </c:forEach>
                                            </div>
                                        </div>

                                        <c:forEach begin="0" end="0" var="item" items="${ sessionScope.cucuAddDel }">
                                            <li>${ sessionScope.cucu.socialTitleLabel } ${ item.firstname } ${ item.lastname }</li>
                                            <li>${ item.labelAddress }</li>   
                                            <li>${ item.companyAddress }</li>     
                                            <li>${ item.street }</li>   
                                            <li>${ item.street2 }</li>   
                                            <li>${ item.zip }</li>   
                                            <li>${ item.city }</li>   
                                            <li>${ item.country }</li>   
                                            </c:forEach>
                                    </ul>
                                </div>
                                <%-- /DELIVERY ADDRESS --%>
                            </div>
                        </section>
                        <%-- /ADDRESS BOOK SECTION --%>

                        <%-- ORDERS SECTION --%>
                        <h4 class="subcategory">LAST ORDER</h4>
                        <hr>
                        <section>
                            <div class="row">
                                <div class="col">
                                    <table>
                                        <thead class="titleAccount">
                                            <tr>
                                                <th scope="col">Date</th>
                                                <th scope="col">Order number</th>
                                                <th scope="col">Total</th>
                                                <th scope="col">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <c:if test="${ sessionScope.lastOrder.orderDate != null || !empty sessionScope.lastOrder.orderDate }">
                                                    <td>${ sessionScope.lastOrder.orderDate }</td>
                                                    <td>${ sessionScope.lastOrder.orderNumber }</td>
                                                    <c:if test="${ sessionScope.lastOrder.orderNumber != null }">
                                                        <td>${ sessionScope.lastOrder.orderTotal }€</td>
                                                    </c:if>
                                                    <c:if test="${ sessionScope.lastOrder.orderNumber == null }">
                                                        <td></td>
                                                    </c:if>
                                                    <td><a href="logincustomer?section=showOrder">Details</a></td>
                                                </c:if>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </section>
                        <%-- /ORDERS SECTION --%>

                        <%-- COMMENTS SECTION --%>
                        <h4 class="subcategory">LAST COMMENT</h4>
                        <hr>
                        <section>
                            <div class="row">
                                <div class="col">
                                    <table>
                                        <thead class="titleAccount">
                                            <tr>
                                                <th scope="col">Date</th>
                                                <th scope="col">Book title</th>
                                                <th scope="col">Comment</th>
                                                <th scope="col">Note</th>
                                                <th scope="col">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <c:if test="${ sessionScope.lastComment.orderDate != null || !empty sessionScope.lastComment.orderDate }">
                                                    <td>${ sessionScope.lastComment.orderDate }</td>
                                                    <td>${ sessionScope.lastComment.title }</td>
                                                    <c:if test="${ sessionScope.lastComment.commentText == NULL }">
                                                        <td>Any comment yet</td>
                                                    </c:if>
                                                    <c:if test="${ sessionScope.lastComment.commentText != NULL }">
                                                        <td>${ sessionScope.lastComment.commentText }</td>
                                                    </c:if>

                                                    <td><c:set var="score" value="${ sessionScope.lastComment.commentNote }"/>
                                                        <c:if test="${score == NULL || score == 0}">
                                                            <div>
                                                                <span>☆</span><span>☆</span><span>☆</span><span>☆</span><span>☆</span>
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${score == 1}">
                                                            <div>
                                                                <span>★</span><span>☆</span><span>☆</span><span>☆</span><span>☆</span> X ratings
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${score == 2}">
                                                            <div>
                                                                <span>★</span><span>★</span><span>☆</span><span>☆</span><span>☆</span> X ratings
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${score == 3}">
                                                            <div>
                                                                <span>★</span><span>★</span><span>★</span><span>☆</span><span>☆</span> X ratings
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${score == 4}">
                                                            <div>
                                                                <span>★</span><span>★</span><span>★</span><span>★</span><span>☆</span> X ratings
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${score == 5}">
                                                            <div>
                                                                <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span> X ratings
                                                            </div>
                                                        </c:if>
                                                    </td>
                                                    <td><a href="logincustomer?section=showComments">Details</a></td>
                                                </c:if>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </section>
                        <%-- /COMMENTS SECTION --%>
                    </div>
                    <div class="col-md-3"></div>
                    <%-- /Main container --%>


                </div>
            </div>
        </div>
        <%-- /Main --%>


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
