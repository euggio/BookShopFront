<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
    <h5 class="my-0 mr-md-auto font-weight-normal"><a class="p-2 text-dark" href="controller">Book Shop</a></h5>
    <nav class="my-2 my-md-0 mr-md-3">
        <a class="p-2 text-dark" href="ProductController?section=allProduct">Products</a>
        <a class="p-2 text-dark" href="#">Account</a>

        <!-- Cart button - start -->
        <c:forEach var="i" items="${sessionScope.panierSession}">
            <c:set var="qtyArticle" value="${qtyArticle = qtyArticle + i.quantity}" />
        </c:forEach>
        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true">Cart <span class="badge badge-light">${qtyArticle}</span></button>
        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
            <c:if test="${empty sessionScope.panierSession}">
                Panier vide !   
            </c:if>
                <c:if test="${!empty sessionScope.panierSession}">
            <table class="table table-hover">
                <tbody>
                    
                        <c:forEach var="i" items="${sessionScope.panierSession}">
                            <c:set var="totalArticle" value="${i.quantity * i.price}" />
                            <c:set var="totalPanier" value="${totalPanier = totalPanier + totalArticle}" />  
                            <tr>
                                <td><a href="ProductController?section=viewProduct&view=${i.id}"><img src="ressources/pics/thumbnail_cart.jpg"/></a></td>
                                <td style="vertical-align: inherit"><a href="ProductController?section=viewProduct&view=${i.isbn}" class="text-dark"><span> ${i.title} </span></a></td>
                                <td style="vertical-align: inherit">
                                    <div class="def-number-input number-input safari_only mb-0 w-100">
                                        <a href="CartController?section=cart&dec=${i.id}" class="text-secondary">
                                            <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-dash-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                <path fill-rule="evenodd" d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                                                <path fill-rule="evenodd" d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
                                            </svg>
                                        </a>
                                        <span>${i.quantity}</span>
                                        <a href="CartController?section=cart&inc=${i.id}" class="text-secondary">
                                            <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-plus-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                <path fill-rule="evenodd" d="M14 1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                                                <path fill-rule="evenodd" d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
                                            </svg>
                                        </a>
                                    </div>
                                </td>
                                <td style="vertical-align: inherit" class="text-right text-dark"><span> ${totalArticle} € </span></td>
                                <td style="vertical-align: inherit">
                                    <a href="CartController?section=cart&del=${i.id}" class="text-secondary"><svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                            <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                            <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                                        </svg>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td colspan="5" class="text-center" style="vertical-align: inherit"><strong>${totalPanier} €</strong></td>
                        </tr>
                        <tr>
                            <td colspan="2" class="text-center" style="vertical-align: inherit"><a href="CartController?section=cart&clear" class="text-center text-secondary">Clear the basket</a></td>
                            <td colspan="3" class="text-center" style="vertical-align: inherit"><a class="btn btn-secondary margin10px" href="CartController?section=viewCart">View Cart</a></td>
                        </tr>
                    </tbody>
                </table> 
            </c:if>
        </div>
        <!-- Cart button - end -->

    </nav>
        <c:if test="${empty sessionScope.ATT_CUSTOMER }">
            <a class="btn btn-outline-dark" href="logincontroller">${ sessionScope.Log }</a>
        </c:if>
        <c:if test="${!empty sessionScope.ATT_CUSTOMER }">
            <a class="btn btn-outline-dark" href="ProductController?section=allProduct">${ sessionScope.Log }</a>
        </c:if>
            
    
</div>
