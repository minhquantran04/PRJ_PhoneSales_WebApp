
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <!-- Header -->
        <%@include file="panner.jsp" %>

        <!-- Body -->
        <div class="container-fluid mb-5">
            <div class="row border-top px-xl-5">
                <!--Left Menu-->
                <div class="col-lg-3 d-none d-lg-block">
                    <a class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; margin-top: -1px; padding: 0 30px;">
                        <h6 class="m-0">Phone Shop management</h6>
                    </a>
                    <nav class="collapse show navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0" id="navbar-vertical">
                        <div class="navbar-nav w-100 overflow-hidden" style="height: 410px">
                            <a href="manageCustomer" class="nav-item nav-link">Customers</a>
                            <a href="manageProduct" class="nav-item nav-link">Products </a>
                            <a href="manageBill" class="nav-item nav-link">Bills</a>
                    </nav>
                </div>
                <!--End Left Menu-->

                <!--Right Content-->   
                <div class="col-lg-9">

                    <!--Customer Manager-->
                    <c:if test="${manageCustomer ne null}">
                        <c:if test="${not empty allCustomers}">
                            <%@include file="CustomerManager.jsp" %>
                        </c:if>
                    </c:if>

                    <!--Customer Manager End-->

                    <!--Product Manager-->
                    <c:if test="${manageProduct ne null}">
                        <%@include file="ProductManager.jsp" %>

                    </c:if>
                    <!--Product Manager End-->

                    <c:if test="${manageBill ne null}">
                        <%@include file="BillManager.jsp" %>
                    </c:if>

                </div>
                <!--End Right Content-->
            </div>
        </div>

        <!-- Footer -->
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
