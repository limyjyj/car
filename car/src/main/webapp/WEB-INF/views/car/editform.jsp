<%@page import="com.car.model.dto.Car"%>
<%@page import="com.car.model.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8" />
	<title>차 정보 수정</title>
	<!-- <link href="/mysbl-spring/resources/css/bootstrap.min.css" rel="stylesheet"> -->	
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>	
</head>
<body>

	<div id="pageContainer">

	
	<jsp:include page="/WEB-INF/views/include/head.jsp" />
	<jsp:include page="/WEB-INF/views/include/header.jsp" />

		
		<div id="inputmain">
		        <div class="inputsubtitle"><h2 align="center">차정보 수정</h2></div>
		        <br>		        
			    <div class="col-md-6 col-md-offset-3">
			    
		        <form:form action="update.action" method="post" modelAttribute="car"><!-- 상대경로표시 -->
		       		<input type='hidden' name="carindex" 
		       		value="${ car.carindex }" />
		       		
		        	<div class="form-group">
     		     	  <label for="inputModel">차종</label>
     		     	  <form:input type="text" path="model" class="form-control" placeholder="차종"/>
			        </div>
			        <div class="form-group">
     		     	  <label for="inputCarno">차량번호</label>
		              <form:input type="text" path="carno" class="form-control" placeholder="차량번호"/>
			        </div>
		       		
			        <div class="form-group">
     		     	  <label for="inputDistance">총주행거리</label>
		              <form:input type="text" path="totaldistance" class="form-control" placeholder="총주행거리"/>
			        </div>
			        
			        <div class="form-group">
     		     	  <label for="inputRegdate">기록시작일</label>
		              <form:input type="date" path="regdate" class="form-control" placeholder="기록시작일"/>
			        </div>	       

		       <br><br>		       
		     	<div class="buttons">
		        	<!-- 아래 a 링크는 input type='submit' 버튼을 누르는 효과 발생 -->		        	
		        	
		        	<input type="submit" value="수정" style="height: 40px" /> 
		        	<input id="cancel" type="button" value="취소" style="height: 40px"
						onclick="location.href='view.action?carno=${ car.carno }';" />
		        	
		        </div>
		        </form:form>
		    </div>
		</div>

	</div>

</body>
</html>