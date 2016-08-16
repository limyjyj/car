<%@page import="com.car.model.dto.Outcome"%>
<%@page import="com.car.model.dao.OutcomeDao"%>
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
						<th>지출 유형</th>
						<td>${ outcome.cartegory }</td>
					</tr>
					<tr>
						<th>지출 금액</th>
						<td>${ outcome.payment }</td>
					</tr>
					<tr>
						<th>지출 날짜</th>
						<td>${ outcome.regDate }</td>
					</tr>
					<tr>
						<th>장소</th>
						<td>${ outcome.location }</td>
					</tr>
					<tr>
						<th>메모</th>
						<td style="height: 150px; vertical-align: top; text-align: left; padding-left: 30px;">
							<c:set var="rn" value="
" /> <c:set var="br" value="<br />" />
							${ fn:replace( outcome.content, rn, br) }
						</td>
					</tr>
				</table>

				<br />
				<br />

				<div class="button">
					<a href='javascript:doDelete(${ board.boardNo }, ${ pageno })'>닫기</a>&nbsp;&nbsp;
					<a href='edit.action?historyno=${ board.boardNo }&pageno=${ pageno }'>수정</a>&nbsp;&nbsp;
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