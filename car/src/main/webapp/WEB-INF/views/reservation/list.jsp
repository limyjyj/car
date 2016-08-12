<%@page import="com.car.model.dto.Reservation"%>
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
<script>
$(document).ready(function (){
		$("#boardsearch").change(function (event) {
			$("#boardform").submit();
		});
		
})

</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/head.jsp" /><br/>
	
		<div class="bdiv">
		실시간.정기 예약판
		</div>
		<br/><br/>	
		
		<form id="boardform" action="list.action" method="post">		
			<table class="bsearch">					
				<tr>		
					<td>					
						
						<select	id="reservationsearch" name="reservationsearch">
							<option>선택</option>
							<option>실시간</option>					
							<option>정기</option>
							
						</select>
					</td>				
				</tr>
			</table>

		<table class="btable">
			<thead>
				<tr>
					<th style="width: 100px">회원번호</th>
					
					<th style="width: 100px">타태워</th>
					<th style="width: 300px">출발지</th>
					<th style="width: 150px">도착지</th>
					<th style="width: 120px">날짜</th>
				
				</tr>
			</thead>	
				
				<c:forEach var="b" items="${ reservation }">		
					<tr>
						<td>${ b.memberno }</td>
						
						<td>${ b.purpose }</td>
						<td>
							<c:forEach var="i" begin="0" end="${ b.depth }" step="1"/> 
							<c:if test="${ b.depth > 0 }">
								<img src="/weeklyfarm/resources/image/re.gif" /> 
							</c:if> 
							
							<c:choose>
								<c:when test="${ b.deleted }">
									<span style='color: gray' onclick="alert('삭제된 글입니다.');">
										${ b.boardTitle } &nbsp;(삭제된 글) 
									</span>
								</c:when>
								<c:otherwise>
									<a href='detail.action?boardno=${ b.boardNo }&pageno=${ pageno }'>
										${ b.boardTitle }
									</a>									
								</c:otherwise>
							</c:choose>
						</td>	
						
						<td>
							${ b.arrival }
						</td>
						<td>
							${ b.date }
						</td>
					
					</tr>
				</c:forEach>				
		</table>
		
		<br/>		
			
		</form>
		
		<div class="bbtn">
			<a href='writeform.action'>글쓰기</a> <br /> <br />
			${ pager } 
			<br/><br/><br/><br/>
		</div>

</body>
</html>



