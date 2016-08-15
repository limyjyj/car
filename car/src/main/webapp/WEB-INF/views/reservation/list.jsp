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
		$("#boardsearch").change(function (event) {
			$("#boardform").submit();
		});
		
})

</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" /><br/>
	
		<div class="bdiv">
		실시간.정기 예약판
		</div>
		<br/><br/>	
		
		<form id="detailform" action="list.action" method="post">		
			<table class="bsearch">					
				<tr>		
					<td>	
					
									
						<input type="hidden" name="pageno2" value=${ pageno } /> 
							<input type="hidden" name="reservationfind" value=${ b.reservationKind } />
						<select	id="reservationsearch" name="reservationsearch">
							<option>선택</option>
							<option>실시간</option>					
							<option>정기</option>
							
						</select>
					</td>				
				</tr>
			</table>

		<table class="btable">
			<thead>
				<tr>
					<th style="width: 100px">회원</th>
					
					<th style="width: 100px">타태워</th>
					<th style="width: 150px">출발지</th>
					<th style="width: 150px">도착지</th>
					<th style="width: 120px">시작날짜</th>
					<th style="width: 120px">끝날짜</th>
					<th style="width: 120px">인원수</th>
				</tr>
			</thead>	
				
				<c:forEach var="b" items="${ reservations }">		
					<tr>
						<td>${ b.memberNo }</td>
						
						<td>${ b.type }</td>
						<td>
						
						<a href='detail.action?reservationno=${ b.reservationNo }&pageno=${ pageno }'>
								${b.departure }
							</a>						
					
						</td>	
						
						<td>
							${ b.arrival }
						</td>
						<td>
							${ b.startDate }
						</td>
					
							<td>
							${ b.endDate }
						</td>
						
						<td>
							${ b.totalMember}
						</td>
					
					</tr>
				</c:forEach>				
		</table>
		
		<br/>
		</form>
		<br/><br/><br/><br/><br/><br/><br/>
		<div class="bbtn">
			<a href='writeform.action'>글쓰기</a> <br /> <br />
			${ pager } 
			<br/><br/><br/><br/>
		</div>

</body>
</html>



