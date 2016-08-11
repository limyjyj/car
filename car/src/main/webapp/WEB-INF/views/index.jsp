<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>부르릉</title>
<link href="/car/resources/css/business-casual.css"
	rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
	<%-- <c:import url="/WEB-INF/views/include/header.jsp" /> --%>

	<div class="container">

		<div class="row">
			<div class="box">
				<div class="col-lg-12 text-center">
					<div id="carousel-example-generic" class="carousel slide">
						<!-- Indicators -->
						<ol class="carousel-indicators hidden-xs">
							<li data-target="#carousel-example-generic" data-slide-to="0"
								class="active"></li>
							<li data-target="#carousel-example-generic" data-slide-to="1"></li>
							<li data-target="#carousel-example-generic" data-slide-to="2"></li>
						</ol>

						<!-- Wrapper for slides -->
						<div class="carousel-inner">
							<div class="item active">
								<img class="img-responsive img-full"
									src="/mysbl-spring/resources/img/slide-1.jpg" alt="">
							</div>
							<div class="item">
								<img class="img-responsive img-full"
									src="/mysbl-spring/resources/img/slide-2.jpg" alt="">
							</div>
							<div class="item">
								<img class="img-responsive img-full"
									src="/mysbl-spring/resources/img/slide-3.jpg" alt="">
							</div>
						</div>

						<!-- Controls -->
						<a class="left carousel-control" href="#carousel-example-generic"
							data-slide="prev"> <span class="icon-prev"></span>
						</a> <a class="right carousel-control"
							href="#carousel-example-generic" data-slide="next"> <span
							class="icon-next"></span>
						</a>
					</div>
					<h2 class="brand-before">
						<small>Welcome to</small>
					</h2>
					<h1 class="brand-name">BBARABAM</h1>
					<hr class="tagline-divider">
					<h2>
						<small> <strong>ErrandCenter</strong>
						</small>
					</h2>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="box">
				<div class="col-lg-12">
					<hr>
					<h2 class="intro-text text-center">
						 Beautiful services <strong>to help your errand</strong>
					</h2>
					<hr>
					<img class="img-responsive img-border img-left"
						src="/mysbl-spring/resources/img/intro-pic.jpg" alt="">
					<hr class="visible-xs">
					
					<p>HAPPY LIFE TIME SAVING RELIABLE DELIVERY</p>
					<br>
					<p>
						행복한 시간을 배달해드립니다.
					</p><br>
					<p> 저희 빠라밤은 고객님의 생활 편의를 위해 365일 항시 대기중입니다.</p>
					<br>
					<p> 귀찮은 일, 급한 일, 혼자선 힘든 일,</p><br>
					<p> 먹고 싶은데 사다 주는 이 없어 못 먹는 서러움,</p><br>
					<p>무엇이든 빠라밤에게 맡겨만 주세요!</p>
					<br>
					<p> 언제나 고객님을 생각하는 빠라밤이 되도록 노력하겠습니다.</p>
					<br>
					<p> 감사합니다. 빠라바라빠라밤~★</p>
					
				</div>
			</div>
		</div>

		<div class="row">
			<div class="box">
				<div class="col-lg-12">
					<hr>
					<h2 class="intro-text text-center">
						Beautiful services <strong>to help your errand</strong>
					</h2>
					<hr>
					<p>Use as many boxes as you like, and put anything you want in
						them! They are great for just about anything, the sky's the limit!</p>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
						Nunc placerat diam quis nisl vestibulum dignissim. In hac
						habitasse platea dictumst. Interdum et malesuada fames ac ante
						ipsum primis in faucibus. Pellentesque habitant morbi tristique
						senectus et netus et malesuada fames ac turpis egestas.</p>
				</div>
			</div>
		</div>
		
		 <div class="row">
            <div class="box">
                <div class="col-lg-12">
                    <hr>
                    <h2 class="intro-text text-center">Our
                        <strong>Team</strong>
                    </h2>
                    <hr>
                </div>
                <div class="col-sm-4 text-center" >
                    <img class="img-responsive" src="/mysbl-spring/resources/img/연주.png" >
                    <h4>YEONJU LIM<br />
                    <small>"친절한 상담 도와드리겠습니다."</small></h4>
                </div>
                <div class="col-sm-4 text-center" >
                    <img class="img-responsive" src="/mysbl-spring/resources/img/상묵.jpg" >
                    <h4>SANGMOOK LEE<br />
                    <small>"언제든지 준비 되어 있습니다!"</small></h4>
                    
                </div>
                <div class="col-sm-4 text-center" >
                    <img class="img-responsive" src="/mysbl-spring/resources/img/주현.jpg" >
                    <h4>JUHYEON PARK<br />
                    <small>"최고의 서비스로 보답하겠습니다."</small></h4>
                </div>
                <div class="col-sm-4 text-center" >
                    <img class="img-responsive" src="/mysbl-spring/resources/img/정훈.jpg" >
                    <h4>JUNGHOON KIM<br />
                    <small>"신속, 정확, 친절!"</small></h4>
                </div>
                <div class="col-sm-4 text-center" >
                    <img class="img-responsive" src="/mysbl-spring/resources/img/승훈.jpg" >
                    <h4>SEUNGHOON YU<br />
                    <small>"갑니다~~~~!"</small></h4>
                </div>
                <div class="col-sm-4 text-center" >
                    <img class="img-responsive" src="/mysbl-spring/resources/img/투훈.jpg" >
                    <h4>TOOHOON<br />
                    <small>"밝은 미소로 고객님을 뵙겠습니다^^"</small></h4>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>

	</div>
	<!-- /.container -->

	<footer>
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<p>Copyright &copy; BBARABAM 2016</p>
					<div class="address-bar">Help Service | ItWill, 15 |
		010.4615.2770</div>
				</div>
			</div>
		</div>
	</footer>

	

	<!-- Script to Activate the Carousel -->
	<script>
		$('.carousel').carousel({
			interval : 5000
		//changes the speed
		})
	</script>

</body>

</html>
