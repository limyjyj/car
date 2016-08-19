<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" class="no-js" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html class="no-js" lang="en"> <!--<![endif]-->
<head>
	<jsp:include page="/WEB-INF/views/include/head.jsp" />
</head>
<body class="home">
    <jsp:include page="/WEB-INF/views/include/header.jsp" />
    
    <div id="pageContainer" class="panel panel-heading" style="padding-top:25px;text-align:center;margin:auto;width:1000px">

        <div id="content">
        	<br /><br />
        	
        	<table align="center">
			<thead>
				<tr>
					<th style="width: 100px">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp회원번호</th>					
					<th style="width: 100px">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp타태워</th>
					<th style="width: 150px">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp출발지</th>
					<th style="width: 150px">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp도착지</th>
					<th style="width: 120px">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp시작날짜</th>
					<th style="width: 120px">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp끝날짜</th>
					<th style="width: 120px">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp인원수</th>
					<th style="width: 120px">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp채팅방</th>
				</tr>
				
			</thead>
			<tbody>					
				<c:forEach var="b" items="${ reservations }">		
					<tr>
						<td>${ b.memberNo } </td>
						
						<td>${ b.type } </td>
						
						<td>${b.departure }</td>	
						
						<td>${ b.arrival }</td>
						
						<td>${ b.startDate }</td>
											
						<td>${ b.endDate }</td>
						
						<td>${ b.totalMember}</td>
						
						<td><button href=""></button></td>
					
					</tr>
					
					<input type="button" id="enter-groupchatroom" value="채팅방" style="height: 25px"/>
					
				</c:forEach>
				
			</tbody>				
		</table>
		
        	
        </div>
    </div>
    
</body>
</html>

