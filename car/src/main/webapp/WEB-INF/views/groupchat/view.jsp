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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="/car/resources/bower_components/jquery/jquery.min.js"></script>
<script type="text/javascript"
	src="/car/resources/bower_components/moment/min/moment.min.js"></script>
<script type="text/javascript"
	src="/car/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="/car/resources/bower_components/eonasdan-bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
<link rel="stylesheet"
	href="/car/resources/bower_components/bootstrap/dist/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/car/resources/bower_components/eonasdan-bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.min.css" />

<script>
	ko.bindingHandlers.dateTimePicker = {
		init : function(element, valueAccessor, allBindingsAccessor) {
			//initialize datepicker with some optional options
			var options = allBindingsAccessor().dateTimePickerOptions || {};
			$(element).datetimepicker(options);

			//when a user changes the date, update the view model
			ko.utils.registerEventHandler(element, "dp.change",
					function(event) {
						var value = valueAccessor();
						if (ko.isObservable(value)) {
							if (event.date != null
									&& !(event.date instanceof Date)) {
								value(event.date.toDate());
							} else {
								value(event.date);
							}
						}
					});

			ko.utils.domNodeDisposal.addDisposeCallback(element, function() {
				var picker = $(element).data("DateTimePicker");
				if (picker) {
					picker.destroy();
				}
			});
		},
		update : function(element, valueAccessor, allBindings, viewModel,
				bindingContext) {

			var picker = $(element).data("DateTimePicker");
			//when the view model is updated, update the widget
			if (picker) {
				var koDate = ko.utils.unwrapObservable(valueAccessor());

				//in case return from server datetime i am get in this form for example /Date(93989393)/ then fomat this
				koDate = (typeof (koDate) !== 'object') ? new Date(
						parseFloat(koDate.replace(/[^0-9]/g, ''))) : koDate;

				picker.date(koDate);
			}
		}
	};
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

					<form:form action="view.action" method="post" modelAttribute="car">
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
														data-target="#myModal">작성</button>

												</div> <!-- Modal -->
												<div class="modal fade" id="myModal" role="dialog">
													<div class="modal-dialog modal-md">
														<div class="modal-content">
															<div class="modal-header">
																<button type="button" class="close" data-dismiss="modal">&times;</button>
																<h4 class="modal-title">스케줄 작성</h4>
															</div>
															<div class="modal-body">
																<table class="table table-borderd"
																	style="align: center; width: 600px">
																	<tr>
																		<th><h4 align="center" class="modal-title">목록</h4></th>
																		<th><h4 align="center" class="modal-title">내용 입력</h4></th>
																	</tr>
																	<tr>
																		<td>Title</td>
																		<td><input></input></td>
																	</tr>
																	<tr>
																		<td>ChatNo</td>
																		<td><input></input></td>
																	</tr>
																	<tr>
																		<td>StartDate</td>
																		<td align="center">

																			<div class='col-sm-6'>
																				<div class="form-group">
																					<div class='input-group date' id='datetimepicker5'>
																						<input type='text' class="form-control" size="200" />
																						<span class="input-group-addon"> <span
																							class="glyphicon glyphicon-calendar"></span>
																						</span>
																					</div>
																				</div>
																			</div> <script type="text/javascript">
																				$(function() {
																					$(
																							'#datetimepicker5')
																							.datetimepicker(
																									{
																										defaultDate : "11/1/2013",
																										disabledDates : [
																												moment("12/25/2013"),
																												new Date(
																														2013,
																														11 - 1,
																														21),
																												"11/22/2013 00:53" ]
																									});
																				});
																			</script>

																		</td>
																	</tr>
																	<tr>
																		<td>EndDate</td>
																		<td>
																			<div class='col-sm-6'>
																				<div class="form-group">
																					<div class='input-group date' id='datetimepicker6'>
																						<input type='text' class="form-control" size="200" />
																						<span class="input-group-addon"> <span
																							class="glyphicon glyphicon-calendar"></span>
																						</span>
																					</div>
																				</div>
																			</div> <script type="text/javascript">
																				$(function() {
																					$(
																							'#datetimepicker6')
																							.datetimepicker(
																									{
																										defaultDate : "11/1/2013",
																										disabledDates : [
																												moment("12/25/2013"),
																												new Date(
																														2013,
																														11 - 1,
																														21),
																												"11/22/2013 00:53" ]
																									});
																				});
																			</script>
																		</td>
																	</tr>
																	<tr>
																		<td>Term</td>
																		<td><input></input></td>
																	</tr>
																	<tr>
																		<td>Duration</td>
																		<td><input></input></td>
																	</tr>
																	<tr>
																		<td>Content</td>
																		<td><input></input></td>
																	</tr>

																</table>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-default"
																	data-dismiss="modal">확인</button>
																<button type="button" class="btn btn-default"
																	data-dismiss="modal">취소</button>
															</div>
														</div>
													</div>
												</div>


											</td>

											<td>
												<div class="buttons">
													<button type="button" data-toggle="modal"
														data-target="#myModal2">확인</button>

												</div> <!-- Modal -->
												<div class="modal fade" id="myModal2" role="dialog">
													<div class="modal-dialog modal-md">
														<div class="modal-content">
															<div class="modal-header">
																<button type="button" class="close" data-dismiss="modal">&times;</button>
																<h4 class="modal-title">스케줄 확인</h4>
															</div>
															<div class="modal-body">
																<table class="table table-borderd"
																	style="align: center; width: 600px">
																	<tr>
																		<th><h4 align="center" class="modal-title">목록</h4></th>
																		<th><h4 align="center" class="modal-title">내용</h4></th>
																	</tr>
																	<tr>
																		<td>Title</td>
																		<td><input></input></td>
																	</tr>
																	<tr>
																		<td>ChatNo</td>
																		<td><input></input></td>
																	</tr>
																	<tr>
																		<td>StartDate</td>
																		<td><input></input></td>
																	</tr>
																	<tr>
																		<td>EndDate</td>
																		<td><input></input></td>
																	</tr>
																	<tr>
																		<td>Term</td>
																		<td><input></input></td>
																	</tr>
																	<tr>
																		<td>Duration</td>
																		<td><input></input></td>
																	</tr>
																	<tr>
																		<td>Content</td>
																		<td><input></input></td>
																	</tr>

																</table>
															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-default"
																	data-dismiss="modal">확인</button>
																<button type="button" class="btn btn-default"
																	data-dismiss="modal">수정</button>
																<button type="button" class="btn btn-default"
																	data-dismiss="modal">취소</button>
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
					</form:form>
				</div>
			</div>

		</div>
	</div>

</body>
</html>