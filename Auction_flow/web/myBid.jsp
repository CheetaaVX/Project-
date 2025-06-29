
<%@page import="com.tech.dao.ProductDAO"%>
<%@page import="com.tech.entities.Product"%>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<!DOCTYPE html>
<html lang="en">
    <%
    
             String email = (String) session.getAttribute("email");
             if(email==null)
             {
             response.sendRedirect("login.html");
             }
    %>
   <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <!-- mobile metas -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <!-- site metas -->
      <title>AuctionFlow</title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
      <link rel=" stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
        integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
        crossorigin="anonymous" referrerpolicy="no-referrer">
      <!-- bootstrap css -->
      <link rel="stylesheet" href="css/bootstrap.min.css">
      <!-- style css -->
      <link rel="stylesheet" href="css/style.css">
      <!-- Responsive-->
      <link rel="stylesheet" href="css/responsive.css">
      <!-- fevicon -->
      <link rel="icon" href="images/fevicon.png" type="image/gif" />
      <!-- Scrollbar Custom CSS -->
      <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
      <!-- Tweaks for older IEs-->
      <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
      <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
   </head>
   <!-- body -->
   <body class="main-layout inner_page">
      <!-- loader  -->
      <!-- <div class="loader_bg">
         <div class="loader"><img src="images/loading.gif" alt="#"/></div>
      </div> -->
      <!-- end loader -->
      <!-- header -->
            <header class="full_bg">
         <!-- header inner -->
         <div class="header">
            <div class="header_top">
               <div class="container">
                  <div class="row">
                     <div class="col-md-3">
                        <ul class="contat_infoma">
                           <li><i class="fa fa-phone" aria-hidden="true"></i> Call :+91 9623088468</li>
                        </ul>
                     </div>
                     <div class="col-md-6">
                        <ul class="social_icon_top text_align_center  ">
                           <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                           <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                           <li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                           <li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                        </ul>
                     </div>
                     <div class="col-md-3">
                        <ul class="contat_infoma text_align_right">
                            <li><a href="mailto:amitpawar2524@gmail.com"> <i class="fa fa-phone" aria-hidden="true"></i> actionflow@gmail.com</a></li>
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
            <div class="container">
               <div class="row">
                  <div class="col-md-12">
                     <div class="header_bottom">
                        <div class="row">
                           <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col logo_section">
                              <div class="full">
                                 <div class="center-desk">
                                    <div class="logo">
                                       <a href="index.html">AuctionFlow</a>
                                    </div>
                                 </div>
                              </div>
                           </div>
                           <div class="col-xl-9 col-lg-9 col-md-9 col-sm-9">
                              <nav class="navigation navbar navbar-expand-md navbar-dark ">
                                 <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample04" aria-controls="navbarsExample04" aria-expanded="false" aria-label="Toggle navigation">
                                 <span class="navbar-toggler-icon"></span>
                                 </button>
                                 <div class="collapse navbar-collapse" id="navbarsExample04">
                                    <ul class="navbar-nav mr-auto">
                                       <li class="nav-item active">
                                          <a class="nav-link" href="index.html">Home</a>
                                       </li>
                                       <li class="nav-item">
                                          <a class="nav-link" href="myBid.jsp">My Bids</a>
                                       </li>
                                       <li class="nav-item">
                                          <a class="nav-link" href="myCart.jsp">MY CART</a>
                                       </li>
                                       <li class="nav-item">
                                          <a class="nav-link" href="myProduct.jsp">My Products</a>
                                       </li>
                                       <li class="nav-item">
                                          <a class="nav-link" href="bill.jsp">User</a>
                                       </li>
                                       
                                    </ul>
                                 </div>
                              </nav>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <!-- end header inner -->
         <!-- end header -->
         <!-- banner -->
      </header>
      <div class="back_re">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <div class="title">
                     <h2>MY BIDS</h2>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- Main page -->
      <div class="col-md-12">
         <div class="titlepage">
            
             <span> <h3> <class="des-heading"></h3></span>
         </div>
      </div>
      <!-------------------------------------------------------------------------------------->
      <div class="container-prod">
         <!---------------------------- First Row ---------------------------->
       
         <div class="product-container" style="display: ruby">
         <% 
             ProductDAO productDAO = new ProductDAO();
             List<Product> products = productDAO. getbidproduct(email);
             for (Product product : products) {
            String imageSrc = request.getContextPath() + "/" + product.getImageLocation();
            int id = product.getProductId();
             String name = product.getProductName();
             String descrip = product.getDescription();
             double price = product.getPrice();
            
            String image = product.getImageLocation().replace('\\', '/');;
        %>
        <div class="product" style="height:371px; width: 241px;" >
            <a href="ShowDetail.jsp?productId=<%=id%>&name=<%=name%>&price=<%=price%>&descrip=<%=descrip%>&image=<%=image%>">
                <img src="<%= imageSrc %>" style=" width: 175px; height: 200px;" alt="Product Image">
                <h3><%= product.getProductName() %></h3>
                <p>Price: <%= product.getPrice() %></p>
                <button>Bid Now</button>
            </a>
        </div>
        <% } %>
    </div>

         
         <!-- Add more product items here -->
         

         <!-- Blank spaces for layout -->
         <div class="blank-space"></div>
         
        
      </div>
      <!-------------------------------------------------------------------------------------->

      
      <!-- end Main page -->
      <!--  footer -->
      <footer>
         <div class="footer">
            <div class="container">
               <div class="row">

               </div>
            </div>
            <div class="copyright">
               <div class="container">
                  <div class="row">
                     <div class="col-md-8 offset-md-2">
                        <p>© 2024 All Rights Reserved.</p>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </footer>
      <!-- end footer -->
      <!-- Javascript files-->
      <script src="js/jquery.min.js"></script>
      <script src="js/bootstrap.bundle.min.js"></script>
      <script src="js/jquery-3.0.0.min.js"></script>
      <!-- sidebar -->
      <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
      <script src="js/custom.js"></script>
   </body>
</html>