<%-- 
    Document   : afficherProducts
    Created on : 2 oct. 2020, 00:40:54
    Author     : agrev
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Afficher Products</title>
    </head>
    <body>
        <h1>Afficher products</h1>
        <p>Liste des clients : </p><br />
        <ul><c:forEach var="item" items="${ customer }">
            <li><c:out value="${ item.lastname }" /></li>
            <li><c:out value="${ item.firstname }" /></li>
            <li><c:out value="${ item.mail }" /></li>
            <li><c:out value="${ item.phone }" /></li>
            <li><c:out value="${ item.birthdate }" /></li>
            <li><c:out value="${ item.password }" /></li>
            <li><c:out value="${ item.dateSignIn }" /></li>
            <li><c:out value="${ item.labelAddress }" /></li>
            <li><c:out value="${ item.companyAddress }" /></li>
            <li><c:out value="${ item.address }" /></li>
            <li><c:out value="${ item.address2 }" /></li>
            <li><c:out value="${ item.zip }" /></li>
            <li><c:out value="${ item.city }" /></li>
            <li><c:out value="${ item.country }" /></li>
            <li><c:out value="${ item.SocialTitleLabel }" /></li>
            </c:forEach></ul>
        
    </body>
</html>
