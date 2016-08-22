<%@page import="com.car.model.dto.Car"%>
<%@page import="com.car.model.dao.CarDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<div>


	<table id="carlist" class="table table-striped" align="center"
		width="700px">

		<tr style="height: 30px" align="center">

			<td>번호</td>
			<td>항목</td>
			<td>날짜</td>
			<td>금액</td>
			<td>리터</td>
			<td></td>
		</tr>
		
		<c:forEach var="f" items="${ fuels }">
			<tr style="height: 30px" align="center">
				<td>${ f.historyNo }</td>
				<td>${ f.category }</td>
				<td><fmt:formatDate value="${ f.regDate }" pattern="yyyy-MM-dd"
						var="regDate" /> ${ regDate }</td>
				<td>${ f.payment }</td>
				<td>${ f.liter }</td>
				<td><a href="delete.action?carindex=${ o.historyNo }">삭제</a></td>
				
			</tr>
		</c:forEach>

		<c:forEach var="o" items="${ outcomes }">
			<tr style="height: 30px" align="center">
				<td>${ o.historyNo }</td>
				<td>${ o.category }</td>
				<td><fmt:formatDate value="${ o.regDate }" pattern="yyyy-MM-dd"
						var="regDate" /> ${ regDate }</td>
				<td>${ o.payment }</td>
				<td></td>
				<td><a href="delete.action?carindex=${ o.historyNo }">삭제</a></td>
			</tr>
		</c:forEach>


	</table>


</div>


