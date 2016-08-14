
<%@page import="com.car.model.dto.Member"%>
<%@page import="com.car.model.dto.Reservation"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" session="true"%>

<%	//치환변수선언
    pageContext.setAttribute("cr", "\r"); //Space
    pageContext.setAttribute("cn", "\n"); //Enter
    pageContext.setAttribute("crcn", "\r\n"); //Space, Enter
    pageContext.setAttribute("br", "<br/>"); //br 태그 %> 
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8" />
<title>세부사항</title>

<jsp:include page="/WEB-INF/views/include/head.jsp" />

</head>
<body>
	
	<div id="map" style="width:500px;height:400px;"></div>
	<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=0b310b2f318c9e4b7fd52459eb35d927"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new daum.maps.Map(container, options);
	</script>
	
		<br/><br/>
		<div>
		<div class="bdiv">세부정보</div>
		<br/><br/>
			
			<form id="detailform" action="detail.action" method="post">	
			<table class="dtable">
				<tr>
		     		<th>작성자</th>
					<td >
					${ sessionScope.loginuser.memberId }
					</td>
				</tr>
				
					<tr>
					<th>출발지</th>
					<td>${ reservation.departure}</td>
					</tr>
					
					<tr>
					<th>도착지</th>
					<td>${ reservation.arrival}</td>
					</tr>
					
				<tr>
					<th>시작날짜</th>
					<td>${ reservation.startDate }</td>
				</tr>
					
				<tr>
					<th>끝날짜</th>
					<td>${ reservation.endDate }</td>
				</tr>
				
				<tr>
					<th valign="middle">내&nbsp;용</th>
					<td style="height:150px; vertical-align: top; text-align:left; padding-left: 30px;">
						
					</td>
				</tr>
			</table>
			
			<br/><br/>
					
			<div class="bbtn">
				<c:choose>
					<c:when test="${ loginuser.memberNo eq reservation.memberNo }">						
						<a href='javascript:doDelete(${ reservation.reservationNo }, ${ pageno })'>삭제</a>&nbsp;&nbsp;
						<a href='edit.action?reservationno=${ reservation.reservationNo }&pageno=${ pageno }'>수정</a>&nbsp;&nbsp;
					</c:when>
					<c:otherwise>
						<%-- 작성자가 자기 글에 댓글을 쓸 수 없다면 여기에 댓글 링크 만들기 --%>
					</c:otherwise>
				</c:choose>
					
					<a href='list.action?pageno=${ pageno }'>목록보기</a>
			</div>
		</div>
		
		<br /> <br />

		

</body>
</html>