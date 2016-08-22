<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" class="no-js" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html class="no-js" lang="en"> <!--<![endif]-->
<head>
	<jsp:include page="/WEB-INF/views/include/head.jsp" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>

<!-- <script
    src="http://maps.googleapis.com/maps/api/js?key=YOUR_APIKEY&sensor=false">
</script> -->




  <!-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js">
</script>

<script type="text/javascript">

$(function() {
	$('input#enter-groupchatroom').on('click',
			function(event) {
				
				var reservationNo = $(this).attr('data-rno');
				location.href = ('/car/groupchat/longtermreservationchat.action?reservationNo=' + reservationNo);
				
				}
		);
     
     
	$('tr#reservation-user-list').on('click',
			function(event) {
				
				$.ajax("/car/groupchat/reservationuserlist.action?reservationNo=" + $(this).attr('data-rno2'),{
				
					success : function(data) {
						
						eval("list = " + data);
						$("#maplist").append( "reservation No"+" "+" "+" "+" "+" "+"member No");
						$("#maplist").css("padding-left:5em");
						
						$.each(list, function(index, element) {
													
							$("#mapform").append( "<p>reservation no : "+element.reservationNo + "member no : "+element.memberNo+"</p>");
													
						})  
						//window.location.reload(true);
						//location.reload(true);

					},

					error : function(request,
							status, error) {
						alert("작성된 스케줄이 없습니다. 작성하고 싶으시면 작성 버튼을 클릭해 주세요.");
					}
				}
		);
	});
});
	
	 

</script>
	
</head>
<body class="home">
    <jsp:include page="/WEB-INF/views/include/header.jsp" />
    
    <div id="pageContainer" class="panel panel-heading" style="padding-top:25px;text-align:center;margin:auto;width:1000px">

        <div id="content">
        	<br /><br />
        	
        	<table align="center">
			<thead>
				<tr>
					<th style="width: 100px">&nbsp&nbsp&nbsp등록인 아이디</th>					
					<th style="width: 100px">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp타태워</th>
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
					<tr data-toggle="modal"  data-target="#reservationUsersModal" id="reservation-user-list" data-rno2="${ b.reservationNo }">
					
					<!-- Modal -->
						<div class="modal fade" id="reservationUsersModal" role="dialog"  >
							<div class="modal-dialog modal-md">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">input</h4>
									</div>
									<div class="modal-body">
										<form role="form" id="save-schedule">
											<div class="form-group">
												<label for="title">Title1</label>&nbsp&nbsp&nbsp
												<label for="title">Title2</label>
											</div>
											<div id="maplist"></div>
											<div id="mapform"></div>
											<button type="button" id="save" class="btn btn-default" data-dismiss="modal">저장</button>
										</form>

									</div>

									<!-- Modal Footer -->
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">취소</button>
									</div>

								</div>
							</div>
						</div>
												
						<td>${ b.member.memberId }</td>
						
						<td>${ b.type } </td>
						
						<td>${b.departure }</td>	
						
						<td>${ b.arrival }</td>
						
						<td>${ b.startDate }</td>
											
						<td>${ b.endDate }</td>
						
						<td>${ b.totalMember}</td>
						<td>
						<input type="button" id="enter-groupchatroom" 
						value="채팅방" style="height: 25px" data-rno="${ b.reservationNo }"/>
						</td>
						
					</tr>
					
				</c:forEach>
				
			</tbody>				
		</table>
		
        	
        </div>
    </div>
    
</body>
</html>








