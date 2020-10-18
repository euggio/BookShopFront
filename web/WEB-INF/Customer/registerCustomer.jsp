<%-- 
    Document   : register
    Created on : 29 sept. 2020, 01:22:24
    Author     : euggio
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Register</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="ressources/css/bootstrap.min.css" >
        <link rel="stylesheet" href="ressources/css/styles.css" >
        <script type="text/javascript" src="ressources/js/jquery-3.5.1.js"></script>
        <script type="text/javascript" src="ressources/js/popper.min.js"></script>
        <script type="text/javascript" src="ressources/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="ressources/css/register.css" >
    </head>
    <body>
        <%-- Header --%>
        <jsp:include page="/header.jsp" flush="false" />

        <%-- Navbar --%>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="controller">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Register informations</li>
            </ol>
        </nav>
        <%-- /Navbar --%>
        
        <%-- Slide --%>
        <div class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="ressources/pics/register_slide5.jpg" alt="register picture">
                </div>
            </div>
        </div>
        <%-- /Slide --%>

        <%-- Register form  --%>
        <h1 class="h3 mb-3 font-weight-normal">Please register your informations</h1>
        <section>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-4"></div> 
                    <div class="col-md-4">

                        <form method="post" class="needs-validation" action="registercustomer">
                            <div class="form-group row">
                                <div class="col-md-3 mb-2">
                                    <label for="inputFormMail" >Email address</label>
                                </div>
                                <div class="col-md-9 mb-2">
                                    <input type="text" class="form-control" name="inputFormMail" id="inputFormMail" value="${ inputMail }" readonly>
                                </div>
                            </div>

                            <div class="hiddenfield" >
                                <div class="col-md-3 mb-2">
                                    <label for="inputFormPassword" class="col-form-label">Password</label>
                                </div>
                                <div class="col-md-9 mb-2">
                                    <input type="text" class="form-control" name="inputFormPassword" id="inputFormPassword" readonly>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-md-3 mb-2">
                                    <label for="inputFormSocial" class="col-form-label">Social title<span class="text-needed">*</span></label>
                                </div>
                                <div class="col-md-9 mb-2">
                                    <select type="text" class="form-control" name="inputFormSocial" id="inputFormSocial" required>
                                        <option value="">Choose...</option>
                                        <option value="1">Madam</option>
                                        <option value="2">Mister</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-md-3 mb-2">
                                    <label for="inputFormLastName" class="col-form-label">Last name <span class="text-needed">*</span></label>
                                </div>
                                <div class="col-md-9 mb-2">
                                    <input type="text" class="form-control" name="inputFormLastName" id="inputFormLastName" required>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-md-3 mb-2">
                                    <label for="inputFormFirstName" class="col-form-label">First name <span class="text-needed">*</span></label>
                                </div>
                                <div class="col-md-9 mb-2">
                                    <input type="text" class="form-control" name="inputFormFirstName" id="inputFormFirstName" required>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-md-3 mb-2">
                                    <label for="inputFormBirthdate" class="col-form-label">Birthdate</label>
                                </div>
                                <div class="col-md-9 mb-2">
                                    <input type="text" class="form-control" name="inputFormBirthdate" id="inputFormBirthdate" placeholder="2015/01/01">
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-md-3 mb-2">
                                    <label for="inputFormPhone" class="col-form-label">Phone number</label>
                                </div>
                                <div class="col-md-9 mb-2">
                                    <input type="text" class="form-control" name="inputFormPhone" id="inputFormPhone">
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-md-3 mb-2">
                                    <label for="inputFormLabel" class="col-form-label">Label </label>
                                </div>
                                <div class="col-md-9 mb-2">
                                    <input type="text" class="form-control" name="inputFormLabel" id="inputFormLabel">
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-md-3 mb-2">
                                    <label for="inputFormCompany" class="col-form-label">Company </label>
                                </div>
                                <div class="col-md-9 mb-2">
                                    <input type="text" class="form-control" name="inputFormCompany" id="inputFormCompany">
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-md-3 mb-2">
                                    <label for="inputFormAddress" class="col-form-label">Address </label>
                                </div>
                                <div class="col-md-9 mb-2">
                                    <input type="text" class="form-control" name="inputFormAddress" id="inputFormAddress">
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-md-3 mb-2">
                                    <label for="inputFormAddress2" class="col-form-label">Address 2 </label>
                                </div>
                                <div class="col-md-9 mb-2">
                                    <input type="text" class="form-control" name="inputFormAddress2" id="inputFormAddress2">
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-md-3 mb-2">
                                    <label for="inputFormZip" class="col-form-label">Zip code <span class="text-needed">*</span></label>
                                </div>
                                <div class="col-md-9 mb-2">
                                    <input type="text" class="form-control" name="inputFormZip" id="inputFormZip" required>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-md-3 mb-2">
                                    <label for="inputFormCity" class="col-form-label">City <span class="text-needed">*</span></label>
                                </div>
                                <div class="col-md-9 mb-2">
                                    <input type="text" class="form-control" name="inputFormCity" id="inputFormCity" required>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-md-3 mb-2">
                                    <label for="inputFormCountry" class="col-form-label">Country <span class="text-needed">*</span></label>
                                </div>
                                <div class="col-md-9 mb-2">
                                    <select type="text" class="form-control" name="inputFormCountry" id="inputFormCountry" required>
                                        <option value="">Choose...</option>
                                        <c:forEach var="item" items="${ listCountry }">
                                            <option><c:out value="${ item }" /></option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-md-3 mb-2"></div>
                                <div class="col-md-9 mb-2">

                                    <input type="hidden" name="section" value="register"/>
                                    <button type="submit" name="validate" class="btn btn-secondary">validate</button>
                                    <a href="controller" name="skip" class="btn btn-secondary">skip</a>

                                </div>
                            </div>
                        </form>

                    </div>
                    <div class="col-md-4"></div>
                </div>                
            </div>                

        </section>


        <%-- Footer --%>
        <jsp:include page="/footer.jsp" flush="false" />
</html>
