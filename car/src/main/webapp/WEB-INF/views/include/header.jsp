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
                                            <li ><a href="/car/reservation/list.action#targetb">카풀신청</a></li>
                                                                                    
                                           
                                                                                    
                                        </ul>
                                    </li>

                                    <li><a href="#">차계부</a>
                                        <ul class="dropdown-menu">
                                            <li><a href="/car/car/list.action">홈</a></li>
                                            <li><a href="/car/carhistory/list.action">내역</a></li>
                                            <li><a href="columns.html">그래프</a></li>
                                        </ul>
                                    </li>

                                    <li><a href="/car/board/list.action" >게시판</a>
                                        <ul class="dropdown-menu">
                                            <li><a href="services.html">공지사항</a></li>
                                            <li><a href="faq.html">후기</a></li>
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
                                    
                                    <li><a href="#"></a>
                                    </li>
                                    
                                    <li><a href="/car/account/login.action">로그인</a>                                        
                                    </li>
                                    
                                    
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    
    