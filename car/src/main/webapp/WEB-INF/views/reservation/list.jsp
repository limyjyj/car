<%@page import="com.car.model.dto.Reservation"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>




<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8" />
<title>게시물 목록</title>

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>

<script
	src="http://maps.googleapis.com/maps/api/js?key=YOUR_APIKEY&sensor=false">
</script>




<!-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js">
</script>





<script type="text/javascript">
$(function() {
	$('input#register').on('click',
			function(event) {
		
		
				var reservation=$(this).attr("name");
				alert(reservation)
				/* var reservationNo = $('#reservationNo').val(); */
				var memberNo = $('#memberNo').val();
				var result = confirm('신청하시겠습니까?');
				if (result) {
				//yes
				location.href = ('/car/reservation/confirm.action?reservationNo=' + reservation +'&memberNo=' + memberNo);
				
				alert("신청 완료 되었습니당");
				} else {
					alert("취소욤");
				//no
				}
			});
     });


$(document).ready(function (){
	$("#departureSearch2").on('click',
			function (event) {
		var departure = $("#departureSearch").val();
		if(departure == 0){
			location.href="/car/reservation/frequencylist.action?frequency="+$("#reservationsearch").val();
		
		}else {
			location.href="/car/reservation/frequencylist.action?frequency="+$("#reservationsearch").val() + "&departure="+departure;
		}
		
	});
	
})


/* $(document).ready(function (){
	$("#reservationsearch").change(function (event) {
		
		location.href="/car/reservation/frequencylist.action?frequency="+$("#reservationsearch").val();
		
	});

	
	
}) */

</script>


</head>
<body>
	<jsp:include page="/WEB-INF/views/include/head.jsp" />
	<jsp:include page="/WEB-INF/views/include/header.jsp" /><br />

	<div class="bdiv" style="text-align:center; font-size: 20px" >실시간.정기 예약판</div>
	<br />
	<br />


	<table class="bsearch" align="center">
		<tr>
			<td><input type="hidden" name="pageno2" value=${ pageno } /> <input
				type="hidden" name="reservationkind" value=${ b.reservationKind } />
				<select id="reservationsearch" name="reservationsearch">
					<option>선택</option>
					<!-- 		<option value="전체보기">전체보기</option> -->
					<option value="실시간">실시간</option>
					<option value="정기">정기</option>

			</select> <input type="text" name="departure" id="departureSearch"
				style="width: 70px" /> <input type="button" id="departureSearch2"
				value="출발지검색" style="height: 25px" /></td>
		</tr>

	</table>
	<form id="reservationform" action="list.action" method="post">
		<table class="btable" align="center">
			<thead>
				<tr>
					<th style="width: 100px">회원번호</th>
					<th style="width: 100px">타태워</th>
					<th style="width: 100px">실시간.정기</th>
					<th style="width: 100px">목적</th>
					<th style="width: 150px">출발지</th>
					<th style="width: 150px">도착지</th>
					<th style="width: 120px">시작날짜</th>
					<th style="width: 120px">끝날짜</th>
					<th style="width: 120px">인원수</th>
					<th style="width: 120px">신청여부</th>
				</tr>
			</thead>

			<c:forEach var="b" items="${ reservations }">
				<tr>
					<td>${ b.member.memberId}</td>

					<td>${ b.purpose }</td>

					<td>${ b.frequency }</td>

					<td>${ b.type }</td>
					<td><a href='detail.action?reservationno=${ b.reservationNo }&pageno=${ pageno }'>
							${b.departure } </a></td>

					<td>${ b.arrival }</td>

					<td>${ b.startDate }</td>

					<td>${ b.endDate }</td>

					<td>${ b.totalMember}</td>
					<td><c:choose>
							<c:when test="${ loginuser.memberNo eq b.memberNo }">
								<div class="buttons">
									<!-- <input id='submitbutton' type="submit" value="수락하기"
						style="height: 25px" />   -->
						<!-- <input type="button" id="accept" value="목록보기" style="height: 25px" /> -->
						<input type="button" onclick="window.open('confirmlist.action?reservationNo=' + ${b.reservationNo}, 'popup', 'width=500, height=500, scrollbars=1')" value="목록보기">
	
					</c:when>
						<c:when test="${ loginuser.memberNo eq confirm.memberNo}">	
						<input type="button" value="신청완료"  style="height: 25px" />
						</c:when>
					<c:otherwise>
					
							 
						 <input type="button" id="register" value="신청하기" name="${ b.reservationNo }" style="height: 25px" />
						 					
						 <input id="reservationNo" type="hidden" value="${ b.reservationNo }" />
						 <input id="memberNo" type="hidden" value="${ loginuser.memberNo }" />
		
						
					</c:otherwise>
				</c:choose>
						
						
						</td>
						
					</tr>
				</c:forEach>				
		</table>

		<br />
	</form>
	<br />
	<br />
	<div class="bbtn" align="center">
		<a href='writeform.action'>글쓰기</a> <br /> <br /> ${ pager } <br />
		<br />
		<br />
		<br />
	</div>

</body>
</html>



