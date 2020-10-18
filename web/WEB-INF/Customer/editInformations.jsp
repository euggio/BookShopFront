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
                <li class="breadcrumb-item active" aria-current="page">Edit my informations</li>
            </ol>
        </nav>
        <%-- /Navbar --%>


        <%-- Slide --%>
        <div class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="ressources/pics/register_slide7.jpg" alt="register picture">
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
                            <a class="outdoors text-dark text-decoration-none myInformations" href="">My informations</a>
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
                        <h4 class="mb-3">ACCOUNT INFORMATION</h4>
                        <form method="post" class="needs-validation" action="registercustomer">
                            <div class="row">
                                <%-- SOCIAL TITLE --%> 
                                <div class="col-md-6 mb-3">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Social</span>
                                        </div>
                                        <select type="text" class="form-control" name="editSocial" id="editSocial">
                                            <c:if test="${ empty sessionScope.cucu.socialTitleLabel }">
                                                <option value="">Choose...</option>
                                                <option value="1">Madam</option>
                                                <option value="2">Mister</option>
                                            </c:if>
                                            <c:set var="item" value="${ sessionScope.cucu.socialTitleLabel }"/>
                                            <c:if test="${ sessionScope.cucu.socialTitleId == 1 }">
                                                <option selected="" value="1">Madam</option>
                                                <option value="2">Mister</option>
                                            </c:if>
                                            <c:if test="${ sessionScope.cucu.socialTitleId == 2 }">
                                                <option selected="" value="2">Mister</option>
                                                <option value="1">Madam</option>
                                            </c:if>
                                        </select>
                                    </div>
                                </div>
                                <%-- /SOCIAL TITLE --%> 

                                <%-- SPACE --%>
                                <div class="col-md-6 mb-3"></div>
                                <%-- /SPACE --%> 

                                <%-- FIRST NAME --%> 
                                <div class="col-md-6 mb-3">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">First name</span>
                                        </div>
                                        <input type="text" class="form-control" name="editFirstname" id="editFirstname" value="${ sessionScope.cucu.firstname }" required>
                                        <div class="invalid-feedback">
                                            Valid first name is required.
                                        </div>
                                    </div>
                                </div>
                                <%-- /FIRST NAME --%> 

                                <%-- LAST NAME --%> 
                                <div class="col-md-6 mb-3">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Last name</span>
                                        </div>
                                        <input type="text" class="form-control" name="editLastname" id="editLastname" value="${ sessionScope.cucu.lastname }" required>
                                        <div class="invalid-feedback">
                                            Valid last name is required.
                                        </div>
                                    </div>
                                </div>
                                <%-- /LAST NAME --%> 

                                <%-- PASSWORD --%> 
                                <div class="col-md-6 mb-3">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Password</span>
                                        </div>
                                        <input type="password" class="form-control" name="editPassword" id="editPassword" value="${ sessionScope.cucu.password }">
                                    </div>
                                </div>
                                <%-- /PASSWORD --%> 

                                <%-- PASSWORD Bis --%> 
                                <div class="col-md-6 mb-3">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Confirm password</span>
                                        </div>
                                        <input type="password" class="form-control" name="editPassword" id="editPassword" value="${ sessionScope.cucu.password }">
                                    </div>
                                </div>
                                <%-- /PASSWORD Bis --%> 

                                <%-- EMAIL --%> 
                                <div class="col-md-6 mb-3">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Email</span>
                                        </div>
                                        <input type="text" class="form-control" name="editMail" id="editMail" value="${ sessionScope.cucu.mail }">
                                    </div>
                                </div>
                                <%-- /EMAIL --%> 

                                <%-- BIRTHDATE --%> 
                                <div class="col-md-6 mb-3">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Birthdate</span>
                                        </div>
                                        <input type="text" class="form-control" name="editBirthdate" id="editBirthdate" value="${ sessionScope.cucu.birthdate }">
                                    </div>
                                </div>
                                <%-- /BIRTHDATE --%> 

                                <%-- PHONE --%> 
                                <div class="col-md-6 mb-3">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">Phone</span>
                                        </div>
                                        <input type="text" class="form-control" name="editPhone" id="editPhone" value="${ sessionScope.cucu.phone }">
                                        <div class="invalid-feedback">
                                            Password required.
                                        </div>
                                    </div>
                                </div>
                                <%-- /PHONE --%> 

                                <%-- SPACE --%> 
                                <div class="col-md-6 mb-3"></div>
                                <%-- /SPACE --%> 

                                <%-- VALIDATE --%> 
                                <div class="col-md-6 mb-3">
                                    <form method="post" class="needs-validation" action="registercustomer">
                                        <input type="hidden" name="section" value="editInformations"/>
                                        <button type="submit" class="btn btn-dark">Save modifications</button>
                                    </form>
                                </div>
                                <%-- /VALIDATE --%> 

                            </div>
                            <%-- /ACCOUNT INFORMATIONS SECTION --%>


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
