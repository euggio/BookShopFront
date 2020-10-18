<%-- 
    Document   : signIn
    Created on : 28 sept. 2020, 21:33:38
    Author     : euggio
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Log in</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="ressources/css/bootstrap.min.css" >
        <link rel="stylesheet" href="ressources/css/styles.css" >
        <script type="text/javascript" src="ressources/js/jquery-3.5.1.js"></script>
        <script type="text/javascript" src="ressources/js/popper.min.js"></script>
        <script type="text/javascript" src="ressources/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="ressources/css/signIn.css" >
    </head>
    <body>
        <%-- Header --%>
        <jsp:include page="/header.jsp" flush="false" />
        <section>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-3"></div> 
                    <div class="col-md-3">

                        <%-- Sign in --%>
                        <div class="card card-hover-shadow h-100">
                            <div class="card-body">
                                <div class="card-header">
                                    <div class="card-header-title">
                                        <h5>You have already an account!</h5>
                                    </div>
                                </div>
                                <form method="post" class="needs-validation" action="logincustomer">
                                    <%-- EMAIL ADDRESS --%>
                                    <p class="text-danger">${ sessionScope.wrongLogin } </p>
                                    <div class="form-group">
                                        <label for="logMail">Email address</label>
                                        <input type="email" class="form-control" name="logMail" id="logMail" value="${ logMail }" aria-describedby="emailHelp">                                        
                                    </div>

                                    <%-- PASSWORD --%>
                                    <div class="form-group">
                                        <label for="logPassword">Password</label>
                                        <div class="input-group">
                                            <input type="password" class="form-control" name="logPassword" id="logPassword">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text" id="btnGroupAddon01" >secret</div>
                                            </div>                                      
                                        </div>
                                        <small><a href="#">You forgot your password?</a></small>
                                    </div>

                                    <%-- CHECKBOX REMEMBER ME --%>
                                    <div class="form-group form-check text-center">
                                        <input type="checkbox" class="form-check-input" id="rememberMeCheckbox">
                                        <label class="form-check-label" for="rememberMeCheckbox">Remember me</label>
                                    </div>

                                    <%-- SIGN IN BUTTON --%>
                                    <button type="submit" class="btn btn-dark">Sign In</button>


                                </form>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <%-- Create account --%>
                        <div class="card card-hover-shadow h-100">
                            <div class="card-body">
                                <div class="card-header">
                                    <div class="card-header-title">
                                        <h5>New customer? Welcome!</h5>
                                    </div>
                                </div>

                                <form method="post" class="needs-validation" action="registercustomer">
                                    <p class="text-danger">${ sessionScope.wrongLogin } </p>
                                    <div class="form-group">
                                        <label for="inputMail">Email address</label>
                                        <input type="email" class="form-control" name="inputMail" id="inputMail" value="${ inputMail }" aria-describedby="emailHelp">
                                        <small>Your email address will be your identifiant.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputPassword">Password</label>
                                        <div class="input-group">
                                            <input type="password" class="form-control" name="inputPassword" id="inputPassword">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text" id="btnGroupAddon02" >secret</div>
                                            </div>                                      
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputConfPassword">Confirm your password</label>
                                        <div class="input-group">
                                            <input type="password" class="form-control" name="inputConfPassword" id="inputConfPassword">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text" id="btnGroupAddon03" >secret</div>
                                            </div>                                      
                                        </div>
                                    </div>
                                    <input type="hidden" name="section" value="create"/>
                                    <button type="submit" class="btn btn-dark">Subscribe</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3"</div>
                </div>
            </div>
        </div>

    </section>
    <%-- Footer --%>
    <jsp:include page="/footer.jsp" flush="false" />
</body>
</html>
