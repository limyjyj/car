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
		$("#reservationsearch").change(function (event) {
			$("#reservationform").submit();
		});
		
})

</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" /><br/>
	
		<div class="bdiv">
		실시간.정기 예약판
		</div>
		<br/><br/>	
		
		<form id="reservationform" action="list.action" method="post">		
			<table class="bsearch">					
				<tr>		
					<td>					
			
					 	<input type="hidden" name="pageno2" value=${ pageno } />  
							<input type="hidden" name="reservationkind" value=${ b.reservationKind } />
						<select	id="reservationsearch" name="reservationsearch">
							<option >선택</option>
							<option value="실시간">실시간</option>					
							<option value="정기">정기</option>
							
						</select>
					</td>				
				</tr>
			</table>

		<table class="btable">
			<thead>
				<tr>
					<th style="width: 100px">회원번호</th>
					<th style="width: 100px">실시간.정기</th>
					<th style="width: 100px">타태워</th>
					<th style="width: 150px">출발지</th>
					<th style="width: 150px">도착지</th>
					<th style="width: 120px">시작날짜</th>
					<th style="width: 120px">끝날짜</th>
					<th style="width: 120px">인원수</th>
					<th style="width: 120px">신청여부</th>
				</tr>
			</thead>	
				
				<c:forEach var="b" items="${ reservations }">		
					<tr>
						<td>${ b.memberNo}</td>
						
						<td>${ b.frequency }</td>
						
						<td>${ b.type }</td>
						<td>
						
						  <a href='detail.action?reservationno=${ b.reservationNo }&pageno=${ pageno }'>
						    ${b.departure }
						  </a>	
						</td>	
						
						<td>
						${ b.arrival }
						</td>
					
						<td>
							${ b.startDate }
						</td>
					
							<td>
							${ b.endDate }
						</td>
						
						<td>
							${ b.totalMember}
						</td>
					     <td>
					     
					    <c:choose>
					<c:when test="${ loginuser.memberNo eq b.memberNo }">						
						
						<input id='submitbutton' type="submit" value="수락하기"
						style="height: 25px" />  
					</c:when>
					<c:otherwise>
						<input id='submitbutton' type="submit" value="신청하기" 
						style="height: 25px" />
						
						<!-- Button trigger modal -->
						<button type="button" data-toggle="modal" data-target="#myModal">
									신청하기
			</button>
						
						<!-- Modal -->
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel">그룹보기</h4>
						      </div>
						      <div class="modal-body">
						 
						 <table class="btable">
			<thead>
				<tr>
					<th style="width: 100px">MEMBERNO</th>
					<th style="width: 100px">RESERVATIONNO</th>
					<th style="width: 100px">NAME</th>
					<th style="width: 150px">GENDER</th>
				</tr>
			</thead>	
				
				<c:forEach var="c" items="${ confirm }">		
					<tr>
						<td>${ c.memberNo}</td>
						
						<td>${ c.reservationNo }</td>
						
						<td>${ c.name }</td>
						
						<td> ${ c.gender }	</td>	
						
					</tr>
				</c:forEach>				
		</table>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
						        
						      </div>
						    </div>
						  </div>
						</div>
						
						
					</c:otherwise>
				</c:choose>
						
						
						</td>
						
					</tr>
				</c:forEach>				
		</table>
		
		<br/>
		</form>
		<br/><br/>
		<div class="bbtn">
			<a href='writeform.action'>글쓰기</a> <br /> <br />
			${ pager } 
			<br/><br/><br/><br/>
		</div>

</body>
</html>



