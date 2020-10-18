<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@page import="java.util.Collection"%>
<%@page import="com.bookshop.beans.Products"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Welcome to the Book shop</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="ressources/css/bootstrap.min.css" >
        <link rel="stylesheet" href="ressources/css/styles.css" >
        <link rel="stylesheet" href="ressources/css/product.css" >
        <script type="text/javascript" src="ressources/js/jquery-3.5.1.js"></script>
        <script type="text/javascript" src="ressources/js/popper.min.js"></script>
        <script type="text/javascript" src="ressources/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- Adds library for slider -->
        <script src="ressources/js/slider.js"></script>


    </head>
    <body>
        <jsp:include page="/header.jsp" flush="false" />
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="controller">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Products</li>
            </ol>
        </nav>
        <div class="album py-5 bg-light">
            <div class="row row2" >
                <div class="col-md-5 selectBis2">

                    <form id="formP" name="product">
                        <select name="limit" id="input-limit" class="form-control col-md-4 selectBis" onchange="this.form.submit();" >
                            <option value="${All}" id="allPr">Show All Number</option>
                            <option value="${oneThird}">Show : ${oneThird}</option>
                            <option value="${half}">Show : ${half}</option>
                        </select>
                    </form>
                    <form id="formQ" name="product">
                        <select name="order" id="input-sort" class="form-control col-md-4" onchange="this.form.submit();">
                            <option value="default" id="disorder">Sort By : Default</option>
                            <option value="ordered">Sort By : Name (A - Z)</option>
                            <option value="reversed">Sort By : Name (Z - A)</option>
                            <option value="increase">Sort By : Price (Low &gt; High)</option>
                            <option value="decrease">Sort By : Price (High &gt; Low)</option>
                        </select>
                    </form>
                </div>
            </div>
            <div class="container-fluid paddingBis">
                <div class="row">
                    <nav class="col-md-2 d-none d-md-block bg-light sidebar">
                        <section>
                            <h5 class="gray">Shop By: </h5>

                            <%--- Categories ---%>
                            <h5>Category</h5>
                            <div class="accordion" id="accordionExample">
                                <div class="card">
                                    <div class="card-header" id="headingOne">
                                        <h2 class="mb-0">
                                            <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                                Clothing
                                            </button>
                                        </h2>
                                    </div>

                                    <div id="collapseOne" class="collapse"  aria-labelledby="headingOne" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <c:forEach var="clothing" items="${CLOTHINGS}">
                                                <div class="col-md-3">    
                                                    <a class="author" href="">${clothing}</a>
                                                </div> 
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-header" id="headingTwo">
                                        <h2 class="mb-0">
                                            <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                                Pharmacy
                                            </button>
                                        </h2>
                                    </div>
                                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <c:forEach var="pharmacy" items="${PHARMACIES}">
                                                <div class="col-md-3">    
                                                    <a class="author" href="">${pharmacy}</a>
                                                </div> 
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-header" id="headingThree">
                                        <h2 class="mb-0">
                                            <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                                Beauty
                                            </button>
                                        </h2>
                                    </div>
                                    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <c:forEach var="beauty" items="${BEAUTIES}">
                                                <div class="col-md-3">    
                                                    <a class="author" href="">${beauty}</a>
                                                </div> 
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-header" id="headingFour">
                                        <h2 class="mb-0">
                                            <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                                Gifts
                                            </button>
                                        </h2>
                                    </div>
                                    <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <c:forEach var="gift" items="${GIFTS}">
                                                <div class="col-md-3">    
                                                    <a class="author" href="">${gift}</a>
                                                </div> 
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-header" id="headingFive">
                                        <h2 class="mb-0">
                                            <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                                                Tools
                                            </button>
                                        </h2>
                                    </div>
                                    <div id="collapseFive" class="collapse" aria-labelledby="headingFive" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <c:forEach var="tool" items="${TOOLS}">
                                                <div class="col-md-3">    
                                                    <a class="author" href="">${tool}}</a>
                                                </div> 
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-header" id="headingSix">
                                        <h2 class="mb-0">
                                            <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
                                                Outdoors
                                            </button>
                                        </h2>
                                    </div>
                                    <div id="collapseSix" class="collapse" aria-labelledby="headingSix" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <c:forEach var="outdoors" items="${OUTDOORS}">
                                                <div class="col-md-3">    
                                                    <a class="author" href="">${outdoors}</a>
                                                </div> 
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <%--- Authors ---%>
                            <hr>
                            <h5>Author</h5>
                            <c:forEach var="author" end="9" items="${AUTHORS}">
                                <div class="col-md-3">    
                                    <a class="author" href="">${author.fullName}</a>
                                </div>
                            </c:forEach>
                            <span id="dots"></span>
                            <span id="more"><c:forEach var="author" begin="10" end="49" items="${AUTHORS}">
                                    <div class="col-md-3">    
                                        <a class="author" href="">${author.fullName}</a>
                                    </div>
                                </c:forEach></span>
                            <p onclick="myFunction()" class="btn-link leftShow" id="myBtn">Show more ▾</p>
                            <hr>
                            <h5>Price</h5>
                            <div class="aria-widget-slider">
                                <div class="rail-label min">
                                    0
                                </div>
                                <div class="rail" style="width: 100px;">
                                    <img id="minPrice"
                                         src="ressources/pics/right-arrow.png"
                                         role="slider"
                                         tabindex="0"
                                         class="min thumb"
                                         aria-valuemin="${min}"
                                         aria-valuenow="${min}"
                                         aria-valuetext="€${min}"
                                         aria-valuemax="${max}">
                                    <img id="maxPrice"
                                         src="ressources/pics/left-arrow.png"
                                         role="slider"
                                         tabindex="0"
                                         class="max thumb"
                                         aria-valuemin="${min}"
                                         aria-valuenow="${max}"
                                         aria-valuetext="€${max}"
                                         aria-valuemax="${max}">
                                </div>
                                <div class="rail-label max">
                                    0
                                </div>
                            </div>
                            <hr>
                            <h5>Avg. Customer Review</h5>
                            <div><span class="break"><a class="undecorated" href="">
                                        5-Star Rating: &nbsp<span class="fa fa-star checked"></span>
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star checked"></span> 
                                    </a></span>

                                <span class="break"><a class="undecorated" href="">
                                        4-Star Rating: &nbsp<span class="fa fa-star checked"></span>
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star"></span>                            
                                    </a></span>

                                <span class="break"><a class="undecorated" href="">
                                        3-Star Rating: &nbsp<span class="fa fa-star checked"></span>
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star"></span>
                                        <span class="fa fa-star"></span>
                                    </a></span>

                                <span class="break"><a class="undecorated" href="">
                                        2-Star Rating: &nbsp<span class="fa fa-star checked"></span>
                                        <span class="fa fa-star checked"></span>
                                        <span class="fa fa-star"></span>
                                        <span class="fa fa-star"></span>
                                        <span class="fa fa-star"></span>
                                    </a></span>

                                <span><a class="undecorated" href="">
                                        1-Star Rating: &nbsp<span class="fa fa-star checked"></span>
                                        <span class="fa fa-star"></span>
                                        <span class="fa fa-star"></span>
                                        <span class="fa fa-star"></span>
                                        <span class="fa fa-star"></span>
                                    </a></span>
                            </div>
                        </section>
                        <!-- Section: Average -->
                    </nav>
                    <main role="main" class="col-md-10 ml-sm-auto col-lg-10 px-4">
                        <div class="col-md-11">

                            <ul class="row" id="listitems" >
                                <c:forEach var="product"  end="${limits-1}" items="${PRODUCTS}">
                                    <div class="col-md-3">
                                        <div class="card mb-3 shadow-sm">
                                            <a href="ProductController?section=viewProduct&view=${product.isbn}"><img class="card-img-top" src="${product.cover}" alt="Card image cap"></a>
                                            <div class="card-body">
                                                <div class="d-flex justify-content-between align-items-center">
                                                    <p class="card-text">${product.title}</p>
                                                    <p >${product.price} €</p>
                                                </div>
                                                <div class="d-flex justify-content-between align-items-center">
                                                    <div class="btn-group">
                                                        <a href="ProductController?section=viewProduct&view=${product.isbn}"><button type="button"  class="btn btn-sm btn-outline-secondary">View </button></a>
                                                        <a href="CartController?section=cart&add=${product.id}"><button type="button"  class="btn btn-sm btn-outline-secondary">Add </button></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach> 
                            </ul>
                        </div>
                    </main>
                </div>
                <!-- Navbar -->
                <nav>
                    <ul id="listitems-pagination" class="pagination justify-content-center">
                        <li class="page-item">
                            <a id="listitems-previous" class="page-link" href="#" tabindex="-1">Previous</a>
                        </li>
                        <li class="page-item">
                            <a id="listitems-next" class="page-link" href="#">Next</a>
                        </li>
                    </ul>
                </nav>
                <!-- /Navbar -->
            </div>
        </div>

        <%-- Footer --%>
        <jsp:include page="/footer.jsp" flush="false" />
        <%-- <script src="ressources/js/bootstrap.bundle.min.js"></script>
        --%>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.3/jquery.min.js"></script>
        <script src="ressources/js/jquery.paginate.js"></script>
        <script type="text/javascript">
            // Controls book display
            $(document).ready(function () {
                $('#listitems').paginate({itemsPerPage: 8});
                $.getJSON('data.json', function (data) {
                    var items = [];
                    $.each(data.items, function (i, product) {
                        items.push('<li>' + product + '</li>');
                    });
                });
            });

            // Displays list of authors
            function myFunction() {
                var dots = document.getElementById("dots");
                var moreText = document.getElementById("more");
                var btnText = document.getElementById("myBtn");

                if (dots.style.display === "none") {
                    dots.style.display = "inline";
                    btnText.innerHTML = "Show more";
                    moreText.style.display = "none";
                } else {
                    dots.style.display = "none";
                    btnText.innerHTML = "Show less";
                    moreText.style.display = "inline";
                }
            }
            
            // Controls dropdown menu showing available quantity by page
            var url_string = window.location.href;
            var url = new URL(url_string);
            var c = url.searchParams.get("limit");
            var allProduct = url.searchParams.get("section");

            if (allProduct == "allProduct") {
                document.getElementById("#options option:selected").text();
            }
            document.getElementById('input-limit').value = c;
            
            // Controls dropdown menu sorting book page
            var url_string1 = window.location.href;
            var url1 = new URL(url_string1);
            var d = url1.searchParams.get("order");
            var allProduct = url1.searchParams.get("section");

            if (allProduct == "allProduct") {
                document.getElementById("#options option:selected").text();
            }
            document.getElementById('input-sort').value = d;
        </script>
    </body>
</html>

