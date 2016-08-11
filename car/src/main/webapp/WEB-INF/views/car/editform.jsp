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
	<title>글수정</title>
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
		       		<input type='hidden' name="carno" 
		       		value="${ car.carno }" />
		       		<div class="form-group">
     		     	  <label for="inputTitle">제목</label>
		              <form:input type="text" path="title" class="form-control" placeholder=""/>
			        </div>
		       		
		        	<div class="form-group">
     		     	  <label for="inputName">작성자</label>
     		     	  <%= ((Member)session.getAttribute("loginuser")).getName() %>
			        </div>
			              
			        <div class="form-group">
     		     	  <label for="inputContent">내용</label>
		              <form:textarea path="content" class="form-control" placeholder="공지 입력." cols="76" rows="15"/>
			        </div>
			        
			        <div class="form-group">
     		     	  <label for="inputUplaod">첨부자료</label>
		              <input type="file" name="attach" class="form-control" placeholder="수정할 첨부자료를 올려주세요."/>
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