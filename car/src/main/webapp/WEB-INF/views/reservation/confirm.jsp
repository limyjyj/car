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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#reservationsearch").change(function(event) {
			$("#reservationform").submit();
		});

	})

	$(function() {
		$('input#accept').on('click',
						function(event) {
							var reservationNo = $('input#reservationno').val();
							var memberNo = $('input#memberno').val();
							var result = confirm('수락됨');
		
							if (result) {
								location.href = "/car/reservation/confirmAjax.action?reservationno="
										+ reservationNo
										+ "&memberno="
										+ memberNo;
							} else {
								alert('취소합니다');
							}

						});

		$('input#refuse').on('click',
						function(event) {
							var reservationNo = $('#reservationno').val();
							var memberNo = $('#memberno').val();
							var result = confirm('거절 하시겠습니까?');
							
							if (result) {
								location.href = "/car/reservation/deleteConfirm.action?reservationNo="
										+ reservationNo
										+ "&memberNo="
										+ memberNo;
							 } else {
								alert('취소합니다');
							}
   
									});
					

		/* 		$('input#refuse').on('click', function(event) {
					var reservationno = ${reservation.reservationNo}
					var result = confirm('거절 하시겠습니까?');
					if (result) {
						//yes
						location.href = ('/car/reservation/confirmlist.action?reservationno=' + reservationno);
					} else {
						//no
					}
				}); */

	});
</script>
</head>
<body>


	<div class="bdiv">그룹확인</div>
	<br />
	<br />



	<table class="btable">
		<thead>
			<tr>
				<th style="width: 100px; text-align: center;">아이디</th>
				<th style="width: 100px; text-align: center;">이름</th>
				<th style="width: 100px; text-align: center;">성별</th>
				<th style="width: 100px; text-align: center;">핸드폰</th>
				<th style="width: 100px; text-align: center;">수락.거절</th>


			</tr>
		</thead>

		<c:forEach var="c" items="${ confirms }">
			<tr>


				<td>${ c.member.memberId }</td>

				<td>${ c.member.name}</td>

				<td>${ c.member.gender }</td>

				<td>${ c.member.phone }</td>

				<td>
					<input type="button" id="accept" value="수락"style="height: 25px" /> 
					<input type="button" id="refuse" value="거절" style="height: 25px" />
					<input type="text" id="memberno" style="height: 25px" hidden="hidden" value='${ c.memberNo }' /> 
					<input type="text" id="reservationno" style="height: 25px" hidden="hidden" value='${ reservationNo }' />

				</td>




			</tr>
		</c:forEach> 
	</table>

	<br />

</body>
</html>



