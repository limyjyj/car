<%@page import="com.car.model.dto.Board"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />

<script type="text/javascript">
	
</script>

</head>
<body>

	<c:import url="/WEB-INF/views/include/header.jsp" />

	<div id="inputcontent"
		style="padding-top: 20px; text-align: center; margin: auto; width: 800px">

		<div id="inputmain">

			<h3 style="text-align: center">공지 사항</h3>

			<br />

			<div style="width: 700px; margin: auto;">

				<table style="width: 700px; margin: auto;">
					<tr>
						<th style="text-align: center;">번호</th>
						<th style="text-align: center;">제목</th>
						<th style="text-align: center;">작성자</th>
						<th style="text-align: center;">작성일</th>
					</tr>
					<tr>
						<td>${ board.boardNo }</td>
						<td>${ board.title }</td>
						<td>관리자</td>
						<td>${ board.regdate }</td>
					</tr>
				</table>
			</div>
			<br /> <br />
			<div>
				<input type="button" value="등록" style="height:30px" onClick="location.href='writeform.action';"/> 
			</div>
			<!-- <div style="text-align: center">
					<input type=button value="수정" style="height:40px" onClick="location.href='editform.action';" /> 
					<input id="delete" type="button" value="탈퇴" style="height:40px" /> 
					<input id="ID" type="hidden" value="${ member.memberId }" />
				</div>   -->
		</div>
	</div>


	<br />

</body>
</html>