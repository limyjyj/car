<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>로그인</title>

<!-- Bootstrap -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- font awesome -->
<link href="css/font-awesome.min.css" rel="stylesheet">
<!-- Custom Style -->
<link href="css/style.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></scri.row>.containerpt>
    <![endif]-->
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/head.jsp" />
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
<<<<<<< HEAD
	<div id="pageContainer">



		<div id="inputcontent">
			<br /><br />
		   <div style="height:80px">
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
			
				
				</div> 
		    </div>
		    
		   
		  
		        
		    </div>
		    
		</div>   	
	

=======
	<div class="container">
		<div class="row">
			<div class="page-header">
				<h2>심플한 로그인 폼</h2>
			</div>
			<div class="col-md-3">
				<div class="login-box well">
					<form accept-charset="UTF-8" role="form" method="post" action="login.action">
						<legend>로그인</legend>
						<div class="form-group">
							<label for="username-email"> 아이디</label> <input name="memberId"
								value='' id="memberId" placeholder="UserId" type="text"
								class="form-control" />
						</div>
						<div class="form-group">
							<label for="password">비밀번호</label> <input name="passWd"
								id="passWd" value='' placeholder="Password" type="password"
								class="form-control" />
						</div>
						<div class="form-group">
							<input type="submit"
								class="btn btn-default btn-login-submit btn-block m-t-md"
								value="Login" />
						</div>
						<!-- <span class='text-center'><a href="/bbs/index.php?mid=index&act=dispMemberFindAccount" class="text-sm">비밀번호 찾기</a></span> -->
						<hr />
						<div class="form-group">
							<a href="/car/member/register.action"
								class="btn btn-default btn-block m-t-md"> 회원가입</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
>>>>>>> branch 'master' of https://github.com/limyjyj/car.git
</body>
</html>