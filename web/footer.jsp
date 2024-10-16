<%-- footer.jsp --%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Footer</title>
        <style>
            /* CSS for footer */
            .footer {
                background-color:  #3f51b5; /* Màu nền */
                color: #ffffff; /* Màu chữ */
                padding: 30px 0; /* Padding */
                text-align: center; /* Center align text */
            }
            .footer-content {
                max-width: 1200px; /* Maximum width of content */
                margin: 0 auto; /* Center content */
            }
            .footer-text {
                margin-bottom: 10px; /* Bottom margin for text */
            }
        </style>
    </head>
    <body>

        <!-- footer start -->
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="full">
                            <div class="logo_footer">
                                <a href="#"><img width="210" src="images/logo.png" alt="#" /></a>
                            </div>
                            <div class="information_f">
                                <p><strong>ADDRESS:</strong> FPT University</p>
                                <p><strong>TELEPHONE:</strong> +91 987 654 3210</p>
                                <p><strong>EMAIL:</strong> email@gmail.com</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="row">
                            <div class="col-md-7">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="widget_menu">
                                            <h3>Menu</h3>
                                            <ul>
                                                <li><a href="#">Home</a></li>
                                                <li><a href="#">About</a></li>
                                                <li><a href="#">Services</a></li>
                                                <li><a href="#">Testimonial</a></li>
                                                <li><a href="#">Blog</a></li>
                                                <li><a href="#">Contact</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="widget_menu">
                                            <h3>Account</h3>
                                            <ul>
                                                <li><a href="#">Account</a></li>
                                                <li><a href="#">Checkout</a></li>
                                                <li><a href="#">Login</a></li>
                                                <li><a href="#">Register</a></li>
                                                <li><a href="#">Shopping</a></li>
                                                <li><a href="#">Widget</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>     
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- footer end -->
        <div class="cpy_">
            <p>© 2024 All Rights Reserved By <a href="#">GROUP 2</a></p>
        </div>

    </body>
</html>
