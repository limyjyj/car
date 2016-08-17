<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" class="no-js" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html class="no-js" lang="en">
<!--<![endif]-->
<head>

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="/car/resources/bower_components/eonasdan-bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="/car/resources/bower_components/moment/min/moment.min.js"></script>
<script type="text/javascript"
	src="/car/resources/bower_components/eonasdan-bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>




<script type="text/javascript">
	//forAjax
	$(function() {

		//send context to server 	
		$('#save').on('click', function(event) {

			var groupSchedule;

			groupSchedule = {
				"title" : $('#title1').val(),
				"startDate" : $('#start-date1').val(),
				"endDate" : $('#end-date1').val(),
				"term" : $('#term1').val(),
				"duration" : $('#duration1').val(),
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
					alert("저장에 실패했습니다.");
				}

			});

		});

		//send context to server 	
		$('#view-schedule').on('click', function(event) {

			$.ajax("/car/groupschedule/view.action?scheduleNo=17", {

				success : function(data) {

					eval("var groupSchedule = " + data);
					document.getElementById("title2").innerHTML = groupSchedule.title;
					document.getElementById("start-date2").innerHTML = groupSchedule.startDate;
					document.getElementById("end-date2").innerHTML = groupSchedule.endDate;
					document.getElementById("term2").innerHTML = groupSchedule.term;
					document.getElementById("duration2").innerHTML = groupSchedule.duration;
					document.getElementById("content2").innerHTML = groupSchedule.content;
				
					/* alert(groupSchedule.scheduleNo); */
					//location.reload();

				},

				error : function(request, status, error) {
					alert("failed to load the file.");
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
											<div class="buttons">
												<input type="button" value="시작" style="height: 25px"
													onclick="location.href='chat.action';" />
											</div>
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
																	<label for="startDate">Start Date</label> <input
																		type="datetime-local" class="form-control" id="start-date1"
																		name="startDate" placeholder="Start-date" />
																</div>
																<div class="form-group">
																	<label for="endDate">End Date</label> <input
																		type="datetime-local" class="form-control" id="end-date1"
																		name="endDate" placeholder="end-date" />
																</div>
																<div class="form-group">
																	<label for="term">Term</label> <input type="number"
																		class="form-control" id="term1" name="term"
																		placeholder="term" />
																</div>
																<div class="form-group">
																	<label for="duration">Duration</label> <input
																		type="number" class="form-control" id="duration1"
																		name="duration" placeholder="duration" />
																</div>
																<div class="form-group">
																	<label for="content">Content</label> <input type="text"
																		class="form-control" id="content1" name="content"
																		placeholder="content" />
																</div>
																<div class="checkbox">
																	<label> <input type="checkbox" /> Check me out
																	</label>
																</div>
																<button type="button" id="save" class="btn btn-default">저장</button>
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

											</div> <!-- Modal -->
											<div class="modal fade" id="myModal4" role="dialog">
												<div class="modal-dialog modal-md">
													<div class="modal-content">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal">&times;</button>
															<h4 class="modal-title">main title</h4>
														</div>
														<div class="modal-body">

															<form role="form">

																<div class="form-group">
																	<label for="title">Title</label> <a type="text"
																		class="form-control" id="title2"></a>

																</div>
																<div class="form-group">
																	<label for="startDate">Start Date</label> <a
																		type="text" class="form-control" id="start-date2"></a>
																</div>
																<div class="form-group">
																	<label for="endDate">End Date</label> <a type="text"
																		class="form-control" id="end-date2"></a>
																</div>
																<div class="form-group">
																	<label for="term">Term</label> <a type="text"
																		class="form-control" id="term2"></a>
																</div>
																<div class="form-group">
																	<label for="duration">Duration</label> <a type="text"
																		class="form-control" id="duration2"></a>
																</div>
																<div class="form-group">
																	<label for="content">Content</label> <a type="text"
																		class="form-control" id="content2"></a>
																</div>
																<div class="checkbox">
																	<label> <input type="checkbox" /> Check me out
																	</label>
																</div>
																<!-- <button type="button" class="btn btn-default">확인</button> -->
															</form>


														</div>

														<!-- Modal Footer -->
														<div class="modal-footer">
															<button type="button" class="btn btn-default"
																data-dismiss="modal">확인</button>
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
</html>