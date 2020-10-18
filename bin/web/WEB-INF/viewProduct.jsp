<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Welcome to the Book shop</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" >
        <link rel="stylesheet" href="ressources/css/styles.css" >
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
                    <%--
            <div class="album py-5 bg-light">
                <div class="container">
                    <div class="card mb-3" style="max-width: 540px;" >
                        <div class="row no-gutters">
                            <div class="col-md-4">
                                <img class="card-img-top" src="ressources/pics/book.jpg" alt="Card image cap">
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title">${i.title}</h5>
                                    <p class="card-text">${i.summary}</p>
                                    <p class="card-text" >${i.price} €</p>
                                    <a href="CartController?section=cart&add=${i.id}"><button type="button" class="btn btn-sm btn-outline-secondary">Add </button></a>
                                </div>
                            </div>
                        </div>
                    </div>   
                </div>
</div> --%>
        
        
        
        

  <!--Main Navigation-->
  <header>
    <div class="jumbotron color-grey-light mt-70">
      <div class="d-flex align-items-center h-100">
        <div class="container text-center py-5">
            <p><h3 class="mb-0">${i.title} — ${i.subtitle}</h3><p>by author:</p>
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

            <h5>${i.title}</h5>
            <p class="mb-2 text-muted text-uppercase small">${i.subtitle}</p>
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
                    <td>N/A</td>
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
                    <td class="pl-0 pb-0 w-25">Quantity</td>
                    <td class="pb-0">Select format</td>
                  </tr>
                  <tr>
                    <td class="pl-0">
                      <div class="def-number-input number-input safari_only mb-0">
                        <button onclick="this.parentNode.querySelector('input[type=number]').stepDown()"
                          class="minus"></button>
                        <input class="quantity" min="0" name="quantity" value="1" type="number">
                        <button onclick="this.parentNode.querySelector('input[type=number]').stepUp()"
                          class="plus"></button>
                      </div>
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
            <button type="button" class="btn btn-primary btn-md mr-1 mb-2">Buy now</button>
            <button type="button" class="btn btn-light btn-md mr-1 mb-2"><i class="fas fa-shopping-cart pr-2"></i>Add to
              cart</button>
          </div>
        </div>

      </section>
      <!--Section: Block Content-->

      <!-- Classic tabs -->
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
            <h5>Product Description</h5>
            <p class="small text-muted text-uppercase mb-2">${i.title}</p>
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
            <table class="table table-striped table-bordered mt-3">
              <thead>
                <tr>
                  <th scope="row" class="w-150 dark-grey-text h6">Weight</th>
                  <td><em>0.3 kg</em></td>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <th scope="row" class="w-150 dark-grey-text h6">Dimensions</th>
                  <td><em>50 × 60 cm</em></td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="tab-pane fade" id="reviews" role="tabpanel" aria-labelledby="reviews-tab">
            <h5><span>1</span> review for <span>Fantasy T-shirt</span></h5>
            <div class="media mt-3 mb-4">
              <img class="d-flex mr-3 z-depth-1" src="https://mdbootstrap.com/img/Photos/Others/placeholder1.jpg"
                width="62" alt="Generic placeholder image">
              <div class="media-body">
                <div class="d-flex justify-content-between">
                  <p class="mt-1 mb-2">
                    <strong>Marthasteward </strong>
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
                <p class="mb-0">Nice one, love it!</p>
              </div>
            </div>
            <hr>
            <h5 class="mt-4">Add a review</h5>
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
                <button type="button" class="btn btn-primary">Add a review</button>
              </div>
            </div>
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
            <div class="">

              <div class="view zoom overlay z-depth-2 rounded">
                <img class="img-fluid w-100"
                  src="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Vertical/12a.jpg" alt="Sample">
                <a href="#!">
                  <div class="mask">
                    <img class="img-fluid w-100"
                      src="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Vertical/12.jpg">
                    <div class="mask rgba-black-slight"></div>
                  </div>
                </a>
              </div>

              <div class="pt-4">

                <h5>Blue denim shirt</h5>
                <p><span><strong>$17.99</strong></span></p>

              </div>

            </div>
            <!-- Card -->

          </div>
          <!-- Grid column -->

          <!-- Grid column -->
          <div class="col-md-6 col-lg-3 mb-5">

            <!-- Card -->
            <div class="">

              <div class="view zoom overlay z-depth-2 rounded">
                <img class="img-fluid w-100"
                  src="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Vertical/13a.jpg" alt="Sample">
                <a href="#!">
                  <div class="mask">
                    <img class="img-fluid w-100"
                      src="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Vertical/13.jpg">
                    <div class="mask rgba-black-slight"></div>
                  </div>
                </a>
              </div>

              <div class="pt-4">

                <h5>Red hoodie</h5>
                <p><span><strong>$35.99</strong></span></p>

              </div>

            </div>
            <!-- Card -->

          </div>
          <!-- Grid column -->

          <!-- Grid column -->
          <div class="col-md-6 col-lg-3 mb-5">

            <!-- Card -->
            <div class="">

              <div class="view zoom overlay z-depth-2 rounded">
                <img class="img-fluid w-100"
                  src="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Vertical/14a.jpg" alt="Sample">
                <h4 class="mb-0"><span class="badge badge-primary badge-pill badge-news">Sale</span></h4>
                <a href="#!">
                  <div class="mask">
                    <img class="img-fluid w-100"
                      src="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Vertical/14.jpg">
                    <div class="mask rgba-black-slight"></div>
                  </div>
                </a>
              </div>

              <div class="pt-4">

                <h5>Grey sweater</h5>
                <p><span class="text-danger mr-1"><strong>$21.99</strong></span><span
                    class="text-grey"><strong><s>$36.99</s></strong></span></p>

              </div>

            </div>
            <!-- Card -->

          </div>
          <!-- Grid column -->

          <!-- Grid column -->
          <div class="col-md-6 col-lg-3 mb-5">

            <!-- Card -->
            <div class="">

              <div class="view zoom overlay z-depth-2 rounded">
                <img class="img-fluid w-100"
                  src="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Vertical/15a.jpg" alt="Sample">
                <a href="#!">
                  <div class="mask">
                    <img class="img-fluid w-100"
                      src="https://mdbootstrap.com/img/Photos/Horizontal/E-commerce/Vertical/14.jpg">
                    <div class="mask rgba-black-slight"></div>
                  </div>
                </a>
              </div>

              <div class="pt-4">

                <h5>Black denim jacket</h5>
                <p><strong>$99.99</strong></p>

              </div>

            </div>
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
    <script type="text/javascript" src="ressources/js/mdb.ecommerce.min.js"></script>
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
