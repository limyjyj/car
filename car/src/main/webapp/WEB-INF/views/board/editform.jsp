<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="com.car.model.dto.Board"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8" />

<script type="text/javascript">
	
</script>
<jsp:include page="/WEB-INF/views/include/head.jsp" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
</head>
<body>

	<c:import url="/WEB-INF/views/include/header.jsp" />

	<div id="inputcontent"
		style="padding-top: 20px; text-align: center; margin: auto; width: 800px">

		<div id="inputmain">

			<h3 style="text-align: center">공지 사항 수정</h3>

			<br />
			<form:form method="post" modelAttribute="board"
				action="update.action">
				<!-- 상대경로표시 -->

				<table>
					<tr>
						<th style="text-align: center;">제목</th>
						<td><form:input type="text" path="title"
								style="text-align: center;" /></td>
					</tr>
					<tr>
						<th style="text-align: center;">작성자</th>
						<td>관리자</td>
					</tr>
					<tr>
						<th style="text-align: center;">작성일</th>
						<td><fmt:formatDate value="${ board.regDate }"
								pattern="yyyy-MM-dd" var="regDate" /> ${ regDate }</td>
					</tr>
					<tr>
						<th style="text-align: center;">내용</th>
						<td><form:input type="text" path="content"
								style="text-align: center;" /> <input type="hidden"
							value="${ board.boardNo }" name="boardNo" /></td>

					</tr>

				</table>
				<br />
				<div class="buttons" style="text-align: center">
					<input type="submit" value="수정" style="height: 40px" /> <input
						id="cancel" type="button" value="취소" style="height: 40px"
						onclick="location.href='detail.action?boardNo=${ board.boardNo }';" />

				</div>
			</form:form>
		</div>
	</div>

</body>
</html>