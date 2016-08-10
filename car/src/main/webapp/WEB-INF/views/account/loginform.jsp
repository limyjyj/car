
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title>로그인</title>
	<link rel="Stylesheet" href="/mysbl-spring/resources/styles/default.css" />
	<link rel="Stylesheet" href="/mysbl-spring/resources/styles/input.css" />	
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
	
	$(document).ready(function(){
		$(".memberlogin").show(function(){
			$(".stafflogin").hide();
		});
	
	
	$("#member").click(function () {
		  $(".memberlogin").show(0 , function () {
		    $(".stafflogin").hide(0); 
		  });
		});
	
		$("#staff").click(function () {
		  $(".stafflogin").show(0, function(){
			  $(".memberlogin").hide(0);
		  });
		});	
	});
	
	function statusChangeCallback(response) {
		console.log('statusChangeCallback');
		console.log(response);

		if (response.status === 'connected') {//로그인 된 경우
			// Logged into your app and Facebook.
			
			//location.href = "01.testpage.jsp";			
			testAPI();
		} else if (response.status === 'not_authorized') {
			// The person is logged into Facebook, but not your app.
			document.getElementById('status').innerHTML = 'Please log '
					+ 'into this app.';
		} else {
			// The person is not logged into Facebook, so we're not sure if
			// they are logged into this app or not.
			document.getElementById('status').innerHTML = 'Please log '
					+ 'into Facebook.';
		}
	}

	function checkLoginState() {
		//로그인 상태를 확인하는 API 호출 (FB.getLoginStatus)
		FB.getLoginStatus(function(response) {
			statusChangeCallback(response);
		});
	}

	//facebook login api library 초기화
	window.fbAsyncInit = function() {
		FB.init({
			appId : '253846414976764',
			cookie : true, // enable cookies to allow the server to access 
			// the session
			xfbml : true, // parse social plugins on this page
			version : 'v2.6' // use version 2.2
		});
		
		<% if (session.getAttribute("facebookloginuser") == null) { %>
		FB.getLoginStatus(function(response) {
			if (response.status === 'connected') {
				FB.logout(function(result) {
					/* alert('logout'); */
				});
			} else {
				
			}
		});				
	<% } %>


		FB.getLoginStatus(function(response) {
			statusChangeCallback(response);
		});

	};

	// Load the SDK asynchronously
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id))
			return;
		js = d.createElement(s);
		js.id = id;
		js.src = "//connect.facebook.net/en_US/sdk.js";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));

	// Here we run a very simple test of the Graph API after login is
	// successful.  See statusChangeCallback() for when this call is made.
	function testAPI() {
		console.log('Welcome!  Fetching your information.... ');
		
		FB.api('/me',//현재 로그인된 사용자 정보 요청
			   function(response) {
					/* alert(JSON.stringify(response)); */
					document.getElementById('status').innerHTML = 'Thanks for logging in, '
									+ response.name + '!';
			   });
	}
	
	$(function() {
		$('#facebooklogin').on('click', function(event) {
			FB.login(function(response) {
				if (response.status === 'connected') {
					//서버에 로그인 처리
					var x = 10;
					$.ajax({
						url : '/mysbl-spring/account/facebooklogin.action',
						type : 'post',
						data : { userid : response.authResponse.userID },
						success : function(data, status, xhr) {
							location.href="/mysbl-spring/home.action";
						}
					})
				} else if (response.status === 'not_authorized') {						
				} else {						
				}
			})
		})
		
	})
	$('#facebooklogout').on('click', function(event) {
			event.preventDefault();
			event.stopPropagation();
			
			FB.logout(function(result) {
				//서버에 로그아웃 처리
				$.ajax({
					url : '/mysbl-spring/account/facebooklogout.action',
					type : 'get',
					success : function(data, status, xhr) {
						checkLoginState();
						location.href="/mysbl-spring/home.action";
					}
				})
			})
		})
	</script>
</head>
<body>	
	<div id="pageContainer">
	
		<c:import url="/WEB-INF/views/include/header.jsp" />
		
		<div id="inputcontent">
			<br /><br />
		   <div style="height:80px">
		   	<input type="button" id="member" style="width:260px; height:79px; text-align:center" value="회원 로그인">
		    <input type="button" id="staff" style="width:260px; height:79px; text-align:center" value="직원 로그인">
		   </div>
		    
		    
		    <div id="inputmain" class="memberlogin"> 
		    <div class="inputsubtitle">회원 로그인</div>
		     
		        <form action="/car/account/login.action" method="post">
		        
		        <!-- input type="hidden" : 사용자에게 보이지 않지만 서버로 전송되는 입력 요소 -->
		        <input type="hidden" name="returnurl" value='${ empty requestScope.returnurl ? "" : requestScope.returnurl }' />
		        <table>
		            <tr>
		                <th>아이디(ID)</th>
		                <td>
		                    <input type="text" id="memberId" name="memberId" style="width:280px" />
		                </td>
		            </tr>
		            <tr>
		                <th>비밀번호</th>
		                <td>
		                	<input type="password" name="passWd" style="width:280px" />
		                </td>
		            </tr>
		        </table>
		        
		        <div class="buttons">
		        	<input type="submit" value="로그인" style="height:25px" />
		        	<input type="button" value="취소" style="height:25px" />
		        </div>
		        </form>
		       <div style='text-align:center'>
					<!-- <fb:login-button scope="public_profile,email" 
						onlogin="checkLoginState();" autologoutlink="true">
					</fb:login-button> -->
				
				</div> 
		    </div>
		    
		   
		  
		        
		    </div>
		    
		</div>   	
	

</body>
</html>