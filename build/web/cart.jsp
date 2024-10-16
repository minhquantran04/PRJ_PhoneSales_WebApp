<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="model.CartItem, model.Product, java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>
    <head>
        <!-- Basic -->
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <!-- Site Metas -->
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link rel="shortcut icon" href="images/favicon.png" type="">
        <title>Famms - Fashion HTML Template</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- bootstrap core css -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
        <!-- font awesome style -->
        <link href="css/font-awesome.min.css" rel="stylesheet" />
        <!-- Custom styles for this template -->
        <link href="css/style.css" rel="stylesheet" />
        <!-- responsive style -->
        <link href="css/responsive.css" rel="stylesheet" />
    </head>
    <body>
        <%@include file="panner.jsp" %>
        <!-- Body -->
        <div class="container-fluid pt-5" id="product">
            <div class="row px-xl-5">
                <!-- Cart Start -->
                <div class="container-fluid pt-5">
                    <div class="row px-xl-5">
                        <c:if test="${showBill eq null}">
                            <div class="col-lg-8 table-responsive mb-5">

                                <table class="table table-bordered text-center mb-0">
                                    <thead class="bg-secondary text-dark">
                                        <tr>
                                            <th style="background-color: #bfd1ec">ID</th>
                                            <th style="background-color: #bfd1ec">Product Name</th>
                                            <th style="background-color: #bfd1ec">Price</th>
                                            <th style="background-color: #bfd1ec">Quantity</th>
                                            <th style="background-color: #bfd1ec">Total</th>
                                            <th style="background-color: #bfd1ec">Remove</th>
                                        </tr>
                                    </thead>
                                    <tbody class="align-middle">
                                        <% double total_raw = 0;
                                            java.util.Enumeration enms = session.getAttributeNames();
                                            while (enms.hasMoreElements()) {
                                                String id = enms.nextElement().toString();
                                                if (!id.equals("user") && !id.equals("fullname") && !id.equals("numberProductsInCart")) {
                                                    CartItem cartItem = (CartItem) session.getAttribute(id); 
                                                    Product product = cartItem.getProduct();
                                                    int quantity = cartItem.getQuantity();
                                        %>
                                    <form action="cart" id="add-cart">
                                        <input type="hidden" name="service" value="update"/>
                                    </form>
                                    <tr>
                                        <!-- ProductID -->
                                        <td class="align-middle"><%= product.getId()%></td>
                                        <!-- ProductName -->
                                        <td class="align-middle">
                                            <img src="<%= product.getImage_url()%>" alt="<%= product.getName()%>" style="width: 50px" />
                                            <%= product.getName()%>
                                        </td>
                                        <!-- ProductPrice -->
                                        <td class="align-middle">$<%= product.getPrice()%></td>
                                        <!-- Quantity -->
                                        <td class="align-middle">
                                            <div class="input-group quantity mx-auto" style="width: 100px" >
                                                <input style="background-color: #bfd1ec" type="number" class="form-control form-control-sm  text-center" value="<%= quantity%>" form="add-cart" name="p<%= id%>" />
                                            </div>
                                        </td>
                                        <!-- SubTotal -->
                                        <td class="align-middle">$<%= Math.round((product.getPrice() * quantity) * 10) / 10.0 %></td>
                                        <!-- Remove -->
                                        <td class="align-middle">
                                            <a href="cart?service=removeItem&id=<%= id%>" class="btn btn-sm btn-danger">
                                                <i class="bi bi-trash"></i> 
                                            </a>
                                        </td>
                                    </tr>
                                    <% total_raw += (product.getPrice() * quantity);
                                        }
                                    }
                                    DecimalFormat df = new DecimalFormat("#.00");
                                    String total = df.format(total_raw);
                                    %>
                                    </tbody>
                                </table>

                                <div class="row">
                                    <div class="col-md-6">
                                        <button style="background-color: #b6effb; border: none"class="btn btn-block btn-custom my-3 py-3" onclick="document.getElementById('add-cart').submit();">
                                            Update Cart
                                        </button>
                                    </div>
                                    <div class="col-md-6 d-flex justify-content-end">
                                        <a href="cart?service=removeAll" class="btn btn-block btn-danger my-3 py-3">
                                            Remove all
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <%--bill here--%>
                            <div class="col-lg-4">
                                <div class="card border-secondary mb-5">
                                    <div style="background-color: #bfd1ec" class="card-header  border-0 text-center">
                                        <h4  class="font-weight-semi-bold m-0">Your Order</h4>
                                    </div>

                                    <div class="card-body">
                                        <div class="d-flex justify-content-between mb-3 pt-1">
                                            <h6 class="font-weight-medium">Subtotal</h6>
                                            <h6 class="font-weight-medium">$<%= total%></h6>
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <h6 class="font-weight-medium">Shipping</h6>
                                            <h6 class="font-weight-medium">$0</h6>
                                        </div>
                                    </div>
                                    <div class="card-footer border-secondary bg-transparent">
                                        <div class="d-flex justify-content-between mt-2">
                                            <h5 class="font-weight-bold">Total</h5>
                                            <h5 class="font-weight-bold">$<%= total%></h5>
                                        </div>
                                        <a style="background-color: #b6effb; border: none"href="cart?service=checkOut" class="btn btn-block btn-custom my-3 py-3">
                                            Buy Now
                                        </a>
                                    </div>
                                    <c:if test="${checkOutDone ne null}">
                                        <div class="card-header bg-secondary border-0 text-center">
                                            <strong><a style="color: black" href="cart?service=showBill&billId=${BillId}">Your order has been placed. Click here to see detail!</a></strong>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>
                <!-- Cart End -->
                <!--show bill detail--> 
                <c:if test="${showBill ne null}">

                    <div class="col-lg-8 table-responsive mb-5">
                        <h1 class="font-weight-semi-bold text-uppercase mb-3 text-center">
                            Your Order Detail
                        </h1>
                        <table class="table table-bordered text-center mb-0">
                            <thead class="bg-secondary text-dark">
                                <tr>

                                    <th>Created Date</th>
                                    <th>Product Name</th>
                                    <th>Quantity</th>
                                    <th>SubTotal</th>
                                </tr>
                            </thead>
                            <tbody class="align-middle">
                                <c:set var="total" value="0" />
                                <c:forEach var="billDetail" items="${billDetails}">
                                    <tr>

                                        <td class="align-middle">${billDetail.created_date}</td>
                                        <td class="align-middle">
                                            <img src="${billDetail.image_url}" alt="" style="width: 50px" />
                                            ${billDetail.productName}
                                        </td>
                                        <td class="align-middle">${billDetail.productQuantity}</td>
                                        <td class="align-middle">${billDetail.subTotal*1.0}</td>
                                    </tr>
                                    <c:set var="subtotal" value="${billDetail.subTotal}" />
                                    <c:set var="total" value="${total + subtotal}" />
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <div class="col-lg-4" style="transform: translateY(65px)">
                        <div class="card border-secondary mb-5">
                            <div class="card-header bg-secondary border-0">
                                <h4 class="font-weight-semi-bold m-0">Your Order</h4>
                            </div>
                            <div class="card-body">
                                <div class="d-flex justify-content-between mb-3 pt-1">
                                    <h6 class="font-weight-medium">Subtotal</h6>
                                    <h6 class="font-weight-medium">$${total*1.0}</h6>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <h6 class="font-weight-medium">Shipping</h6>
                                    <h6 class="font-weight-medium">$0</h6>
                                </div>
                            </div>
                            <div class="card-footer border-secondary bg-transparent">
                                <div class="d-flex justify-content-between mt-2">
                                    <h5 class="font-weight-bold">Total</h5>
                                    <h5 class="font-weight-bold">$${total*1.0}</h5>
                                </div>
                            </div>

                        </div>
                    </div>

                </c:if>
            </div>
        </div>
        <%@include file="footer.jsp" %>
        <!-- jQery -->
        <script src="js/jquery-3.4.1.min.js"></script>
        <!-- popper js -->
        <script src="js/popper.min.js"></script>
        <!-- bootstrap js -->
        <script src="js/bootstrap.js"></script>
        <!-- custom js -->
        <script src="js/custom.js"></script>
    </body>
</html>
