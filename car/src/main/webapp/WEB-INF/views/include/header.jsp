<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<header id="header">
        <div id="top-bar">
            <div class="container">
                <div class="row">
                    <div class="col-sm-8 top-info hidden-xs">
                        <span><i class="fa fa-phone"></i>Phone: (123) 456-7890</span>
                        <span><i class="fa fa-envelope"></i>Email: mail@example.com</span>
                    </div>
                    <div class="col-sm-4 top-info">
                        <ul>
                            <li><a href="" class="my-tweet"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="" class="my-facebook"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="" class="my-skype"><i class="fa fa-skype"></i></a></li>
                            <li><a href="" class="my-pint"><i class="fa fa-pinterest"></i></a></li>
                            <li><a href="" class="my-rss"><i class="fa fa-rss"></i></a></li>
                            <li><a href="" class="my-google"><i class="fa fa-google-plus"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div id="logo-bar">
            <div class="container">
                <div class="row">
                    <!-- Logo / Mobile Menu -->
                    <div  class="col-lg-3 col-sm-3 ">
                        <div id="logo">
                            <h1><a href="/car/home.action"><img alt="logo" src="/car/resources/images/logo.png"/></a></h1>
                        </div>
                    </div>
                    <!-- Navigation
    ================================================== -->
                    <div class="col-lg-9 col-sm-9">
                        <div class="navbar navbar-default navbar-static-top" role="navigation">
                            <!--  <div class="container">-->
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                            </div>
                            <div class="navbar-collapse collapse">
                                <ul class="nav navbar-nav">
                                    <li class="active"><a href="#">예약</a>
                                        <ul class="dropdown-menu">
                                            <li ><a href="/car/reservation/list.action">카풀신청</a></li>
                                            <li ><a href="/car/groupschedule/longtermreservationlist.action">정기 예약 리스트</a></li>
                                                                                    
                                           
                                                                                    
                                        </ul>
                                    </li>

                                    <li><a href="#">차계부</a>
                                        <ul class="dropdown-menu">
                                            <li><a href="/car/car/list.action">홈</a></li>
                                            <li><a href="/car/carhistory/list.action">내역</a></li>
                                            <li><a href="/car/car/graph.action">그래프</a></li>
                                        </ul>
                                    </li>

                                    <li><a href="/car/board/list.action" >게시판</a>
                                        <ul class="dropdown-menu">
                                            <li><a href="/car/board/list.action">공지사항</a></li>
                                            <li><a href="/car/board/list2.action">후기</a></li>
                                        </ul>
                                    </li>

                                    <li><a href="#">고객센터</a>
                                        <ul class="dropdown-menu">
                                            <li>
                                                <a href="#">Portfolio Classic</a>
                                                <ul class="dropdown-menu">
                                                    <li><a href="portfolio_2.html">Portfolio 2</a></li>
                                                    <li><a href="portfolio_3.html">Portfolio 3</a></li>
                                                    <li><a href="portfolio_4.html">Portfolio 4</a></li>
                                                </ul>
                                            </li>
                                            <li>
                                                <a href="portfolio_masonry_3.html">Portfolio Masnory</a>
                                                <ul class="dropdown-menu">
                                                    <li><a href="portfolio_masonry_2.html">Masonry portfolio 2</a></li>
                                                    <li><a href="portfolio_masonry_3.html">Masonry portfolio 3</a></li>
                                                    <li><a href="portfolio_masonry_4.html">Masonry portfolio 4</a></li>
                                                </ul>
                                            </li>

                                            <li>
                                                <a href="portfolio_single.html">Portfolio Single</a>
                                                <ul class="dropdown-menu">
                                                    <li><a href="portfolio_single.html">Portfolio Single 1</a></li>
                                                    <li><a href="portfolio_single_2.html">Portfolio Single 2</a></li>
                                                    <li><a href="portfolio_single_3.html">Portfolio Single 3</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </li>
                                    
                                    <li>&nbsp;&nbsp;&nbsp;&nbsp;
                                    </li>
                                    
                             
                                    <c:choose>
					<c:when test="${empty loginuser}">
						
							<li><a style="font-size: 15px; text-align: right;"
									href="/car/account/login.action">LogIn</a></li>&nbsp&nbsp
					
					</c:when>
					<c:otherwise>
											 
							<li><a style="font-size: 15px; text-align: right;"
								href="/car/account/logout.action">LogOut</a></li>
						
					</c:otherwise>
				</c:choose>                                        
                                   
                                    
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    
    
    <script type="text/javascript"
      src="/car/resources/js/jquery-1.10.2.min.js"></script>
   <script src="/car/resources/js/bootstrap.min.js"></script>
   <script src="/car/resources/js/jquery.easing.1.3.js"></script>
   <script src="/car/resources/js/retina-1.1.0.min.js"></script>
   <script type="text/javascript" src="/car/resources/js/jquery.cookie.js"></script>
   <!-- jQuery cookie -->

   <script src="/car/resources/js/jquery.fractionslider.js"
      type="text/javascript" charset="utf-8"></script>
   <script type="text/javascript"
      src="/car/resources/js/jquery.smartmenus.min.js"></script>
   <script type="text/javascript"
      src="/car/resources/js/jquery.smartmenus.bootstrap.min.js"></script>
   <script type="text/javascript"
      src="/car/resources/js/owl.carousel.min.js"></script>
   <script type="text/javascript" src="/car/resources/js/jflickrfeed.js"></script>
   <script type="text/javascript"
      src="/car/resources/js/jquery.magnific-popup.min.js"></script>
   <script type="text/javascript"
      src="/car/resources/js/jquery.isotope.min.js"></script>
   <script type="text/javascript"
      src="/car/resources/js/jquery.easypiechart.min.js"></script>
   <script type="text/javascript" src="/car/resources/js/swipe.js"></script>
   <script type="text/javascript"
      src="/car/resources/js/jquery-hoverdirection.min.js"></script>
   <script type="text/javascript"
      src="/car/resources/js/jquery.matchHeight-min.js"></script>
   <script type="text/javascript"
      src="/car/resources/js/jquery-scrolltofixed-min.js"></script>

   <script src="/car/resources/js/main.js"></script>

   <!-- Start Style Switcher -->
   <div class="switcher"></div>
   <!-- End Style Switcher -->

   <script>
      /*Portfolio*/
      (function($) {
         "use strict";
         var $container = $('.portfolio'), $items = $container
               .find('.portfolio-item'), portfolioLayout = 'fitRows';

         if ($container.hasClass('portfolio-centered')) {
            portfolioLayout = 'masonry';
         }

         $container.isotope({
            filter : '*',
            animationEngine : 'best-available',
            layoutMode : portfolioLayout,
            animationOptions : {
               duration : 750,
               easing : 'linear',
               queue : false
            },
            masonry : {}
         }, refreshWaypoints());

         function refreshWaypoints() {
            setTimeout(function() {
            }, 1000);
         }

         $('ul#filter li').on('click', function() {
            var selector = $(this).attr('data-filter');
            $container.isotope({
               filter : selector
            }, refreshWaypoints());
            $('ul#filter li').removeClass('selected');
            $(this).addClass('selected');
            return false;
         });

         function getColumnNumber() {
            var winWidth = $(window).width(), columnNumber = 1;

            if (winWidth > 1200) {
               columnNumber = 5;
            } else if (winWidth > 950) {
               columnNumber = 4;
            } else if (winWidth > 600) {
               columnNumber = 3;
            } else if (winWidth > 400) {
               columnNumber = 2;
            } else if (winWidth > 250) {
               columnNumber = 1;
            }
            return columnNumber;
         }

         function setColumns() {
            var winWidth = $(window).width(), columnNumber = getColumnNumber(), itemWidth = Math
                  .floor(winWidth / columnNumber);

            $container.find('.portfolio-item').each(function() {
               $(this).css({
                  width : itemWidth + 'px'
               });
            });
         }

         function setPortfolio() {
            setColumns();
            $container.isotope('reLayout');
         }

         $container.imagesLoaded(function() {
            setPortfolio();
         });

         $(window).on('resize', function() {
            setPortfolio();
         });
      })(jQuery);
   </script>

   <!-- WARNING: Wow.js doesn't work in IE 9 or less -->
   <!--[if gte IE 9 | !IE ]><!-->
   <script type="text/javascript" src="/car/resources/js/wow.min.js"></script>
   <script>
      // WOW Animation
      new WOW().init();
   </script>
   <![endif]-->
