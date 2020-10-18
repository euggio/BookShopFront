<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Welcome to the Book shop</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="ressources/css/bootstrap.min.css" >
        <link rel="stylesheet" href="ressources/css/styles.css" >
        <link rel="stylesheet" href="ressources/css/product.css" >
        <script type="text/javascript" src="ressources/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="ressources/css/album.css" >
    </head>
    <body>
        <jsp:include page="/header.jsp" flush="false" />
        <c:forEach var="i" items="${BOOK}">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="controller">Home</a></li>
                    <li class="breadcrumb-item"><a href="ProductController?section=allProduct">Products</a></li>
                    <li class="breadcrumb-item active" aria-current="page">${i.title}</li>
                </ol>
            </nav>

            <!--Main Navigation-->
            <!--Displays title, subtitle, author name and comment review stars-->
            <header>
                <div class="jumbotron color-grey-light mt-70">
                    <div class="d-flex align-items-center h-100">
                        <div class="container text-center py-5">
                            <p>
                                <c:set var="sub" value="${i.subtitle}"/>
                                <c:if test="${sub == NULL}"><h3 class="mb-0">${i.title}</h3><p>by author: ${i.authorFirstName} ${i.authorLastName}</p></c:if>
                            <c:if test="${sub != NULL}"><h3 class="mb-0">${i.title} — ${i.subtitle}</h3><p>by author: ${i.authorFirstName} ${i.authorLastName}</p></c:if>
                            <p><c:set var="score" value="${i.commentScore}"/>
                                <c:if test="${score == NULL}">
                                <div>
                                    <span>☆</span><span>☆</span><span>☆</span><span>☆</span><span>☆</span> No rating yet. Be the first to rate this book
                                </div>
                            </c:if>
                            <c:if test="${score == 1}">
                                <div>
                                    <span class="checked">★</span><span>☆</span><span>☆</span><span>☆</span><span>☆</span> 1 rating
                                </div>
                            </c:if>
                            <c:if test="${score == 2}">
                                <div>
                                    <span class="checked">★</span><span class="checked">★</span><span>☆</span><span>☆</span><span>☆</span> 1 rating
                                </div>
                            </c:if>
                            <c:if test="${score == 3}">
                                <div>
                                    <span class="checked">★</span><span class="checked">★</span><span class="checked">★</span><span>☆</span><span>☆</span> 1 ratings
                                </div>
                            </c:if>
                            <c:if test="${score == 4}">
                                <div>
                                    <span class="checked">★</span><span class="checked">★</span><span class="checked">★</span><span class="checked">★</span><span>☆</span> 1 ratings
                                </div>
                            </c:if>
                            <c:if test="${score == 5}">
                                <div>
                                    <span class="checked">★</span><span class="checked">★</span><span class="checked">★</span><span class="checked">★</span><span class="checked">★</span> 1 ratings
                                </div>
                            </c:if>
                            </p>
                        </div>
                    </div>
                </div>

            </header>
            <!--Main Navigation-->

            <!--Main layout-->
            <main>
                <div class="container">

                    <!--Section: Block Content-->
                    <section class="mb-5">

                        <div class="row">
                            <div class="col-md-6 mb-4 mb-md-0">

                                <div id="mdb-lightbox-ui"></div>

                                <div class="mdb-lightbox">

                                    <div class="row product-gallery mx-1">

                                        <div class="col-12 mb-0">
                                            <figure class="view overlay rounded z-depth-1 main-img" style="max-height: 450px;">
                                                <a href=""
                                                   data-size="7x8">
                                                    <img src="${i.cover}"
                                                         class="img-fluid z-depth-1" style="margin-top: -10px;">
                                                </a>
                                            </figure>

                                        </div>

                                    </div>

                                </div>

                            </div>
                            <div class="col-md-6">

                                <%--Book information like ISBN, author, category, publisher, and delivery country--%>
                                <h5>${i.title}</h5>
                                <p class="mb-2 text-muted text-uppercase small">${i.subtitle}</p>
                                <p><span class="mr-1"><strong>€${i.price}</strong></span></p>
                                <p class="pt-1">${i.summary}</p>
                                <div class="table-responsive">
                                    <table class="table table-sm table-borderless mb-0">
                                        <tbody>
                                            <tr>
                                                <th class="pl-0 w-25" scope="row"><strong>ISBN</strong></th>
                                                <td>${i.isbn}</td>
                                            </tr>
                                            <tr>
                                                <th class="pl-0 w-25" scope="row"><strong>Author</strong></th>
                                                <td>${i.authorFirstName} ${i.authorLastName}</td>
                                            </tr>
                                            <tr>
                                                <th class="pl-0 w-25" scope="row"><strong>Category</strong></th>
                                                <td>${i.subtheme}</td>
                                            </tr>
                                            <tr>
                                                <th class="pl-0 w-25" scope="row"><strong>Publisher</strong></th>
                                                <td>${i.publisherName}</td>
                                            </tr>
                                            <tr>
                                                <th class="pl-0 w-25" scope="row"><strong>Delivery</strong></th>
                                                <td>USA, Europe</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <hr>
                                <div class="table-responsive mb-2">
                                    <table class="table table-sm table-borderless">
                                        <tbody>
                                            <tr>
                                                <td class="pl-0">
                                                    <a href="CartController?section=manageCart&add=${i.id}"><button type="button" class="btn btn-primary btn-md mr-1 mb-2">Add to cart</button></a>
                                                </td>
                                                <td>
                                                    <div class="mt-1">
                                                        <div class="form-check form-check-inline pl-0">
                                                            <input type="radio" class="form-check-input" id="small" name="materialExampleRadios" checked>
                                                            <label class="form-check-label small text-uppercase card-link-secondary"
                                                                   for="small">Hardcover</label>
                                                        </div>
                                                        <div class="form-check form-check-inline pl-0">
                                                            <input type="radio" class="form-check-input" id="medium" name="materialExampleRadios">
                                                            <label class="form-check-label small text-uppercase card-link-secondary"
                                                                   for="medium">Paperback</label>
                                                        </div>
                                                        <div class="form-check form-check-inline pl-0">
                                                            <input type="radio" class="form-check-input" id="large" name="materialExampleRadios">
                                                            <label class="form-check-label small text-uppercase card-link-secondary"
                                                                   for="large">Audiobook</label>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                    </section>
                    <!--Section: Block Content-->

                    <!-- Classic tabs -->
                    <!-- Description, additional information, and reviews -->
                    <div class="classic-tabs">

                        <ul class="nav tabs-primary nav-justified" id="advancedTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active show" id="description-tab" data-toggle="tab" href="#description" role="tab"
                                   aria-controls="description" aria-selected="true">Description</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="info-tab" data-toggle="tab" href="#info" role="tab" aria-controls="info"
                                   aria-selected="false">Information</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="reviews-tab" data-toggle="tab" href="#reviews" role="tab" aria-controls="reviews"
                                   aria-selected="false">Reviews (1)</a>
                            </li>
                        </ul>
                        <div class="tab-content" id="advancedTabContent">
                            <div class="tab-pane fade show active" id="description" role="tabpanel" aria-labelledby="description-tab">
                                <h5>Book Description</h5>
                                <c:set var="sub" value="${i.subtitle}"/>
                                <c:if test="${sub == NULL}"><p class="small text-muted text-uppercase mb-2">${i.title}</p></c:if>
                                <c:if test="${sub != NULL}"><p class="small text-muted text-uppercase mb-2">${i.title} — ${i.subtitle}</p></c:if>
                                    <ul class="rating">
                                        <li>
                                            <i class="fas fa-star fa-sm text-primary"></i>
                                        </li>
                                        <li>
                                            <i class="fas fa-star fa-sm text-primary"></i>
                                        </li>
                                        <li>
                                            <i class="fas fa-star fa-sm text-primary"></i>
                                        </li>
                                        <li>
                                            <i class="fas fa-star fa-sm text-primary"></i>
                                        </li>
                                        <li>
                                            <i class="far fa-star fa-sm text-primary"></i>
                                        </li>
                                    </ul>
                                    <h6>€${i.price}</h6>
                                <p class="pt-1">${i.summary}</p>
                            </div>
                            <div class="tab-pane fade" id="info" role="tabpanel" aria-labelledby="info-tab">
                                <h5>Additional Information</h5>
                                <c:set var="desc" value="${i.authorDesc}"/>
                                <c:set var="birth" value="${i.authorBirthdate}"/>
                                <c:set var="death" value="${i.authorDeathdate}"/>
                                <c:if test="${(death == NULL) and (desc == NULL)}">
                                    <table class="table table-striped table-bordered mt-3">
                                        <thead>
                                            <tr>
                                                <th scope="row" class="w-150 dark-grey-text h6">Author Description</th>
                                                <td><em><c:out value="No author description"/></em></td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <th scope="row" class="w-150 dark-grey-text h6">Other Author Information</th>
                                                <td><em>Born: ${i.authorBirthdate}<br/> Dead: No</em></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </c:if>
                                <c:if test="${(desc != NULL) and (death != NULL)}">
                                    <table class="table table-striped table-bordered mt-3">
                                        <thead>
                                            <tr>
                                                <th scope="row" class="w-150 dark-grey-text h6">Author Description</th>
                                                <td><em>${i.authorDesc}</em></td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <th scope="row" class="w-150 dark-grey-text h6">Other Author Information</th>
                                                <td><em>Born: ${i.authorBirthdate}<br/> Dead: ${i.authorDeathdate}</em></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </c:if>
                                <c:if test="${(desc != NULL) and (death == NULL)}">
                                    <table class="table table-striped table-bordered mt-3">
                                        <thead>
                                            <tr>
                                                <th scope="row" class="w-150 dark-grey-text h6">Author Description</th>
                                                <td><em>${i.authorDesc}</em></td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <th scope="row" class="w-150 dark-grey-text h6">Other Author Information</th>
                                                <td><em>Born: ${i.authorBirthdate}<br/> Dead: No</em></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </c:if>
                                <c:if test="${(desc == NULL) and (death != NULL)}">
                                    <table class="table table-striped table-bordered mt-3">
                                        <thead>
                                            <tr>
                                                <th scope="row" class="w-150 dark-grey-text h6">Author Note</th>
                                                <td><em>No author description</em></td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <th scope="row" class="w-150 dark-grey-text h6">Other Author Information</th>
                                                <td><em>Born: ${i.authorBirthdate}<br/> Dead: ${i.authorDeathdate}</em></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </c:if>

                            </div>
                            <div class="tab-pane fade" id="reviews" role="tabpanel" aria-labelledby="reviews-tab">
                                <h5><span>1</span> review for <span>${i.title}</span></h5>
                                <div class="media mt-3 mb-4">
                                    <img class="d-flex mr-3 z-depth-1" src="ressources/pics/placeholder1.jpg"
                                         width="62" alt="Generic placeholder image">
                                    <div class="media-body">
                                        <div class="d-flex justify-content-between">
                                            <p class="mt-1 mb-2">
                                                <c:forEach var="cust" items="${CUST}">
                                                    <c:if test="${(cust.addressId) == (i.addressId)}">
                                                        <strong>${cust.firstname} ${cust.lastname}</strong> 
                                                    </c:if>   
                                                </c:forEach>
                                                <span>– </span><span>January 28, 2020</span>
                                            </p>
                                            <ul class="rating mb-0">
                                                <li>
                                                    <i class="fas fa-star fa-sm text-primary"></i>
                                                </li>
                                                <li>
                                                    <i class="fas fa-star fa-sm text-primary"></i>
                                                </li>
                                                <li>
                                                    <i class="fas fa-star fa-sm text-primary"></i>
                                                </li>
                                                <li>
                                                    <i class="fas fa-star fa-sm text-primary"></i>
                                                </li>
                                                <li>
                                                    <i class="far fa-star fa-sm text-primary"></i>
                                                </li>
                                            </ul>
                                        </div>
                                        <p class="mb-0">${i.commentText}</p>
                                    </div>
                                </div>
                                <hr>
                                
                                <h5 class="mt-4">You must login to make a comment</h5>
                                <c:forEach var="comment" items="${COMMENT}">
                                    <h5 class="mt-4">Add a review</h5>
                                    <c:if test="${(comment.customerId) == (i.customerId)}">
                                        <p>Your email address will not be published.</p>
                                        <div class="my-3">
                                            <ul class="rating mb-0">
                                                <li>
                                                    <a href="#!">
                                                        <i class="fas fa-star fa-sm text-primary"></i>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#!">
                                                        <i class="fas fa-star fa-sm text-primary"></i>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#!">
                                                        <i class="fas fa-star fa-sm text-primary"></i>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#!">
                                                        <i class="fas fa-star fa-sm text-primary"></i>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#!">
                                                        <i class="far fa-star fa-sm text-primary"></i>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                        <div>
                                            <!-- Your review -->
                                            <div class="md-form md-outline">
                                                <textarea id="form76" class="md-textarea form-control pr-6" rows="4"></textarea>
                                                <label for="form76">Your review</label>
                                            </div>
                                            <!-- Name -->
                                            <div class="md-form md-outline">
                                                <input type="text" id="form75" class="form-control pr-6">
                                                <label for="form75">Name</label>
                                            </div>
                                            <!-- Email -->
                                            <div class="md-form md-outline">
                                                <input type="email" id="form77" class="form-control pr-6">
                                                <label for="form77">Email</label>
                                            </div>
                                            <div class="text-right pb-2">
                                                <button type="button" class="btn btn-primary" name="addReview">Add a review</button>
                                            </div>
                                        </div>
                                    </c:if>   
                                </c:forEach>
                                <c:forEach var="comment" items="${COMMENT}">
                                    <h5 class="mt-4">You should have bought this book to make a comment</h5>
                                    <c:if test="${(comment.customerId) == (i.customerId)}">
                                    </c:if>
                                </c:forEach>
                                </div>
                            </div>

                        </div>
                        <!-- Classic tabs -->

                        <hr>

                        <!--Section: Block Content-->
                        <section class="text-center">

                            <h4 class="text-center my-5"><strong>Related products</strong></h4>

                            <!-- Grid row -->
                            <div class="row">

                                <!-- Grid column -->
                                <div class="col-md-6 col-lg-3 mb-5">

                                    <!-- Card -->
                                    <c:forEach var="book"  end="0" items="${RELATED_BOOK}">
                                        <div class="">

                                            <div class="view zoom overlay z-depth-2 rounded">
                                                <a href="#!">
                                                    <div class="mask">
                                                        <img class="img-fluid w-100"
                                                             src="${book.cover}">
                                                        <div class="mask rgba-black-slight"></div>
                                                    </div>
                                                </a>
                                            </div>

                                            <div class="pt-4">

                                                <h5>${book.title}</h5>
                                                <p><span><strong>€${book.price}</strong></span></p>

                                            </div>

                                        </div>
                                    </c:forEach>
                                    <!-- Card -->

                                </div>
                                <!-- Grid column -->

                                <!-- Grid column -->
                                <div class="col-md-6 col-lg-3 mb-5">

                                    <!-- Card -->
                                    <c:forEach var="book"  begin="1" end="1" items="${RELATED_BOOK}">
                                        <div class="">

                                            <div class="view zoom overlay z-depth-2 rounded">
                                                <a href="#!">
                                                    <div class="mask">
                                                        <img class="img-fluid w-100"
                                                             src="${book.cover}">
                                                        <div class="mask rgba-black-slight"></div>
                                                    </div>
                                                </a>
                                            </div>

                                            <div class="pt-4">

                                                <h5>${book.title}</h5>
                                                <p><span><strong>€${book.price}</strong></span></p>

                                            </div>

                                        </div>
                                    </c:forEach>
                                    <!-- Card -->

                                </div>
                                <!-- Grid column -->

                                <!-- Grid column -->
                                <div class="col-md-6 col-lg-3 mb-5">

                                    <!-- Card -->
                                    <c:forEach var="book"  begin="2" end="2" items="${RELATED_BOOK}">
                                        <div class="">

                                            <div class="view zoom overlay z-depth-2 rounded">
                                                <h4 class="mb-0 topop"><span class="badge badge-primary badge-pill badge-news">Sale</span></h4>
                                                <a href="#!">
                                                    <div class="mask">
                                                        <img class="img-fluid w-100"
                                                             src="${book.cover}">
                                                        <div class="mask rgba-black-slight"></div>
                                                    </div>
                                                </a>
                                            </div>

                                            <div class="pt-4">

                                                <h5>${book.title}</h5>
                                                <p><span class="text-danger mr-1"><strong>€${book.price}</strong></span><span
                                                        class="text-grey"><strong><s>€${book.price + 15}</s></strong></span></p>

                                            </div>

                                        </div>
                                    </c:forEach>
                                    <!-- Card -->

                                </div>
                                <!-- Grid column -->

                                <!-- Grid column -->
                                <div class="col-md-6 col-lg-3 mb-5">

                                    <!-- Card -->
                                    <c:forEach var="book"  begin="3" end="3" items="${RELATED_BOOK}">
                                        <div class="">

                                            <div class="view zoom overlay z-depth-2 rounded">
                                                <a href="#!">
                                                    <div class="mask">
                                                        <img class="img-fluid w-100"
                                                             src="${book.cover}">
                                                        <div class="mask rgba-black-slight"></div>
                                                    </div>
                                                </a>
                                            </div>

                                            <div class="pt-4">

                                                <h5>${book.title}</h5>
                                                <p><strong>€${book.price}</strong></p>

                                            </div>

                                        </div>
                                    </c:forEach>
                                    <!-- Card -->

                                </div>
                                <!-- Grid column -->

                            </div>
                            <!-- Grid row -->

                        </section>
                        <!--Section: Block Content-->

                    </div>
                </main>
                <!--Main layout-->

            </c:forEach>


        </footer>
        <!-- Footer -->

        <!-- SCRIPTS -->
        <!-- JQuery -->
        <script src="ressources/js/jquery-3.4.1.min.js"></script>
        <!-- Bootstrap tooltips -->
        <script type="text/javascript" src="ressources/js/popper.min1.js"></script>
        <!-- Bootstrap core JavaScript -->
        <script type="text/javascript" src="ressources/js/bootstrap1.js"></script>
        <!-- MDB core JavaScript -->
        <script type="text/javascript" src="ressources/js/mdb.min.js"></script>
        <!-- MDB Ecommerce JavaScript -->
        <!-- <script type="text/javascript" src="ressources/js/mdb.ecommerce.min.js"></script> -->
        <script>
            $(document).ready(function () {
                // MDB Lightbox Init
                $(function () {
                    $("#mdb-lightbox-ui").load("../../../mdb-addons/mdb-lightbox-ui.html");
                });
            });
        </script>



        <jsp:include page="/footer.jsp" flush="false" />
    </body>
</html>
