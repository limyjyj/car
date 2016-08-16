<%@page import="com.car.model.dto.Car"%>
<%@page import="com.car.model.dao.CarDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8" />
    <title></title>
	
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	
	<script type="text/javascript">
		$(function() {
		$('#status').on('change', function(event) {
			var url = $('#status').val();
			$( "#carlist" ).load( url );
			
		});
	});
	
	
	
	</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/head.jsp" />
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
    <div id="pageContainer" class="panel panel-heading" style="padding-top:25px;text-align=center;margin:auto;width:1000px">

        <div id="content">
        	<br /><br />
      
        	<div id="selectCar" >
        	
        	<select id="status" name="status" >
        		<option value="/car/car/list.action">선택하세요.</option>
        		<c:forEach var="car" items="${ cars }" varStatus="Status">
	        		<option value="/car/car/view.action?carno=${ car.carno }">
	        		${ car.carno }
	        		</option>
        		</c:forEach>
        	</select>
        	
	        	
			   <a href="register.action">차량등록</a>
			   
        	</div>
        	
        	<table id="carlist" class="table table-striped"  align="center" width="700px">
        	
        		<tr style="height:30px" align="center">
        			<td><input type="hidden" value="멤버"/></td>
        			<td>차량정보번호</td>
        			<td>차종</td>
        			<td>차량번호</td>
        			<td>기록시작일</td>
        			<td>총주행거리</td>
        			<td>총지출금액</td>
        		</tr>        	
        	<c:forEach var="car" items="${ cars }">
        		<tr style="height:30px" align="center">
        		
        			<td><input type="hidden" ${ car.memberNo }/></td>
        			<td>${ car.carindex }</td>
        			<td>${ car.model }</td>
        			<td>${ car.carno }</td>
        			<td><fmt:formatDate value="${ car.regdate }" pattern="yyyy-MM-dd" var="regDate"/>
                      ${ regDate }</td>
        			<td>${ car.totaldistance }</td>
        			<td>${ car.totaloutcome }</td>
   
        		</tr>
        	</c:forEach>
        	
        	</table>
        	
        	
        	
        	
        	<table class="table table-striped"  align="center" width="700px">
        	
        		<tr style="height:30px">
        		
        		<td>기간별 조회</td>
        		</tr>
        	
        	
        	
        	</table>
        	
        
        </div>
    </div>
    
</body>
</html>

