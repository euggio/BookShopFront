<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Welcome to the Book shop</title>
        <meta name="description" content="BookShop is one of the most famous online library. Here you can consult the last issues of the most famous 
              writters from all over the world and discover ou special events."/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="ressources/css/bootstrap.min.css" >
        <link rel="stylesheet" href="ressources/css/styles.css" >
        <script type="text/javascript" src="ressources/js/jquery-3.5.1.js"></script>
        <script type="text/javascript" src="ressources/js/popper.min.js"></script>
        <script type="text/javascript" src="ressources/js/bootstrap.min.js"></script>
    </head>
    <body>

        <!-- Header -->
        <jsp:include page="/header.jsp" flush="false" />
        <!-- /Header -->

        <!-- Slider -->
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <a href="ProductController?section=viewProduct&view=978-9-247-92051-7">
                        <img class="d-block w-100" src="ressources/pics/index_slide2.jpg" alt="First slide">
                    </a>
                    <div class="carousel-caption d-none d-md-block">
                        <a href="ProductController?section=viewProduct&view=978-9-247-92051-7" style="text-decoration:none;">
                        <h1 style="color: white; font-weight: bolder;" class="display-4">MYTHICAL BEASTS issue 2021</h1>
                        </a>
                    </div>
                </div>
                <div class="carousel-item">
                    <a href="ProductController?section=viewProduct&view=978-9-247-92051-7">
                    <img class="d-block w-100" src="ressources/pics/index_slide1.jpg" alt="second slide">
                    </a>
                    <div class="carousel-caption d-none d-md-block">
                        <a href="ProductController?section=viewProduct&view=978-9-247-92051-7" style="text-decoration:none;">
                        <h1 style="color: white; font-weight: bolder;" class="display-4">José Barba LiBreo</h1>
                        <h1 style="color: white" class="display-5">Special edition!</h1>
                        </a>
                    </div>
                </div>
                <div class="carousel-item">
                    <a href="ProductController?section=viewProduct&view=978-9-247-92051-7" style="text-decoration:none;">
                    <img class="d-block w-100" src="ressources/pics/index_slide3.jpg" alt="third slide">
                    </a>
                    <div class="carousel-caption d-none d-md-block">
                        <a href="ProductController?section=viewProduct&view=978-9-247-92051-7" style="text-decoration:none;">
                        <h1 style="color: white; font-weight: bolder;" class="display-4">Lee Unkrich Special Event</h1>
                        </a>
                    </div>
                </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <!-- /Slider -->

        <!-- Cards container -->
        <div class="album py-5 bg-light">
            <div class="album py-4 bg-light">
                <div class="container">
                    <ul class="row" id="listitems" >

                        <!-- Card -->
                        <c:forEach var="item" items="${ listproducts }">
                            <li  class="col-md-4 list-group content">
                                <div class="card mb-4 shadow-sm view">
                                    <a href="ProductController?section=viewProduct&view=${ item.isbn }">
                                        <img class="card-img-top" src="${item.cover}" alt="${ item.title }">
                                    </a>
                                    <div class="card-body">
                                        <h5 class="card-title">${ item.title } : ${item.subtitle}</h5>
                                        <p class="card-text">${ item.summary }...</p>
                                        <p>${ item.price } €</p>
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div class="btn-group">
                                                <a class="btn btn-outline-dark" href="ProductController?section=viewProduct&view=${item.isbn}">Details</a>
                                                <a class="btn btn-dark" href="CartController?section=manageCart&add=${item.id}">Add to cart</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                        <!-- /Card -->

                    </ul>
                </div>
            </div>
            
            <!-- Navbar -->
            <nav>
                <div class="pagination justify-content-center" class="listitems-pagination btn-group">
                        <a id="listitems-previous" class="page-link btn-outline-dark" onclick="$('html,body').animate({scrollTop:0},'slow');return false;" href="#" tabindex="-1">Previous</a>
                        <a id="listitems-next" class="page-link btn-dark" onclick="$('html,body').animate({scrollTop:0},'slow');return false;" href="#">Next</a>
                </div>
            </nav>
            <!-- /Navbar -->

        </div>
        <!-- /Cards container -->

        <!-- Footer -->
        <jsp:include page="/footer.jsp" flush="false" />
        <!-- /Footer -->
        <script type="text/javascript" src="ressources/js/jquery-1.6.3.min.js"></script>
        <script src="ressources/js/jquery.paginate.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#listitems').paginate({itemsPerPage: 9});

                $.getJSON('data.json', function (data) {
                    var items = [];
                    $.each(data.items, function (item) {
                        items.push('<li>' + item + '</li>');
                    });
                });
            });
        </script>
    </body>
</html>