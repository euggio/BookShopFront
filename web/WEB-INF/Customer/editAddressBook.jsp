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
                            <a class="outdoors text-dark text-decoration-none myAddressBook" href="logincustomer?section=showAddressBook">My address book</a>
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
                        <h4>EDIT ADDRESS</h4>
                        <hr>
                        <section>
                            <div class="row">

                                <%-- ZONE 1S --%>
                                <div class="col">
                                    <form method="post" action="logincustomer" > 
                                        <%-- ADDRESS LABEL --%>
                                        <div class="mb-2">
                                            <label class="titleAccount" for="editAddLabel">Label:</label>
                                        </div>
                                        <div class="mb-4">
                                            <input type="text" class="form-control" name="editAddLabel" id="editAddLabel" value="${ customer.labelAddress }">
                                        </div>
                                        <%-- /ADDRESS LABEL --%>

                                        <%-- COMPANY --%>
                                        <div class="mb-2">
                                            <label class="titleAccount" for="editAddCompany">Company:</label>
                                        </div>
                                        <div class="mb-4">
                                            <input type="text" class="form-control" name="editAddCompany" id="editAddCompany" value="${ customer.companyAddress }">
                                        </div>
                                        <%-- /COMPANY --%>

                                        <%-- STREET --%>
                                        <div class="mb-2">
                                            <label class="titleAccount" for="editAddStreet">Address:</label>
                                        </div>
                                        <div class="mb-4">
                                            <input type="text" class="form-control" name="editAddStreet" id="editAddStreet" value="${ customer.address }">
                                        </div>
                                        <%-- /STREET --%>

                                        <%-- STREET2 --%>
                                        <div class="mb-2">
                                            <label class="titleAccount" for="editAddStreet2">Address 2:</label>
                                        </div>
                                        <div class="mb-4">
                                            <input type="text" class="form-control" name="editAddStreet2" id="editAddStreet2" value="${ customer.address2 }">
                                        </div>
                                        <%-- /STREET2 --%>

                                        <%-- ZIP --%>
                                        <div class="mb-2">
                                            <label class="titleAccount" for="editAddZip">Zip code:</label>
                                        </div>
                                        <div class="mb-4">
                                            <input type="text" class="form-control" name="editAddZip" id="editAddZip" value="${ customer.zip }">
                                        </div>
                                        <%-- /ZIP --%>

                                        <%-- CITY --%>
                                        <div class="mb-2">
                                            <label class="titleAccount" for="editAddCity">City:</label>
                                        </div>
                                        <div class="mb-4">
                                            <input type="text" class="form-control" name="editAddCity" id="editAddCity" value="${ customer.city }">
                                        </div>
                                        <%-- /CITY --%>

                                        <%-- COUNTRY --%>
                                        <div class="mb-2">
                                            <label class="titleAccount" for="editAddCountry">Country:</label>
                                        </div>
                                        <div class="mb-4">
                                            <input type="text" class="form-control" name="editAddCountry" id="editAddCountry" value="${ customer.country }">
                                        </div>
                                        <%-- /COUNTRY --%>
                                    </form> 
                                </div>
                                <%-- /ZONE 1 --%>

                                <%-- ZONE 2 --%>
                                <div class="col">
                                    <form method="post" action="logincustomer" > 
                                        <%-- SOCIAL TITLE --%>
                                        <div class="mb-2">
                                            <label for="editSocial" class="col-form-label titleAccount">Social title: </label>
                                        </div>
                                        <div class="mb-4">
                                            <select type="text" class="form-control" name="editSocial" id="editSocial">
                                                <c:set var="item" value="${ customer.socialTitleLabel }"/>
                                                <c:if test="${ customer.socialTitleId == 1 }">
                                                    <option selected="" value="1">Madam</option>
                                                    <option value="2">Mister</option>
                                                </c:if>
                                                <c:if test="${ customer.socialTitleId == 2 }">
                                                    <option selected="" value="2">Mister</option>
                                                    <option value="1">Madam</option>
                                                </c:if>
                                            </select>
                                        </div>
                                        <%-- /SOCIAL TITLE --%>

                                        <%-- LAST NAME --%>
                                        <div class="mb-2">
                                            <label class="titleAccount" for="editAddLastname">Last name:</label>
                                        </div>
                                        <div class="mb-4">
                                            <input type="text" class="form-control" name="editAddLastname" id="editAddLastname" value="${ customer.lastname }">
                                        </div>
                                        <%-- /LAST NAME --%>

                                        <%-- FIRST NAME --%>
                                        <div class="mb-2">
                                            <label class="titleAccount" for="editAddFirstname">First name:</label>
                                        </div>
                                        <div class="mb-4">
                                            <input type="text" class="form-control" name="editAddFirstname" id="editAddFirstname" value="${ customer.firstname }">
                                        </div>
                                        <%-- /FIRST NAME --%>
                                        <input type="hidden" name="section" value="editAddress"/>
                                        <button type="submit" class="btn btn-secondary">Edit address</button>
                                    </form>
                                </div>
                                <%-- /ZONE 2 --%>

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
