<%@page import="com.car.model.dto.Car"%>
<%@page import="com.car.model.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8" />
	<title>홈</title>

	
	<!-- Custom CSS -->
	<link href="/car/resources/css/business-casual.css" rel="stylesheet">
	
</head>
<body>

		<c:import url="/WEB-INF/views/include/header.jsp" />
	<div id="pageContainer" class="panel panel-heading" style="padding-top:25px;text-align:center;margin:auto;width:700px">
	
		
		<div style="padding-top:25px;text-align:center">
		<div id="inputcontent">
		    <div id="inputmain">
		      
		        <form:form action="view.action" method="post" modelAttribute="car">
		        <table class="table table-borderd" style="align:center;width:500px">
		           
		           	<tr>
		                <th style="text-align:center">번호</th>
		                <td>
		                ${ car.carindex }
		                <form:hidden path="carindex"/>
		                </td>
		                
		            </tr>
		             <tr>
		                <th style="text-align:center">기록시작일</th>
		                <td>${ car.regdate }</td>
		            </tr>
		            <tr>
		                <th style="text-align:center">차종</th>
		                <td>${ car.model }</td>
		            </tr>
		            <tr>
		                <th style="text-align:center">차번호</th>
		                <td>${ car.carno }</td>
		            </tr>
		            <tr>
		                <th style="text-align:center">총주행거리</th>
		                <td>${ car.totaldistance }</td>
		            </tr>
		            
		     
		        </table>
		        
		        <div class="buttons">
		        	<input type="button" value="취소" style="height:25px" onclick="location.href='list.action';" />
		        </div>
		        </form:form>
		    </div>
		</div>   	
	
	</div>
	</div>

</body>
</html>