
<%@page import="com.car.model.dto.Member"%>
<%@page import="com.car.model.dto.Reservation"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" session="true"%>
	
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	

<%	//치환변수선언
    pageContext.setAttribute("cr", "\r"); //Space
    pageContext.setAttribute("cn", "\n"); //Enter
    pageContext.setAttribute("crcn", "\r\n"); //Space, Enter
    pageContext.setAttribute("br", "<br/>"); //br 태그 %> 
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#delete').on('click', function(event) {
			var reservationno = ${reservation.reservationNo}
			var result = confirm('삭제 하시겠습니까?');
			if (result) {
				//yes
				location.href = ('/car/reservation/delete.action?reservationno=' + reservationno);
			} else {
				//no
			}
		});
	});
</script>

<meta charset="utf-8" />
<title>세부사항</title>

	
		<jsp:include page="/WEB-INF/views/include/head.jsp" />
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<div class="bdiv">세부정보</div>

		<br/><br/>

</head>
<body>


<body>
		<br/><br/>
		<div >
	
			
			<form id="detailform" action="detail.action" method="post">	
			<table class="dtable">
				<tr>
		     		<th>작성자</th>
					<td >
					${ reservation.member.memberId }
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
					<th >내&nbsp;용</th>
					
					<td > 
						${reservation.content }
					</td>
				</tr>
			</table>
			
			<br/><br/>
					
	<%-- 		<div class="bbtn">
				<c:choose>
					<c:when test="${ loginuser.memberNo eq reservation.memberNo }">						
						<a href='javascript:doDelete(${ reservation.reservationNo })' id="delete">삭제</a>&nbsp;&nbsp;
						<a href='edit.action?reservationno=${ reservation.reservationNo }&pageno=${ pageno }'>수정</a>&nbsp;&nbsp;
						<a href='list.action?pageno=${pageno}'>뒤로가기</a>
					</c:when>
					<c:otherwise>
						작성자가 자기 글에 댓글을 쓸 수 없다면 여기에 댓글 링크 만들기
					</c:otherwise>
				</c:choose>
					
	
			</div> --%>
			
			<div class="buttons">
						<c:choose>
							<c:when test="${ loginuser.memberNo eq reservation.memberNo  }">
							
							
							<a href='javascript:doDelete(${ reservation.reservationNo })' id="delete">삭제</a>&nbsp;&nbsp;
						<a href='edit.action?reservationno=${ reservation.reservationNo }&pageno=${ pageno }'>수정</a>&nbsp;&nbsp;
						<a href='list.action?pageno=${ pageno }'>뒤로가기</a>						
								
								</c:when>
							<c:otherwise>
					    		<a href='list.action?pageno=${ pageno }'>뒤로가기</a>
							</c:otherwise>
						</c:choose>
					
					</div>
			</form>
		</div>
		
		<br /> <br />

		

</body>
</html>