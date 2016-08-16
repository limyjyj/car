<%@page import="com.car.model.dto.Reservation"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8" />
<title>게시물 목록</title>
<jsp:include page="/WEB-INF/views/include/head.jsp" />
<script>
$(document).ready(function (){
		$("#reservationsearch").change(function (event) {
			$("#reservationform").submit();
		});
		
})

</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" /><br/>
	
		<div class="bdiv">
		그룹확인
		</div>
		<br/><br/>	
		
		<form id="confirmform" action="confirm.action" method="post">		
			
		<table class="btable">
			<thead>
				<tr>
					<th style="width: 100px">MEMBERNO</th>
					<th style="width: 100px">RESERVATIONNO</th>
					
				</tr>
			</thead>	
				
				<c:forEach var="c" items="${ confirms }">		
					<tr>
						<td>${ c.memberNo}</td>
						
						<td>${ c.reservationNo }</td>
						
					</tr>
				</c:forEach>				
		</table>
		
		<br/>
		</form>

</body>
</html>



