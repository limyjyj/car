
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

</head>
<body>	
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
	

</body>
</html>