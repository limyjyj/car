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
	<link href="/car/resources/css/business-casual.css"
	rel="stylesheet">
	<!-- <link href="/mysbl-spring/resources/css/bootstrap.min.css" rel="stylesheet"> -->	
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>	
</head>
<body>

	<div id="pageContainer">

		<% pageContext.include("/WEB-INF/views/include/header.jsp"); %>

		
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
		              <form:input type="text" path="distance" class="form-control" placeholder="총주행거리"/>
			        </div>
			        
			        <div class="form-group">
     		     	  <label for="inputRegdate">기록시작일</label>
		              <form:input type="text" path="regdate" class="form-control" placeholder="기록시작일"/>
			        </div>	       

		       <br><br>		       
		      <%--  <% Car car = (Car)request.getAttribute("car"); %>
		       		<input type='hidden' name="carno" 
		       		value="<%= car.getCarno() %>" />
		       		<input type='hidden' name="pageno" value="${ pageno }" />		       		
		        <div class="buttons" align="center">
						<input class="btn btn-primary" type="submit" id="btnNext" 
							value="수정 완료 " style="height: 30px" />
						<input class="btn btn-danger" type="button" id="btnCancel"
							value="취소" style="height: 30px" onclick="location.href='detail.action?rvno=<%= car.getRvNo() %>&pageno=<%= request.getAttribute("pageno") %>';"/>
				</div> --%>				
		        </form:form>
		    </div>
		</div>

	</div>

</body>
</html>