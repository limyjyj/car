<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="com.car.model.dto.Member"%>
<%@page import="com.car.model.dto.Car"%>

<!DOCTYPE html>

<html>
<head>
</head>

<body>
	<jsp:include page="/WEB-INF/views/include/head.jsp" />
	<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<div id="inputcontent">
		<br /> <br />
		<div id="inputmain">
			<div class="inputsubtitle">차 등록</div>

			<form id="registerform" action="register.action" method="post">
				<!-- 상대경로표시 -->

				<table>
					<tr>
						<th style="text-align: center;">번호</th>
						<td>${ car.memberNo } </td>
					</tr>
					<tr>
						<th>차종</th>
						<td><input type="text" id="model" name="${ car.model }"
							style="width: 280px" /></td>
					</tr>

					<tr>
						<th>차번호</th>
						<td><input type="text" id="carno" name="carno"
							style="width: 280px" /></td>
					</tr>
					
					<tr>
						<th>기록시작일</th>
						<td><input type="date" id="regdate" name="regdate"
							style="width: 280px" /></td>
					</tr>
					

				</table>

				<div class="buttons">

					<input id='submitbutton' type="submit" value="등록" style="height: 25px" /> 
					<input type="button" value="취소" style="height: 25px" onclick="location.href='../list.action';" />

				</div>
			</form>
		</div>

	</div>
	<br />
	<br />
	<br />



</body>
</html>