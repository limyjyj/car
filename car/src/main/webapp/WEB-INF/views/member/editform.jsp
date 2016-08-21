<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="com.car.model.dto.Member"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8" />
<link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet" type="text/css">
	<link href="http://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic"
	rel="stylesheet" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#delete').on('click', function(event) {
			var memberId = $('#memberId').val();
			var result = confirm('탈퇴 하시겠습니까?');
			if (result) {
				//yes
				location.href = ('/car/member/delete.action?memberId=' + memberId);
			} else {
				//no
			}
		});
	});
</script>
</head>
<body>

	<jsp:include page="/WEB-INF/views/include/head.jsp" />
	<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<div class="jumbotron"
		style="background-color: #EAEAEA; padding-top: 35px; width: 800px; align: center; margin: auto;">
		<div class="container">
			<h2>&nbsp;&nbsp;회원 정보 수정</h2>
		</div>
	</div>

	<div id="inputcontent" class="panel panel-heading"
		style="padding-top: 20px; text-align: center; margin: auto; width: 800px">

		<div id="inputmain">

			<h3 style="text-align: center">회원 정보 수정</h3>

			<br />
			<form:form method="post" modelAttribute="member">
				<!-- 상대경로표시 -->
				<table class="table table-bordered">
					<tr>
						<th style="text-align: center;">아이디(ID)</th>
						<td>${ member.memberId } </td>
					</tr>
					<tr>
						<th style="text-align: center;">이름</th>
						<td>${ member.name } 
						</td>
					</tr>
					<tr>
						<th style="text-align: center;">비밀번호</th>
						<td><form:password path="passWd" cssStyle="width:280px" /></td>
					</tr>
					<tr>
						<th style="text-align: center;">전화번호</th>
						<td> <form:input type="text" path="phone"
								style="width:280px" />
						</td>
					</tr>
					
				</table>
				<br />
				<div class="buttons" style="text-align: center">
					<input class="btn btn-info" type="submit" value="수정"
						style="height: 40px" /> 
						 <input	class="btn btn-info" id="delete" type="button" value="탈퇴"
							style="height: 40px" /> <input id="memberId" type="hidden" value="${ member.memberId }" />
					
				</div>
			</form:form>
		</div>
	</div>
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
</body>
</html>