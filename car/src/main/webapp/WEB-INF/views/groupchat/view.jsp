<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" class="no-js" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<!-- <html class="no-js" lang="en"> -->
<html ng-app="mwl.calendar.docs" class="no-js" lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org">
<!--<![endif]-->
  <head>
    <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.1/moment.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/interact.js/1.2.4/interact.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.5.8/angular.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.5.8/angular-animate.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/angular-ui-bootstrap/2.0.0/ui-bootstrap-tpls.min.js"></script>
    <script src="//cdn.rawgit.com/jkbrzt/rrule/v2.1.0/lib/rrule.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/angular-bootstrap-colorpicker/3.0.25/js/bootstrap-colorpicker-module.min.js"></script>
    <script src="//mattlewis92.github.io/angular-bootstrap-calendar/dist/js/angular-bootstrap-calendar-tpls.min.js"></script>
    <script src="/car/resources/js/example.js"></script>
    <script src="/car/resources/js/helpers.js"></script>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="//cdnjs.cloudflare.com/ajax/libs/angular-bootstrap-colorpicker/3.0.25/css/colorpicker.min.css" rel="stylesheet">
    <link href="//mattlewis92.github.io/angular-bootstrap-calendar/dist/css/angular-bootstrap-calendar.min.css" rel="stylesheet">
  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script type="text/javascript">

	function changeReadOnlyAttribute() {

		document.getElementById("title2").readOnly = false;
		document.getElementById("start-date2").readOnly = false;
		document.getElementById("end-date2").readOnly = false;
		document.getElementById("depart-time2").readOnly = false;
		document.getElementById("content2").readOnly = false;

		changeDisplay();

		document.getElementById("start-date2").type = 'date';
		document.getElementById("end-date2").type = 'date';
		document.getElementById("depart-time2").type = 'time';
	}

	function changeDateAndTimeType() {

		document.getElementById("start-date2").type = 'text';
		document.getElementById("end-date2").type = 'text';
		document.getElementById("depart-time2").type = 'text';

	}

	function changeDisplay() {

		changeDateAndTimeType();

		document.getElementById("intro-modify").style.display = "none";
		document.getElementById("modify").style.display = "";
		document.getElementById("return").style.display = "none";
		document.getElementById("cancle").style.display = "";
	}

	function reverseDisplay() {

		changeDateAndTimeType();

		document.getElementById("intro-modify").style.display = "";
		document.getElementById("modify").style.display = "none";
		document.getElementById("return").style.display = "";
		document.getElementById("cancle").style.display = "none";
	}

	//forAjax
	$(function() {
		
		//check for the existent schedule		

		//insert schedule  	
		$('#save').on('click', function(event) {
			
			
			var groupSchedule;
			
			groupSchedule = {
				"title" : $('#title1').val(),
				"startDate" : $('#start-date1').val(),
				"endDate" : $('#end-date1').val(),
				"departTime" : $('#depart-time1').val(),
				"content" : $('#content1').val()
			};

			/* groupSchedule = JSON.stringify(groupSchedule); */

			$.ajax({
				url : "/car/groupchat/insertgroupschedule.action?chatNo=" + $('#chatNo').val(),
				type : "post",
				data : groupSchedule,
				/* contentType: "application/json",  */
				success : function(data, status, xhr) {
					
					alert("저장했습니다.");
					//location.reload();

				},

				error : function(request, status, error) {
					alert("스케줄이 이미 존재하거나 입력을 정확히 하지 않았습니다.");
				}

			});

		});

		// view schedule 	
		$('#view-schedule').on('click',
			function(event) {

				$.ajax("/car/groupchat/view.action?chatNo=" + $('#chatNo').val(),{
				
					success : function(data) {
						
						eval("var groupSchedule = " + data);

						document.getElementById("title2").value = groupSchedule.title;
						document.getElementById("start-date2").value = groupSchedule.startDate;
						document.getElementById("end-date2").value = groupSchedule.endDate;
						document.getElementById("depart-time2").value = groupSchedule.departTime;
						document.getElementById("content2").value = groupSchedule.content;
						
						//location.reload();

					},

					error : function(request,
							status, error) {
						alert("작성된 스케줄이 없습니다. 작성하고 싶으시면 작성 버튼을 클릭해 주세요.");
					}

				});

			});

		// modify schedule  	
		$('#modify').on('click', function(event) {

			var groupSchedule;

			groupSchedule = {
				"title" : $('#title2').val(),
				"startDate" : $('#start-date2').val(),
				"endDate" : $('#end-date2').val(),
				"departTime" : $('#depart-time2').val(),
				"content" : $('#content2').val()
			};

			$.ajax({
				url : "/car/groupchat/update.action",
				type : "post",
				data : groupSchedule,

				success : function(data, status, xhr) {
					alert("수정 하였습니다.");

				},

				error : function(request, status, error) {
					alert("수정에 실패 하였습니다..");
				}

			});

		});

	});
</script>
 <jsp:include page="/WEB-INF/views/include/head.jsp" />
</head>
	
<body class="home">


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
                                    <li ><a href="/car/groupchat/longtermreservationlist.action">정기 예약 리스트</a></li>
                                    
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



	<div id="pageContainer" class="panel panel-heading"
		style="padding-top: 25px; text-align: center; margin: auto; width: 800px">


		<div style="padding-top: 25px; text-align: center">
			<div id="inputcontent">
				<div id="inputmain">


					<table class="table table-borderd"
						style="align: center; width: 700px">
						<tr>
							<td>
								<table class="table table-borderd"
									style="align: center; width: 700px">
									<th style="text-align: center">채팅</th>
									<tr>
										<td>
											
	<form id="joinChatForm" action="/car/mvc/chat" th:action="@{/mvc/chat}" data-bind="visible: activePollingXhr() == null">
		<p>
			<label for="user">User: </label>
			<input id="user" name="user" type="text" data-bind="value: userName"/>
			<input name="messageIndex" type="hidden" data-bind="value: messageIndex"/>
			<input id="reservationNo" name="reservationNo" type="hidden" value='${ reservationno }'/>
			<button id="start" type="submit" data-bind="click: joinChat">Join Chat</button>
		</p>
	</form>

	<form id="leaveChatForm" action="/car/mvc/chat"  th:action="@{/mvc/chat}" data-bind="visible: activePollingXhr() != null">
		<p>
			You're chatting as <strong data-bind="text: userName"></strong>
			<button id="leave" type="submit" data-bind="click: leaveChat">Leave Chat</button>
		</p>
	</form>

	<div data-bind="visible: activePollingXhr() != null">
		<textarea rows="15" cols="60" readonly="readonly" data-bind="text: chatContent"></textarea>
	</div>
	
	<form id="postMessageForm" action="/car/mvc/chat"  th:action="@{/mvc/chat}" data-bind="visible: activePollingXhr() != null">
		<p>
			<input id="message" name="message" type="text" data-bind="value: message" />
			<button id="post" type="submit" data-bind="click: postMessage">Post</button>
		</p>
	</form>
											
										</td>
									</tr>
								</table>
								</td>
								</tr>							
							<tr>								
							<td>
							<table class="table table-borderd"
									style="align: center">

<div ng-controller="KitchenSinkCtrl as vm">
  <h2 class="text-center">{{ vm.calendarTitle }}</h2>

  <div class="row">

    <!-- <div class="col-md-6 text-center"> --> 
      <div class="btn-group">

        <button
          class="btn btn-primary"
          mwl-date-modifier
          date="vm.viewDate"
          decrement="vm.calendarView">
          Previous
        </button>
        <button
          class="btn btn-default"
          mwl-date-modifier
          date="vm.viewDate"
          set-to-today>
          Today
        </button>
        <button
          class="btn btn-primary"
          mwl-date-modifier
          date="vm.viewDate"
          increment="vm.calendarView">
          Next
        </button>
      </div>
    <!-- </div> -->
	<br>
    <br class="visible-xs visible-sm">

    <!-- <div class="col-md-6 text-center"> -->
      <div class="btn-group">
        <label class="btn btn-primary" ng-model="vm.calendarView" uib-btn-radio="'year'">Year</label>
        <label class="btn btn-primary" ng-model="vm.calendarView" uib-btn-radio="'month'">Month</label>
        <label class="btn btn-primary" ng-model="vm.calendarView" uib-btn-radio="'week'">Week</label>
        <label class="btn btn-primary" ng-model="vm.calendarView" uib-btn-radio="'day'">Day</label>
      </div>
    <!-- </div> -->

  </div>

  <br>

  <mwl-calendar
    events="vm.events"
    view="vm.calendarView"
    view-title="vm.calendarTitle"
    view-date="vm.viewDate"
    on-event-click="vm.eventClicked(calendarEvent)"
    on-event-times-changed="vm.eventTimesChanged(calendarEvent); calendarEvent.startsAt = calendarNewEventStart; calendarEvent.endsAt = calendarNewEventEnd"
    cell-is-open="vm.isCellOpen"
    day-view-start="06:00"
    day-view-end="22:59"
    day-view-split="30"
    cell-modifier="vm.modifyCell(calendarCell)">
  </mwl-calendar>

  <br><br><br>

  <h3 id="event-editor">
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspEdit events
    <button
      class="btn btn-primary pull-right"
      ng-click="vm.addEvent()">
      Add new
    </button>
    <div class="clearfix"></div>
  </h3>
  </td>
  </tr>
  <tr>
  <td>

  <table class="table table-bordered">

    <thead>
      <tr>
        <th>Title</th>
        <th>Primary color</th>
        <th>Secondary color</th>
        <th>Starts at</th>
        <th>Ends at</th>
        <th>Remove</th>
      </tr>
    </thead>

    <tbody>
      <tr ng-repeat="event in vm.events track by $index">
        <td>
          <input
            type="text"
            class="form-control"
            ng-model="event.title">
        </td>
        <td>
          <input class="form-control" colorpicker type="text" ng-model="event.color.primary">
        </td>
        <td>
          <input class="form-control" colorpicker type="text" ng-model="event.color.secondary">
        </td>
        <td>
          <p class="input-group" style="max-width: 250px">
            <input
              type="text"
              class="form-control"
              readonly
              uib-datepicker-popup="dd MMMM yyyy"
              ng-model="event.startsAt"
              is-open="event.startOpen"
              close-text="Close" >
            <span class="input-group-btn">
              <button
                type="button"
                class="btn btn-default"
                ng-click="vm.toggle($event, 'startOpen', event)">
                <i class="glyphicon glyphicon-calendar"></i>
              </button>
            </span>
          </p>
          <div
            uib-timepicker
            ng-model="event.startsAt"
            hour-step="1"
            minute-step="15"
            show-meridian="true">
          </div>
        </td>
        <td>
          <p class="input-group" style="max-width: 250px">
            <input
              type="text"
              class="form-control"
              readonly
              uib-datepicker-popup="dd MMMM yyyy"
              ng-model="event.endsAt"
              is-open="event.endOpen"
              close-text="Close">
            <span class="input-group-btn">
              <button
                type="button"
                class="btn btn-default"
                ng-click="vm.toggle($event, 'endOpen', event)">
                <i class="glyphicon glyphicon-calendar"></i>
              </button>
            </span>
          </p>
          <div
            uib-timepicker
            ng-model="event.endsAt"
            hour-step="1"
            minute-step="15"
            show-meridian="true">
          </div>
        </td>
        <td>
          <button
            class="btn btn-danger"
            ng-click="vm.events.splice($index, 1)">
            Delete
          </button>
        </td>
      </tr>
    </tbody>

  </table>
  </td>
  </tr>
  </div>
  </table>
  </td>
  </tr>
  </table>
  </div>
  </div>
  </div>
</div>

  </body>
  
<script type="text/javascript" src="/car/resources/js/jquery-1.7.2.min.js" th:src="@{/car/resources/js/jquery-1.7.2.min.js}"></script>
<script type="text/javascript" src="/car/resources/js/knockout-2.0.0.js" th:src="@{/car/resources/js/knockout-2.0.0.js}"></script>
<script type="text/javascript" src="/car/resources/js/chat.js" th:src="@{/car/resources/js/chat.js}"></script>
  
  
</html>
