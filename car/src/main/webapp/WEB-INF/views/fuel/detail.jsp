<%@page import="com.car.model.dto.Fuel"%>
<%@page import="com.car.model.dao.FuelDao"%>
<%@page import="com.car.model.dto.Carhistory"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	//치환변수선언
	pageContext.setAttribute("cr", "\r"); //Space
	pageContext.setAttribute("cn", "\n"); //Enter
	pageContext.setAttribute("crcn", "\r\n"); //Space, Enter
	pageContext.setAttribute("br", "<br/>"); //br 태그
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>지출</title>
<link href="/car/resources/css/business-casual.css" rel="stylesheet">

<%-- <jsp:include page="/WEB-INF/views/include/head.jsp" /> --%>
</head>

<body>
	<div id="pageContainer" class="panel panel-heading"
		style="padding-top: 25px; text-align: center; margin: auto; width: 1000px">
		<div id="content">
			<br>
			<br>

			<div>
				<div style="padding-left: 100px">지출 입력</div>
				<br />
				<br />

				<table class="table table-striped" align="center" width="700px">
					<tr>
						<th>주유 형태</th>
						<td>${ fuel.type }</td>
					</tr>
					<tr>
						<th>리터당 금액</th>
						<td>${ fuel.perLiter }</td>
					</tr>
					<tr>
						<th>주유 금액</th>
						<td>${ fuel.payment }</td>
					</tr>
					<tr>
						<th>주유 리터</th>
						<td>${ fuel.liter }</td>
					</tr>
					<tr>
						<th>주유 날짜</th>
						<td>${ fuel.regDate }</td>
					</tr>
					<tr>
						<th>주유 장소</th>
						<td>${ fuel.location }</td>
					</tr>
					<tr>
						<th>메모</th>
						<td style="height: 150px; vertical-align: top; text-align: left; padding-left: 30px;">
							<c:set var="rn" value="
" /> <c:set var="br" value="<br />" />
							${ fn:replace( fuel.content, rn, br) }
						</td>
					</tr>
				</table>

				<br />
				<br />

				<div class="button">
					<a href='list.action'>목록보기</a>&nbsp;&nbsp;
				</div>
			</div>
		</div>
	</div>

	<br />
	<br />
	<br />
	<br />
	<br />

</body>
</html>