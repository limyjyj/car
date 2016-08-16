<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="com.car.model.dto.Board"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8" />

<script type="text/javascript">
	
</script>
</head>
<body>

	<c:import url="/WEB-INF/views/include/header.jsp" />

	<div id="inputcontent" style="padding-top: 20px; text-align: center; margin: auto; width: 800px">

		<div id="inputmain">

			<h3 style="text-align: center">공지 사항 수정</h3>

			<br />
			<form:form method="post" modelAttribute="board"><!-- 상대경로표시 -->
			
				<table>
					<tr>
						<th style="text-align: center;">제목</th>
						<td>${ board.title } </td>
					</tr>
					<tr>
						<th style="text-align: center;">작성자</th>
						<td>${ board.memberNo }
						관리자
						</td>
					</tr>
					<tr>
						<th style="text-align: center;">작성일</th>
						<td><form:input path="regdate" value="${ board.regDate }" pattern="yyyy-MM-dd" var="regDate"/>
		                ${ regDate }</td>
					</tr>
					<tr>
						<th style="text-align: center;">내용</th>
						<td>${ board.content } </td>
					</tr>
					
				</table>
				<br />
				<div class="buttons" style="text-align: center">
					<input type="submit" value="수정" style="height: 40px" /> 
					<input	id="cancel" type="button" value="취소" style="height: 40px" /> 
					
				</div>
			</form:form>
		</div>
	</div>

</body>
</html>