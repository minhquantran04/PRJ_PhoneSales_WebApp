
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
        </style>
    </head>
    <body>

        <!-- product section -->
        <section class="product_section layout_padding">
            <div class="container">

                <div class="heading_container heading_center">
                    <h2>
                        Our <span>products</span>
                    </h2>
                </div>
                <div class="d-flex justify-content-center">
                    <form class="form-inline" action="customer">
                        <input class="form-control nav_search p-0 m-0" type="search" placeholder="Search" aria-label="Search" name="keyword">
                        <button class="btn" type="submit">
                            <i class="fa fa-search" aria-hidden="true"></i>
                        </button>
                        <input type="hidden" name="service" value="search"/>
                    </form>
                </div>
                <div class="row">
                    <%@include file="menu.jsp" %>

                    <c:forEach items="${requestScope.products}" var="p">
                        <div class="col-md-4">
                            <div class="box" style="height: 450px">
                                <div class="option_container">
                                    <div class="options">
                                        <a href="cart?service=addToCart&productId=${p.id}" class="option2">
                                            Add to Cart
                                        </a>
                                    </div>
                                </div>
                                <div class="img-box">
                                    <img src="${p.image_url}" alt="">
                                </div>
                                <div class="detail-box row">
                                    <div class="col-md-4">
                                        <h5>
                                            ${p.name}
                                        </h5>
                                    </div>
                                    <div class="col-md-4 offset-md-4">
                                        <h5>
                                            $${p.price}
                                        </h5>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>
        <!-- end product section -->
    </body>
</html>
