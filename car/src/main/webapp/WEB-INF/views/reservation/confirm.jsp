<%@page import="com.car.model.dto.Member"%>
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

$(function() {
	$('input#accept').on('click',
			function(event) {
				var reservationNo = $('#reservationNo').val();
				var memberNo = $('#memberNo').val();
				var result = confirm('수락됨');
				if (result) {
				//yes
				location.href = ('/car/reservation/confirm.action?reservationNo=' + reservationNo +'&memberNo=' + memberNo);
				
				alert("수락됨");
				} else {
				//no
				}
			});
     });



</script>
</head>
<body>
	
	
		<div class="bdiv">
		그룹확인
		</div>
		<br/><br/>	
		
				
			
		<table class="btable">
			<thead>
				<tr>
				    <th style="width: 100px">아이디</th>
					<th style="width: 100px">이름</th>
					<th style="width: 100px">성별</th>
					<th style="width: 100px">핸드폰</th>
					<th style="width: 100px">수락.거절</th>
					
					
				</tr>
			</thead>	
				
				<c:forEach var="c" items="${ confirms }">		
					<tr>
						<td>${ c.memberId }</td>
					
						<td>${ c.name}</td>
						
						<td>${ c.gender }</td>
						
						<td>${ c.phone }</td>
						
						<td> <input type="button" id="accept" value="수락" style="height: 25px" /> 
						<input type="button" id="refuse" value="거절" style="height: 25px" />
						</td>
						
						
						
						
					</tr>
				</c:forEach>				
		</table>
		
		<br/>

</body>
</html>



