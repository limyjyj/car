<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" class="no-js" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html class="no-js" lang="en">
<!--<![endif]-->
<head>
<jsp:include page="/WEB-INF/views/include/head.jsp" />
</head>
<body class="home">
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<section class="wrapper">
		<div class="slider-wrapper">
			<div class="slider">
				<div class="fs_loader"></div>
				<div class="slide">
					<img src="/car/resources/images/fraction-slider/base_3.jpg"
						width="1920" height="auto" data-in="fade" data-out="fade" /> <img
						src="/car/resources/images/fraction-slider/slider-boy.png"
						width="550" height="450" data-position="30,1100" data-in="left"
						data-out="right" data-delay="700" />

					<p class="slide-1" data-position="50,610" data-in="fade"
						data-out="fade" data-delay="800">국내 1위 서비스 '가치가'</p>
					<p class="slide-1" data-position="100,500" data-in="fade"
						data-out="fade" data-delay="1200">즐거운 카풀! 행복한 카풀!</p>
					<p class="slide-1" data-position="150,400" data-in="fade"
						data-out="fade" data-delay="1600">부담도 덜고 편안하게 이동하세요.</p>

					<p class="slide-1a" data-position="220,660" data-in="bottom"
						data-out="bottom" data-delay="2000" data-ease-in="easeOutBounce">'가치가'는 언제 어디서나 이용가능합니다.</p>
					<p class="slide-1a" data-position="267,698" data-in="bottom"
						data-out="bottom" data-delay="3200" data-ease-in="easeOutBounce">'가치가'에는 국내최대 카풀정보가 있습니다.</p>
					<p class="slide-1a" data-position="314,760" data-in="bottom"
						data-out="bottom" data-delay="4200" data-ease-in="easeOutBounce">'가치가'는 믿을 수 있습니다.</p>
					<!-- <p class="slide-1a" data-position="361,753" data-in="bottom"
						data-out="bottom" data-delay="5200" data-ease-in="easeOutBounce"></p> -->
				</div>

				<div class="slide">
					<img src="/car/resources/images/fraction-slider/base_2.jpg"
						width="1920" height="auto" data-in="fade" data-out="fade" /> <img
						src="/car/resources/images/fraction-slider/slider-girl.png"
						width="600" height="450" data-position="20,400" data-in="right"
						data-0ut="bottom" data-delay="500" />

					<p class="slide-2 " data-position="120,900" data-in="bottom"
						data-out="top" data-delay="2000">이제는 카풀 하세요!</p>
					<p class="slide-2a " data-position="210,900" data-in="left"
						data-out="right" data-delay="3000">경제적 부담 Down!</p>
					<p class="slide-2b " data-position="270,900" data-in="top"
						data-out="bottom" data-delay="4000" data-ease-in="easeOutBounce">
						안전하고 신뢰를 우선으로 생각하는 가치가!</p>
				</div>
			</div>
		</div>
</section>
		<div class="container">
		<div style="height: 600px; padding-top: 70px; padding-bottom: 30px; margin: auto;">
		
			<div style="width: 250px; float :left">		
			<img src="/car/resources/images/돈.jpg" >		
				<h1 style="text-align: center;">차량 제공 & 검색</h1>
				<p style="text-align: center;">긴 출퇴근 시간이 지루하세요?</p>
				<p style="text-align: center;">카풀 제공 시 운전자는 운전 경로,</p>
				<p style="text-align: center;">날짜/시간 및 좌석 당 가격을 설정해 조건에 </p>
				<p style="text-align: center;">해당되는 탑승자와 연결될 수 있습니다. </p>
			</div>
			<div style="width: 170px; float: left">&nbsp;</div>
			<div style="width: 250px; float :left">
			<img src="/car/resources/images/폰차.jpg" >		
				<h1 style="text-align: center;">비용 부담</h1>
				<p style="text-align: center;">주행 요금은 차량 이용 후 실제 주행거리에 </p>
				<p style="text-align: center;">따라 부과됩니다. 가치가는 회원들의</p>
				<p style="text-align: center;">금전적 기여가 영리적인 목적이 아닌 </p>
				<p style="text-align: center;">벌충하는 데에 이용됩니다.</p>
			</div>
			<div style="width: 170px; float: left">&nbsp;</div>
			<div style="width: 250px; float :left">
			<img src="/car/resources/images/신뢰.jpg">		
				<h1 style="text-align: center;">신뢰와 안전</h1>
				<p style="text-align: center;">확실한 차량 공유가 가치가의 특징입니다. </p>
				<p style="text-align: center;">가치가의 서비스 및 회원 운영은  </p>
				<p style="text-align: center;">인증된 프로필로 안전을 보장합니다.</p>
			</div>
		</div>
		</div>

		<div class="grey_bg pdt-70">
			<div class="container">
				<div class="row">
					<div class="col-sm-5 feature-block" >
						<img class="img-responsive center-block"
							src="/car/resources/images/laptop.png" />
					</div>

					<div class="feature-block col-sm-7">
						<h4>
							가치가, 행복한 카풀 <span>함께 하는 카풀 서비스</span>
						</h4>
						<p>'가치가'는 고객들로 하여금 빠르고 안전하게 카풀을 찾을 수 있도록 하는
						도시 간 통근 차량 매칭 시스템 서비스를 제공하고 있습니다.
						서비스 이용객은 목적지와 여행 경로뿐만 아니라 성별, 일정 및 환경 설정에 따라 매치됩니다.
						'가치가'는 높은 연료 비용과 톨게이트 통행료 등에 따른 교통 비용을 절감하고 
						또한 불필요한 차량 운행을 줄여 운전자들로 하여금 스트레스를 줄이고 환경 보호 측면에도 도움을 제공합니다.
						'가치가' 이용 회원들은 통근 시간을 기록하고, 포인트를 쌓고, 콘테스트에 참여해 상을 받을 수 있습니다.
						'가치가'에 등록하여 나에게 가장 적합한 옵션을 찾아 보세요. 누구나 쉽고 간단하게 시작할 수 있습니다.
						회원 가입을 클릭하여 '가치가'에 지금 바로 등록하세요.</p>
						<a class="btn btn-default mrgb-20" href="">회원 가입</a>
					</div>
				</div>
			</div>
		</div>
		<!-- <div class="container-fluid grey-transparent-content">
			<div class="row">
				<div class="col-md-8 same-height sub_content clearfix">
					<div class="col-sm-6">
						<div class="serviceBox_1">
							<div class="service-icon">
								<i class="fa fa-pencil"></i>
							</div>
							<div class="service-content">
								<h3>Clean &amp; Minimal</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
									Pellentesque a feugiat ligula, in efficitur ligula. Duis
									interdum velit orci, tempor facilisis magna.</p>
							</div>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="serviceBox_1">
							<div class="service-icon">
								<i class="fa fa-diamond"></i>
							</div>
							<div class="service-content">
								<h3>Branding Theme</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
									Pellentesque a feugiat ligula, in efficitur ligula. Duis
									interdum velit orci, tempor facilisis magna.</p>
							</div>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="serviceBox_1">
							<div class="service-icon">
								<i class="fa fa-anchor"></i>
							</div>
							<div class="service-content">
								<h3>Modern Design</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
									Pellentesque a feugiat ligula, in efficitur ligula. Duis
									interdum velit orci, tempor facilisis magna.</p>
							</div>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="serviceBox_1">
							<div class="service-icon">
								<i class="fa fa-gears"></i>
							</div>
							<div class="service-content">
								<h3>Quick Support</h3>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
									Pellentesque a feugiat ligula, in efficitur ligula. Duis
									interdum velit orci, tempor facilisis magna.</p>
							</div>
						</div>
					</div>
				</div>
				<div
					class="col-md-4 same-height hidden-sm hidden-xs text-center retro">
					<div class="heading-item">
						<h4>Ullam Corporis Suscipit</h4>
						<p>
							Nemo enim ipsam voluptatem quia voluptas sit aspernatur<br>
							aut odit aut fugit, sed quia consequuntur
						</p>
						<a class="btn btn-default btn-lg" href="">Get a free Quote</a> <em>or
							give us call <strong> +23-4321-12323 </strong>
						</em>
					</div>
				</div>
			</div>
		</div>
 -->
		<!-- <section class="feature-block">
			<div class="container">
				<div class="row super_sub_content">
					<div class="col-lg-6 wow fadeInLeft">
						<div class="text-center">
							<img src="/car/resources/images/mobile-1.png" alt="" />
						</div>
					</div>

					<div class="col-lg-6 fadeInRight">
						<h4>Responsive Designs</h4>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Beatae cum dolore fugit impedit nisi, quasi saepe temporibus
							velit! Debitis, nihil velit? A accusantium adipisci aliquam amet
							aperiam aut consequuntur dolore ducimus eaque eius est eveniet
							fugiat maxime molestias natus necessitatibus quae sapiente
							suscipit tenetur veniam vero, voluptate voluptatum! At, quia!</p>
						<hr>
						<i class="fa fa-apple"></i> <i class="fa fa-windows"></i> <i
							class="fa fa-clock-o"></i> <i class="fa fa-android"></i> <i
							class="fa fa-paperclip"></i> <i class="fa fa-skype"></i>
						<hr>
						<a href="" class="btn btn-default btn-md">Read more</a>&nbsp; <a
							href="" class="btn btn-default btn-md">Purchase Now</a>
					</div>
				</div>
			</div>
		</section> -->
		<!-- <div class="grey_bg">
			<div class="container">
				<div class="row sub_content">
					<div class="col-lg-3 col-md-4 col-sm-6 text-center">
						<span class="circular-chart-big" data-percent="94"> <span
							class="percent"></span>
						</span>
						<h5 class="circular-title">WebDesign</h5>
					</div>
					<div class="col-lg-3 col-md-4 col-sm-6 text-center">
						<span class="circular-chart-big" data-percent="87"> <span
							class="percent"></span>
						</span>
						<h5 class="circular-title">Graphic Design</h5>
					</div>
					<div class="col-lg-3 col-md-4 col-sm-6 text-center">
						<span class="circular-chart-big" data-percent="77"> <span
							class="percent"></span>
						</span>
						<h5 class="circular-title">Mobile Applications</h5>
					</div>
					<div class="col-lg-3 col-md-4 col-sm-6 text-center">
						<span class="circular-chart-big" data-percent="82"> <span
							class="percent"></span>
						</span>
						<h5 class="circular-title">Search Engine Optimization</h5>
					</div>
				</div>
			</div>
		</div>

		<div class="progress-bar-acc">
			<div class="container">
				<div class="row super_sub_content">
					<div class="col-lg-6 ">
						<ul class="progress-skill-bar mrg-0">
							<li><span class="lable">70%</span>
								<div class="progress_skill">
									<div data-height="100" role="progressbar" data-value="70"
										class="bar" style="width: 0px; height: 0px;">HTML</div>
								</div></li>
							<li><span class="lable">80%</span>
								<div class="progress_skill">
									<div data-height="100" role="progressbar" data-value="80"
										class="bar" style="width: 0px; height: 0px;">CSS</div>
								</div></li>
							<li><span class="lable">90%</span>
								<div class="progress_skill">
									<div data-height="100" role="progressbar" data-value="90"
										class="bar" style="width: 0px; height: 0px;">JavaScript
									</div>
								</div></li>
							<li><span class="lable">80%</span>
								<div class="progress_skill">
									<div data-height="100" role="progressbar" data-value="80"
										class="bar" style="width: 0px; height: 0px;">MySQL</div>
								</div></li>
							<li><span class="lable">70%</span>
								<div class="progress_skill">
									<div data-height="100" role="progressbar" data-value="70"
										class="bar" style="width: 0px; height: 0px;">PHP</div>
								</div></li>
						</ul>
					</div>
					<div class="col-lg-6">
						<div class="panel-group" id="accordion" role="tablist"
							aria-multiselectable="true">
							<div class="panel panel-default">
								<div class="panel-heading button_outer_rounded" role="tab"
									id="heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordion"
											href="#collapse" aria-expanded="true"
											aria-controls="collapseOne"> Stunning Design & Countless
											Options </a>
									</h4>
								</div>
								<div id="collapse" class="panel-collapse collapse in"
									role="tabpanel" aria-labelledby="heading">
									<div class="panel-body">Lorem ipsum dolor sit amet,
										consectetur adipiscing elit. Phasellus congue lorem ut augue
										aliquam, ut rutrum nulla eleifend. Nunc aliquam suscipit leo,
										in mattis massa ullamcorper sed. Pellentesque dictum erat at
										eros egestas, vel convallis nibh pharetra. Class aptent taciti
										sociosqu ad litora torquent.</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading button_outer_rounded" role="tab"
									id="heading1">
									<h4 class="panel-title">
										<a class="collapsed" data-toggle="collapse"
											data-parent="#accordion" href="#collapse1"
											aria-expanded="false" aria-controls="collapseTwo"> Tons
											of customization options </a>
									</h4>
								</div>
								<div id="collapse1" class="panel-collapse collapse"
									role="tabpanel" aria-labelledby="heading1">
									<div class="panel-body">Lorem ipsum dolor sit amet,
										consectetur adipiscing elit. Phasellus congue lorem ut augue
										aliquam, ut rutrum nulla eleifend. Nunc aliquam suscipit leo,
										in mattis massa ullamcorper sed. Pellentesque dictum erat at
										eros egestas, vel convallis nibh pharetra. Class aptent taciti
										sociosqu ad litora torquent.</div>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading button_outer_rounded" role="tab"
									id="heading2">
									<h4 class="panel-title">
										<a class="collapsed" data-toggle="collapse"
											data-parent="#accordion" href="#collapse2"
											aria-expanded="false" aria-controls="collapseThree"> Ease
											of Content creation and modification </a>
									</h4>
								</div>
								<div id="collapse2" class="panel-collapse collapse"
									role="tabpanel" aria-labelledby="heading2">
									<div class="panel-body">Lorem ipsum dolor sit amet,
										consectetur adipiscing elit. Phasellus congue lorem ut augue
										aliquam, ut rutrum nulla eleifend. Nunc aliquam suscipit leo,
										in mattis massa ullamcorper sed. Pellentesque dictum erat at
										eros egestas, vel convallis nibh pharetra. Class aptent taciti
										sociosqu ad litora torquent.</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div> -->

		<!-- <section class="parallax parallax-1">
			<div class="container">
				<div class="row">
					<div id="parallax-testimonial-carousel"
						class="parallax-testimonial carousel wow fadeInUp">
						<div class="carousel-inner">
							<div class="active item">
								<div class="parallax-testimonial-item">
									<blockquote>
										<p>Donec convallis, metus nec tempus aliquet, nunc metus
											adipiscing leo, a lobortis nisi dui ut odio. Nullam ultrices,
											eros accumsan vulputate faucibus, turpis tortor dictum.</p>
									</blockquote>
									<p>
										<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i>
									</p>
									<div class="parallax-testimonial-review">
										<img src="/car/resources/images/testimonials/1.png"
											alt="testimonial"> <span>Jonathan Dower</span> <small>Company
											Inc.</small>
									</div>
								</div>
							</div>

							<div class="item">
								<div class="parallax-testimonial-item">
									<blockquote>
										<p>Metus aliquet tincidunt metus, sit amet mattis lectus
											sodales ac. Suspendisse rhoncus dictum eros, ut egestas eros
											luctus eget. Nam nibh sem, mattis et feugiat ut, porttitor
											nec risus.</p>
									</blockquote>
									<p>
										<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i>
									</p>
									<div class="parallax-testimonial-review">
										<img src="/car/resources/images/testimonials/2.png"
											alt="testimonial"> <span>Jonathan Dower</span> <small>Leopard</small>
									</div>
								</div>
							</div>

							<div class="item">
								<div class="parallax-testimonial-item">
									<blockquote>
										<p>Nunc aliquet tincidunt metus, sit amet mattis lectus
											sodales ac. Suspendisse rhoncus dictum eros, ut egestas eros
											luctus eget. Nam nibh sem, mattis et feugiat ut, porttitor
											nec risus.</p>
									</blockquote>
									<p>
										<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i>
									</p>
									<div class="parallax-testimonial-review">
										<img src="/car/resources/images/testimonials/3.png"
											alt="testimonial"> <span>Jonathan Dower</span> <small>Leopard</small>
									</div>
								</div>
							</div>
						</div>
						<ol class="carousel-indicators">
							<li data-slide-to="0"
								data-target="#parallax-testimonial-carousel" class=""></li>
							<li data-slide-to="1"
								data-target="#parallax-testimonial-carousel" class="active"></li>
							<li data-slide-to="2"
								data-target="#parallax-testimonial-carousel" class=""></li>
						</ol>
					</div>
				</div>
			</div>
		</section>
 -->
		<!-- <section class="super_sub_content">
			<div class="dividerHeading text-center">
				<h4>
					<span>RECENT PORTFOLIO ITEMS</span>
				</h4>
			</div>

			<nav class="clearfix">
				<ul id="filter">
					<li data-filter="*" class="selected"><a href="#">All Works</a></li>
					<li data-filter=".mockups"><a href="#">Mockups</a></li>
					<li data-filter=".graphic-design"><a href="#">Graphics</a></li>
					<li data-filter=".web-design"><a href="#">Web Projects</a></li>
					<li data-filter=".flayers"><a href="#">Flayers</a></li>
				</ul>
			</nav>

			<div class="portfolio-centered">
				<div class="recentitems portfolio">

					<div class="portfolio-item mockups">
						<div class="box">
							<img src="/car/resources/images/portfolio/portfolio_1.png" alt="">
							<div class="option inner">
								<div>
									<h5>A Graphic Design Item</h5>
									<a href="images/portfolio/full/portfolio_3.png"
										class="fa fa-search mfp-image"></a> <a
										href="portfolio_single.html" class="fa fa-link"></a>
								</div>
							</div>
						</div>
						box
					</div>

					<div class="portfolio-item web-design graphic-design">
						<div class="box">
							<img src="/car/resources/images/portfolio/portfolio_2.png" alt="">
							<div class="option inner">
								<div>
									<h5>New Flayer Design Item</h5>
									<a href="images/portfolio/full/portfolio_3.png"
										class="fa fa-search mfp-image"></a> <a
										href="portfolio_single.html" class="fa fa-link"></a>
								</div>
							</div>
						</div>
						box
					</div>

					<div class="portfolio-item graphic-design">
						<div class="box">
							<img src="/car/resources/images/portfolio/portfolio_3.png" alt="">
							<div class="option inner">
								<div>
									<h5>Gray and Pink</h5>
									<a href="images/portfolio/full/portfolio_3.png"
										class="fa fa-search mfp-image"></a> <a
										href="portfolio_single.html" class="fa fa-link"></a>
								</div>
							</div>
						</div>
						box
					</div>

					<div class="portfolio-item mockups">
						<div class="box">
							<img src="/car/resources/images/portfolio/portfolio_4.png" alt="">
							<div class="option inner">
								<div>
									<h5>Amazing Keyboard Desin</h5>
									<a href="images/portfolio/full/portfolio_3.png"
										class="fa fa-search mfp-image"></a> <a
										href="portfolio_single.html" class="fa fa-link"></a>
								</div>
							</div>
						</div>
						box
					</div>

					<div class="portfolio-item flayers">
						<div class="box">
							<img src="/car/resources/images/portfolio/portfolio_5.png" alt="">
							<div class="option inner">
								<div>
									<h5>Our Favorite Colors</h5>
									<a href="images/portfolio/full/portfolio_3.png"
										class="fa fa-search mfp-image"></a> <a
										href="portfolio_single.html" class="fa fa-link"></a>
								</div>
							</div>
						</div>
						box
					</div>

					<div class="portfolio-item flayers">
						<div class="box">
							<img src="/car/resources/images/portfolio/portfolio_6.png" alt="">
							<div class="option inner">
								<div>
									<h5>Not War Make Design</h5>
									<a href="images/portfolio/full/portfolio_3.png"
										class="fa fa-search mfp-image"></a> <a
										href="portfolio_single.html" class="fa fa-link"></a>
								</div>
							</div>
						</div>
						box
					</div>

					<div class="portfolio-item graphic-design mockups">
						<div class="box">
							<img src="/car/resources/images/portfolio/portfolio_7.png" alt="">
							<div class="option inner">
								<div>
									<h5>A GREAT MOCK-UPS</h5>
									<a href="images/portfolio/full/portfolio_5.png"
										class="fa fa-search mfp-image"></a> <a
										href="portfolio_single.html" class="fa fa-link"></a>
								</div>
							</div>
						</div>
						box
					</div>

					<div class="portfolio-item web-design mockups">
						<div class="box">
							<img src="/car/resources/images/portfolio/portfolio_8.png" alt="">
							<div class="option inner">
								<div>
									<h5>Missis Of 2014</h5>
									<a href="images/portfolio/full/portfolio_4.png"
										class="fa fa-search mfp-image"></a> <a
										href="portfolio_single.html" class="fa fa-link"></a>
								</div>
							</div>
						</div>
						box
					</div>

					<div class="portfolio-item web-design mockups">
						<div class="box">
							<img src="/car/resources/images/portfolio/portfolio_9.png" alt="">
							<div class="option inner">
								<div>
									<h5>Light Carpet</h5>
									<a href="images/portfolio/full/portfolio_1.png"
										class="fa fa-search mfp-image"></a> <a
										href="portfolio_single.html" class="fa fa-link"></a>
								</div>
							</div>
						</div>
						box
					</div>

					<div class="portfolio-item web-design mockups">
						<div class="box">
							<img src="/car/resources/images/portfolio/portfolio_10.png"
								alt="">
							<div class="option inner">
								<div>
									<h5>Business Card Mock-Up</h5>
									<a href="images/portfolio/full/portfolio_8.png"
										class="fa fa-search mfp-image"></a> <a
										href="portfolio_single.html" class="fa fa-link"></a>
								</div>
							</div>
						</div>
						box
					</div>

				</div>
				portfolio
			</div>
			portfolio container
		</section> -->

		<!-- <div class="grey-content">
			<div class="container-fluid">
				<div class="row">
					<div
						class="col-md-5 col-md-offset-1 super_sub_content clearfix same-height">
						<div class="col-sm-6">
							<div class="serviceBox_1">
								<div class="service-icon">
									<i class="fa fa-pencil"></i>
								</div>
								<div class="service-content">
									<h3>Clean &amp; Minimal</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
										Nam nec euismod dui. Mauris risus dolor, vulputate at placerat
										vitae, rutrum vel.</p>
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="serviceBox_1">
								<div class="service-icon">
									<i class="fa fa-diamond"></i>
								</div>
								<div class="service-content">
									<h3>Branding Theme</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
										Nam nec euismod dui. Mauris risus dolor, vulputate at placerat
										vitae, rutrum vel.</p>
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="serviceBox_1">
								<div class="service-icon">
									<i class="fa fa-anchor"></i>
								</div>
								<div class="service-content">
									<h3>Modern Design</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
										Nam nec euismod dui. Mauris risus dolor, vulputate at placerat
										vitae, rutrum vel.</p>
								</div>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="serviceBox_1">
								<div class="service-icon">
									<i class="fa fa-gears"></i>
								</div>
								<div class="service-content">
									<h3>Quick Support</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
										Nam nec euismod dui. Mauris risus dolor, vulputate at placerat
										vitae, rutrum vel.</p>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-6 inner-image same-height hidden-sm hidden-xs "
						style="background: url('images/awesome.png') no-repeat;"></div>
				</div>
			</div>
		</div> -->

		<!-- <div class="super_sub_content">
			<div class="container">
				<div class="row">
					<div class="col-sm-7">
						<img class="img-responsive center-block"
							src="/car/resources/images/imac.png" />
					</div>
					<div class="feature-block col-sm-5">
						<h4>
							Mobile is the future,<span><br /> fully responsive &
								retina ready</span>
						</h4>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Aliquam earum enim est natus nulla odio perferendis totam. A
							eaque, consectetur adipisicing elit. Aliquam earum enim est natus
							nulla odio consectetur adipisicing elit. Aliquam earum enim est
							natus nulla odio nesciunt. Autem cum distinctio eligendi impedit
							mollitia officia perferendis praesentium tempore veniam voluptas.
							Assumenda fuga laboriosam modi perspiciatis possimus rem
							suscipit. Adipisci, eos exercitationem molestiae nesciunt quaerat
							ullam veniam vitae voluptatum.</p>
						<a class="btn btn-default" href="">Read More</a>
					</div>
				</div>
			</div>
		</div> -->

		<!-- <div class="grey-line-content">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-6 col-sm-12 sub_content same-height">
						<div class="col-sm-12">
							<div class="serviceBox_1">
								<div class="service-icon">
									<i class="fa fa-pencil"></i>
								</div>
								<div class="service-content">
									<h3>Clean &amp; Minimal</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
										Aliquam malesuada in enim vulputate ullamcorper. Nam semper,
										nibh at porta fermentum, sem felis.</p>
								</div>
							</div>
						</div>
						<div class="col-sm-12">
							<div class="serviceBox_1">
								<div class="service-icon">
									<i class="fa fa-anchor"></i>
								</div>
								<div class="service-content">
									<h3>Branding Theme</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
										Aliquam malesuada in enim vulputate ullamcorper. Nam semper,
										nibh at porta fermentum, sem felis.</p>
								</div>
							</div>
						</div>
						<div class="col-sm-12">
							<div class="serviceBox_1">
								<div class="service-icon">
									<i class="fa fa-gears"></i>
								</div>
								<div class="service-content">
									<h3>Modern Design</h3>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
										Aliquam malesuada in enim vulputate ullamcorper. Nam semper,
										nibh at porta fermentum, sem felis.</p>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-6 inner-image hidden-sm hidden-xs same-height"
						style="background: url('images/slide-1.png') no-repeat;"></div>
				</div>
			</div>
		</div>
 -->
		<!-- <div class="feature-block pdt-50">
			<div class="container">
				<div class="row">
					<div class="col-md-7 text-center">
						<img class="" src="/car/resources/images/awesome-img.png" />
					</div>
					<div class="col-md-5">
						<h4>
							Professional,<span><br />business solution & consulting</span>
						</h4>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
							Praesent ut est accumsan, sollicitudin neque eget, sollicitudin
							ex. Quisque sit amet.</p>
						<a class="btn btn-default mrgb-20" href="">Read More</a>
					</div>
				</div>
			</div>
		</div> -->

		<!-- <div class="container-fluid">
			<div class="row">
				<div class="col-md-4">
					<div class="serviceBox_6 same-height">
						<div class="service-content">
							<h3>Clean& powerful code</h3>
							<span class="line"></span>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
								Maecenas luctus condimentum felis, sit amet placerat felis.
								Mauris porta lorem.</p>
							<a class="btn btn-default" href="">Read more <i
								class="fa fa-thumbs-up"></i></a>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="serviceBox_6 same-height purple">
						<div class="service-content">
							<h3>Incredibly Flexible</h3>
							<span class="line"></span>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
								Maecenas luctus condimentum felis, sit amet placerat felis.
								Mauris porta lorem.</p>
							<a class="btn btn-default" href="">Read more <i
								class="fa fa-thumbs-up"></i></a>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="serviceBox_6 same-height black">
						<div class="service-content">
							<h3>Quick Support</h3>
							<span class="line"></span>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
								Maecenas luctus condimentum felis, sit amet placerat felis.
								Mauris porta lorem.</p>
							<a class="btn btn-default" href="">Read more <i
								class="fa fa-thumbs-up"></i></a>
						</div>
					</div>

				</div>
			</div>
		</div> -->

		<!-- <div class="super_sub_content grey_bg">
			<div class="container">
				<div class="row">
					<div class="col-md-4 mrgt-70">
						<div class="serviceBox_7 right">
							<div class="service-icon">
								<i class="fa fa-headphones"></i>
							</div>
							<h3>SEO Ready</h3>
							<p>Drag more traffic to your website with our SEO Friendly
								theme: simply bank...</p>
						</div>

						<div class="serviceBox_7 right">
							<div class="service-icon">
								<i class="fa fa-tasks"></i>
							</div>
							<h3>Retina Ready</h3>
							<p>All our themes come with extensive HTML Documentation that
								teaches you how...</p>
						</div>
					</div>

					<div class="col-md-4">
						<img src="/car/resources/images/phones.png"
							class="img-responsive center-block">
					</div>

					<div class="col-md-4 mrgt-70">
						<div class="serviceBox_7">
							<div class="service-icon">
								<i class="fa fa-pencil"></i>
							</div>
							<h3>easy customizable</h3>
							<p>All our themes include advanced options which makes them
								super flexible for...</p>
						</div>
						<div class="serviceBox_7">
							<div class="service-icon">
								<i class="fa fa-gears"></i>
							</div>
							<h3>global features</h3>
							<p>We made sure images on your website would look stunning on
								any device. Our...</p>
						</div>
					</div>
				</div>
			</div>
		</div>
 -->
		<!--</div>-->

		<div class="container">
			<div class="row super_sub_content">
				<div class="col-md-12">
					<div class="dividerHeading">
						<h4>
							<span>Recent news</span>
						</h4>
					</div>

					<div id="post-slider" class="owl-carousel">
						<div class="post-slide">
							<div class="post-img">
								<img src="/car/resources/images/blog/blog_1.png">
							</div>
							<h5 class="post-title">
								<a href="blog-post.html">Latest News Post</a>
							</h5>
							<div class="post-date">
								<i class="fa fa-calendar"></i> April 23, 2015
							</div>
							<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
								Sed eleifend urna eu ...</p>
							<a class="readmore" href="">Read more</a>
						</div>
						<div class="post-slide">
							<div class="post-img">
								<img src="/car/resources/images/blog/blog_2.png">
							</div>
							<h5 class="post-title">
								<a href="blog-post.html">Latest News Post</a>
							</h5>
							<div class="post-date">
								<i class="fa fa-calendar"></i> April 23, 2015
							</div>
							<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
								Sed eleifend urna eu ...</p>
							<a class="readmore" href="">Read more</a>
						</div>
						<div class="post-slide">
							<div class="post-img">
								<img src="/car/resources/images/blog/blog_3.png">
							</div>
							<h5 class="post-title">
								<a href="blog-post.html">Latest News Post</a>
							</h5>
							<div class="post-date">
								<i class="fa fa-calendar"></i> April 23, 2015
							</div>
							<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
								Sed eleifend urna eu ...</p>
							<a class="readmore" href="">Read more</a>
						</div>
						<div class="post-slide">
							<div class="post-img">
								<img src="/car/resources/images/blog/blog-4.png">
							</div>
							<h5 class="post-title">
								<a href="blog-post.html">Latest News Post</a>
							</h5>
							<div class="post-date">
								<i class="fa fa-calendar"></i> April 23, 2015
							</div>
							<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
								Sed eleifend urna eu ...</p>
							<a class="readmore" href="">Read more</a>
						</div>
						<div class="post-slide">
							<div class="post-img">
								<img src="/car/resources/images/blog/blog_1.png">
							</div>
							<h5 class="post-title">
								<a href="blog-post.html">Latest News Post</a>
							</h5>
							<div class="post-date">
								<i class="fa fa-calendar"></i> April 23, 2015
							</div>
							<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
								Sed eleifend urna eu ...</p>
							<a class="readmore" href="">Read more</a>
						</div>
						<div class="post-slide">
							<div class="post-img">
								<img src="/car/resources/images/blog/blog_2.png">
							</div>
							<h5 class="post-title">
								<a href="blog-post.html">Latest News Post</a>
							</h5>
							<div class="post-date">
								<i class="fa fa-calendar"></i> April 23, 2015
							</div>
							<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
								Sed eleifend urna eu ...</p>
							<a class="readmore" href="">Read more</a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- <section class="promo_box wow bounceInUp" data-wow-offset="50">
			<div class="container">
				<div class="row">
					<div class="col-sm-9 col-md-9 col-lg-9">
						<div class="promo_content">
							<h3>Electrify is awesome responsive template, with clean
								design.</h3>
							<p>Lorem ipsum dolor sit amet, cons adipiscing elit. Aenean
								commodo ligula eget dolor.</p>
						</div>
					</div>
					<div class="col-sm-3 col-md-3 col-lg-3">
						<div class="pb_action">
							<a class="btn btn-lg btn-default" href="#fakelink"> <i
								class="fa fa-shopping-cart"></i> Download Now
							</a>
						</div>
					</div>
				</div>
			</div>
		</section>
	</section> -->

	<!--start footer-->
	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-md-3 col-lg-3" style="width: 390px; float :left">
					<div class="widget_title">
						<h4>
							<span>가치가</span>
						</h4>
					</div>
					<div class="widget_content">
						<p>대표이사 : 박주현 <br /> 
						사업자 등록번호 : 12-345-890908 <br />
						주소 : 서울 강남구 테헤란로 123 여삼빌딩 15층 <br />
						개인정보관리책임자 : 이상묵 <br />
						기술지원 : 권영규, 최영순 <br />
						CS : 김경주, 임연주 <br />
						업무시간 : 평일 오전 8시~오후 5시(주말,공휴일 휴무) <br />
						Copyright © 2016-2016 가치가. All Rights Reserved.</p>
					</div>
				</div>
				<div class="col-sm-6 col-md-3 col-lg-3" style="width: 390px; float :left">
					<div class="widget_title">
						<h4>
							<span>고객 만족</span>
						</h4>
					</div>
					<div class="widget_content">
						<p>가치가는 소망합니다. 럭시의 서비스가 여러분의 일상을 <br />
						조금이라도 더 행복하게 만들어 드릴 수 있기를..<br />
						그러기 위해 가치가는 계속 고민하고, 움직이며, <br />
						가치가만의 답을 만들어낼 것입니다.<br />
						이것이 가치가의 가장 큰 행복이고 비전입니다.</p>
						<ul class="contact-details-alt">
							<li><i class="fa fa-map-marker"></i>
								<p>
									<strong>Address</strong>: #2016 Yeosam
								</p></li>
							<li><i class="fa fa-user"></i>
								<p>
									<strong>Phone</strong>:(+82) 1234-5678
								</p></li>
							<li><i class="fa fa-envelope"></i>
								<p>
									<strong>Email</strong>: <a href="#">itwill@example.com</a>
								</p></li>
						</ul>
					</div>
				</div>
			
				<div class="col-sm-6 col-md-3 col-lg-3" style="width: 390px; float :left">
					<div class="widget_title">
						<h4>
							<span>Gallery</span>
						</h4>
					</div>
					<div class="widget_content">
						<div class="flickr">
							<ul id="flickrFeed" class="flickr-feed"></ul>
						</div>
					</div>
				</div>
			</div>
			</div>
		
	</footer>
	<!--end footer-->

	<section class="footer_bottom">
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<p class="copyright">
						&copy; Copyright 2016 Electrify | Powered by <a
							href="http://www.jqueryrain.com/">Together</a>
					</p>
				</div>

				<div class="col-sm-6 ">
					<div class="footer_social">
						<ul class="footbot_social">
							<li><a class="fb" href="#." data-placement="top"
								data-toggle="tooltip" title="Facebook"><i
									class="fa fa-facebook"></i></a></li>
							<li><a class="twtr" href="#." data-placement="top"
								data-toggle="tooltip" title="Twitter"><i
									class="fa fa-twitter"></i></a></li>
							<li><a class="dribbble" href="#." data-placement="top"
								data-toggle="tooltip" title="Dribbble"><i
									class="fa fa-dribbble"></i></a></li>
							<li><a class="skype" href="#." data-placement="top"
								data-toggle="tooltip" title="Skype"><i class="fa fa-skype"></i></a></li>
							<li><a class="rss" href="#." data-placement="top"
								data-toggle="tooltip" title="RSS"><i class="fa fa-rss"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>

</body>
</html>