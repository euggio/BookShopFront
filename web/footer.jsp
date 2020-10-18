<footer class="container py-5">
    <div class="row">
        <div class="col-12 col-md">
            <img src="ressources/pics/MinLogoBookShop.jpg"/>
            <small class="d-block mb-3 text-muted">all right reserved - &copy; 2020</small>
        </div>
        <div class="col-6 col-md">
            <h5>Social Networks</h5>
            <ul class="list-unstyled text-small">
                <li><a class="text-muted" href="https://www.facebook.com/" target="_blank">Facebook</a></li>
                <li><a class="text-muted" href="https://twitter.com/" target="_blank">Twitter</a></li>
                <li><a class="text-muted" href="https://www.instagram.com/" target="_blank">Instagram</a></li>
            </ul>
        </div>
        <div class="col-6 col-md">
            <h5>Social networks</h5>
            <ul class="list-unstyled text-small">
                <li><a class="text-muted" href="https://www.youtube.com/" target="_blank">Youtube</a></li>
                <li><a class="text-muted" href="https://www.pinterest.fr/" target="_blank">Pinterest</a></li>
                <li><a class="text-muted" href="https://www.linkedin.com/" target="_blank">Linkedin</a></li>
            </ul>
        </div>
        <div class="col-6 col-md">
            <h5>Society</h5>
            <ul class="list-unstyled text-small">
                <li><a class="text-muted" href="<%=request.getContextPath() + response.encodeURL("/whoweare.jsp")%>">Who we are</a></li>
                <li><a class="text-muted" href="<%=request.getContextPath() + response.encodeURL("/legalmentions.jsp")%>">Legal mentions</a></li>
            </ul>
        </div>
        
    </div>
</footer>
