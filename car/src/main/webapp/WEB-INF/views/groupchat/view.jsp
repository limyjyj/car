<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" class="no-js" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<!-- <html class="no-js" lang="en"> -->
<html class="no-js" lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org">
<!--<![endif]-->
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- <link rel="stylesheet"
	href="/car/resources/bower_components/eonasdan-bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.min.css" />
 --><script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- <script type="text/javascript"
	src="/car/resources/bower_components/moment/min/moment.min.js"></script>
<script type="text/javascript"
	src="/car/resources/bower_components/eonasdan-bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script> -->
 


<script type="text/javascript">

function changeReadOnlyAttribute() {
	
	document.getElementById("title2").readOnly = false;
	document.getElementById("start-date2").readOnly = false;
	document.getElementById("end-date2").readOnly = false;
	document.getElementById("depart-time2").readOnly = false;
	document.getElementById("content2").readOnly = false;
	
	changeDisplay();
	
	document.getElementById("start-date2").type = 'date';
	document.getElementById("end-date2").type = 'date';
	document.getElementById("depart-time2").type = 'time';
}

function changeDateAndTimeType() {
	
	document.getElementById("start-date2").type = 'text';
	document.getElementById("end-date2").type = 'text';
	document.getElementById("depart-time2").type = 'text';
	
}

function changeDisplay() {
	
	changeDateAndTimeType();
	
	document.getElementById("intro-modify").style.display = "none";
	document.getElementById("modify").style.display = "";
	document.getElementById("return").style.display = "none";
	document.getElementById("cancle").style.display = "";
}

function reverseDisplay() {
	
	changeDateAndTimeType();
	
	document.getElementById("intro-modify").style.display = "";
	document.getElementById("modify").style.display = "none";
	document.getElementById("return").style.display = "";
	document.getElementById("cancle").style.display = "none";
}


	//forAjax
	$(function() {

		//insert schedule  	
		$('#save').on('click', function(event) {

			var groupSchedule;

			groupSchedule = {
				"title" : $('#title1').val(),
				"startDate" : $('#start-date1').val(),
				"endDate" : $('#end-date1').val(),
				"departTime" : $('#depart-time1').val(),
				"content" : $('#content1').val()
			};
			
			/* groupSchedule = JSON.stringify(groupSchedule); */

			$.ajax({
				url : "/car/groupschedule/insert.action",
				type : "post",
				data : groupSchedule,
				/* contentType: "application/json",  */
				success : function(data, status, xhr) {

					alert("저장했습니다.");
					//location.reload();

				},

				error : function(request, status, error) {
					alert("스케줄은 이미 존재하니 존재하는 걸로 사용해 주세요.");
				}

			});

		});

		// view schedule 	
		$('#view-schedule').on('click', function(event) {

			$.ajax("/car/groupschedule/view.action?scheduleNo=17", {

				success : function(data) {

					eval("var groupSchedule = " + data);
					
					document.getElementById("title2").value = groupSchedule.title;
					document.getElementById("start-date2").value = groupSchedule.startDate;
					document.getElementById("end-date2").value = groupSchedule.endDate;
					document.getElementById("depart-time2").value = groupSchedule.departTime;
					document.getElementById("content2").value = groupSchedule.content;
				
					//location.reload();

				},

				error : function(request, status, error) {
					alert("failed to load the file.");
				}

			});

		});
		
		
		// modify schedule  	
		$('#modify').on('click', function(event) {

			var groupSchedule;

			groupSchedule = {
				"title" : $('#title2').val(),
				"startDate" : $('#start-date2').val(),
				"endDate" : $('#end-date2').val(),
				"departTime" : $('#depart-time2').val(),
				"content" : $('#content2').val()
			};
			
			$.ajax({
				url : "/car/groupschedule/update.action",
				type : "post",
				data : groupSchedule,
				
				success : function(data, status, xhr) {
					alert("수정 하였습니다.");

				},

				error : function(request, status, error) {
					alert("수정에 실패 하였습니다..");
				}

			});

		});

	});
</script>

</head>

<body class="home">

	<jsp:include page="/WEB-INF/views/include/head.jsp" />
	<jsp:include page="/WEB-INF/views/include/header.jsp" />

	<div id="pageContainer" class="panel panel-heading"
		style="padding-top: 25px; text-align: center; margin: auto; width: 800px">


		<div style="padding-top: 25px; text-align: center">
			<div id="inputcontent">
				<div id="inputmain">


					<table class="table table-borderd"
						style="align: center; width: 700px">
						<tr>
							<td>
								<table class="table table-borderd"
									style="align: center; width: 500px">
									<th style="text-align: center">채팅</th>
									<tr>
										<td>
											<!-- <div class="buttons">
												<input type="button" value="시작" style="height: 25px"
													onclick="location.href='chat.action';" />
											</div> -->
											
												<form id="joinChatForm" action="/car/mvc/chat" th:action="@{/mvc/chat}" data-bind="visible: activePollingXhr() == null">
		<p>
			<label for="user">User Nick Name: </label>
			<input id="user" name="user" type="text" data-bind="value: userName"/>
			<input name="messageIndex" type="hidden" data-bind="value: messageIndex"/>
			<button id="start" type="submit" data-bind="click: joinChat">Join Chat</button>
		</p>
	</form>

	<form id="leaveChatForm" action="/car/mvc/chat"  th:action="@{/mvc/chat}" data-bind="visible: activePollingXhr() != null">
		<p>
			You're chatting as <strong data-bind="text: userName"></strong>
			<button id="leave" type="submit" data-bind="click: leaveChat">Leave Chat</button>
		</p>
	</form>

	<div data-bind="visible: activePollingXhr() != null">
		<textarea rows="15" cols="60" readonly="readonly" data-bind="text: chatContent"></textarea>
	</div>
	
	<form id="postMessageForm" action="/car/mvc/chat"  th:action="@{/mvc/chat}" data-bind="visible: activePollingXhr() != null">
		<p>
			<input id="message" name="message" type="text" data-bind="value: message" />
			<button id="post" type="submit" data-bind="click: postMessage">Post</button>
		</p>
	</form>
											
										</td>
									</tr>
								</table>
							</td>
							<td>
								<table class="table table-borderd"
									style="align: center; width: 200px">
									<th style="text-align: center" colspan="2">스케줄</th>
									<tr>
										<td>
											<div class="buttons">
												<button type="button" data-toggle="modal"
													data-target="#myModal3">작성</button>

											</div> <!-- Modal -->
											<div class="modal fade" id="myModal3" role="dialog">
												<div class="modal-dialog modal-md">
													<div class="modal-content">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal">&times;</button>
															<h4 class="modal-title">input </h4>
														</div>
														<div class="modal-body">


															<form role="form" id="save-schedule">

																<div class="form-group">
																	<label for="title">Title</label> <input type="text"
																		class="form-control" id="title1" name="title"
																		placeholder="Enter title" />

																</div>
																<div class="form-group">
																	<label for="startDate">Start Date</label>
																	<input type="date" class="form-control" 
																		name="startDate" placeholder="Start-date" />
																</div>
																<div class="form-group">
																	<label for="endDate">End Date</label> 
																	<input type="date" class="form-control" id="end-date1"
																		name="endDate" placeholder="end-date" />
																</div>
																<div class="form-group">
																	<label for="duration">Depart Time</label> <input
																		type="time" class="form-control" id="depart-time1"
																		name="departTime" placeholder="depart-time" />
																</div>
																<div class="form-group">
																	<label for="content">Content</label> <input type="text"
																		class="form-control" id="content1" name="content"
																		placeholder="content" />
																</div>
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
										</td>








										<td>
											<div class="buttons">
												<button type="button" data-toggle="modal" id="view-schedule"
													data-target="#myModal4">확인</button>
											</div> 
											
											<!-- Modal -->
											<div class="modal fade" id="myModal4" role="dialog">
												<div class="modal-dialog modal-md">
													<div class="modal-content">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal">&times;</button>
															<h4 class="modal-title">Modify Schedule</h4>
														</div>
														<div class="modal-body">

															<form role="form">

																<div class="form-group">
																	<label for="title">Title</label> <input type="text"
																		class="form-control" id="title2" readonly></input>

																</div>
																<div class="form-group">
																	<label for="startDate">Start Date</label> <input
																		type="text" class="form-control" id="start-date2" readonly></input>
																</div>
																<div class="form-group">
																	<label for="endDate">End Date</label> <input type="text"
																		class="form-control" id="end-date2" readonly></input>
																</div>
																<div class="form-group">
																	<label for="departTime">Depart Time</label> <input type="text"
																		class="form-control" id="depart-time2" readonly></input>
																</div>
																<div class="form-group">
																	<label for="content">Content</label> <input type="text"
																		class="form-control" id="content2" readonly></input>
																</div>
																
																<button type="button" class="btn btn-default" id="intro-modify" onClick="changeReadOnlyAttribute()">수정</button>
																<button type="button" class="btn btn-default" id="modify" style="display:none" onClick="reverseDisplay()">완료</button>
																
																</form>
																
														</div>
																												<!-- Modal Footer -->
														<div class="modal-footer">
															<button id="return" type="button" class="btn btn-default"
																data-dismiss="modal" onClick="reverseDisplay()">확인</button>
															<button id="cancle" type="button" class="btn btn-default"
																data-dismiss="modal" style="display:none" onClick="reverseDisplay()">취소</button>
														</div>

													</div>
												</div>
											</div>
										</td>

									</tr>
								</table>
							<td>
						</tr>
					</table>
				</div>
			</div>

		</div>
	</div>

</body>

<script type="text/javascript" src="/car/resources/js/jquery-1.7.2.min.js" th:src="@{/car/resources/js/jquery-1.7.2.min.js}"></script>
<script type="text/javascript" src="/car/resources/js/knockout-2.0.0.js" th:src="@{/car/resources/js/knockout-2.0.0.js}"></script>
<script type="text/javascript" src="/car/resources/js/chat.js" th:src="@{/car/resources/js/chat.js}"></script>

</html>