<%-- 
    Document   : showCustomer
    Created on : 3 oct. 2020, 13:02:16
    Author     : agrev
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Log in</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" >
        <link rel="stylesheet" href="ressources/css/styles.css" >
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="ressources/css/signIn.css" >
    </head>
    <body>
        <%-- Header --%>
        <jsp:include page="/header.jsp" flush="false" />
        <h1>Welcome ${customer.mail}!</h1>
        <p><c:out value="${ customer.customerId}" /></p>
        <p><c:out value="${ customer.lastname}" /></p>
        <p><c:out value="${ customer.firstname}" /></p>
        <p><c:out value="${ customer.mail}" /></p>
        <p><c:out value="${ customer.phone}" /></p>
        <p><c:out value="${ customer.birthdate}" /></p>
        <p><c:out value="${ customer.password}" /></p>
        <p><c:out value="${ customer.dateSignIn}" /></p>
        <p><c:out value="${ customer.labelAddress}" /></p>
        <p><c:out value="${ customer.companyAddress}" /></p>
        <p><c:out value="${ customer.address}" /></p>
        <p><c:out value="${ customer.address2}" /></p>
        <p><c:out value="${ customer.zip}" /></p>
        <p><c:out value="${ customer.city}" /></p>
        <p><c:out value="${ customer.country}" /></p>
        <p><c:out value="${ customer.socialTitleLabel}" /></p>
    </body>
</html>
