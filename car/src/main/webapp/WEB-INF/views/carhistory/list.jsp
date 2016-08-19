<%@page import="com.car.model.dto.Car"%>
<%@page import="com.car.model.dao.CarDao"%>
<%@page import="com.car.model.dto.Carhistory"%>
<%@page import="com.car.model.dao.CarhistoryDao"%>
<%@page import="com.car.model.dto.Outcome"%>
<%@page import="com.car.model.dto.Fuel"%>


<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8" />
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title></title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

<script type="text/javascript">
	$(function() {
		$('#status').on(
				'change',
				function(event) {
					var url = "/car/carhistory/view.action?carindex="
							+ $('#status').val();
					$("#carlist").load(url);

				});
	});

	$(function() {
		$('#All').on('change', function(event) {
			var url = "/car/carhistory/list.action".val();
			$("#carlist").load(url);
		});
	});

	$(function() {
		$("#but").on('click', function(event) {
			var startDate = $('#startDate').val();
			var endDate = $('#endDate').val();
			var carNo = $("#status option:selected").text();

			$.ajax({
				url : "/car/carhistory/list.action",
				type : "post",
				data : {
					startDate : startDate,
					endDate : endDate,
					carNo : carNo
				},
				success : function(data) {

				}
			})
		})

		$("#inputOutcome")
				.on(
						'click',
						function(event) {
							//alert($("#status").val());
							var carindex = $('#status').val();
							location.href = "/car/carhistory/outcomewriteform.action?carindex="
									+ $('#status').val();
						})
		$("#inputFuel")
				.on(
						'click',
						function(event) {
							//alert($("#status").val());
							var carindex = $('#status').val();
							location.href = "/car/carhistory/fuelwriteform.action?carindex="
									+ $('#status').val();
						})

	});
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/head.jsp" />
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<div id="pageContainer" class="panel panel-heading"
		style="padding-top: 25px; margin: auto; width: 1000px">

		<div id="content">
			<br /> <br />

			<div id="selectCar">

				<select id="status" name="status">
					<option value="/car/carhistory/list.action" id="All">선택하세요</option>
					<c:forEach var="car" items="${ cars }" varStatus="Status">
						<option value="${ car.carindex }">${ car.carno }</option>
					</c:forEach>
				</select> <input class="btn btn-danger" type="button" id="inputOutcome"
					value="지출입력" style="height: 30px" /> <input class="btn btn-danger"
					type="button" id="inputFuel" value="주유입력" style="height: 30px" />

			</div>
			<br> <br>

			<table id="carlist" class="table table-striped" align="center"
				width="700px">
				<tr style="height: 30px" align="center">
					<td><input type="hidden" value="멤버" /></td>
					<td>번호</td>
					<td>항목</td>
					<td>날짜</td>
					<td>금액</td>
					<td>리터</td>
				</tr>

				<c:forEach var="f" items="${ fuels }">
					<tr style="height: 30px" align="center" data-toggle="modal"
						data-target="#fView">
						<td><input type="hidden" ${ f.historyNo } /></td>
						<td>${ f.historyNo }</td>
						<td>${ f.category }</td>
						<td><fmt:formatDate value="${ f.regDate }"
								pattern="yyyy-MM-dd" var="regDate" /> ${ regDate }</td>
						<td>${ f.payment }</td>
						<td>${ f.liter }</td>
					</tr>
				</c:forEach>

				<c:forEach var="o" items="${ outcomes }">
					<tr style="height: 30px" align="center" id="oList"
						data-toggle="modal" data-target="#oView">
						<td><input type="hidden" ${ o.historyNo } /></td>
						<td>${ o.historyNo }</td>
						<td>${ o.category }</td>
						<td><fmt:formatDate value="${ o.regDate }"
								pattern="yyyy-MM-dd" var="regDate" /> ${ regDate }</td>
						<td>${ o.payment }</td>
						<td></td>
					</tr>
				</c:forEach>

			</table>

			<table class="table table-striped" align="center" width="700px">

				<tr style="height: 30px">

					<td>기간별 조회</td>
					<td class="form-group"><label for="inputRegdate">기록시작일</label>
						<input type="date" path="regdate" class="form-control"
						placeholder="기록시작일" id="startDate" /></td>
					<td class="form-group"><label for="inputRegdate">기록종료일</label>
						<input type="date" path="regdate" class="form-control"
						placeholder="기록종료일" id="endDate" /></td>

				</tr>

				<button type="button" id="but">조회</button>

			</table>

		</div>
	</div>









	<table class="table table-borderd" style="align: center; width: 200px">
	<th style="text-align: center" colspan="2">스케줄</th>
	<tr>
		<td>
			<div class="buttons">
				<button type="button" data-toggle="modal" data-target="#myModal3">작성</button>

			</div> 
			
			
			
			<!-- Modal -->
			<div class="modal fade" id="fView" role="dialog">
				<div class="modal-dialog modal-md">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">주유 상세내역</h4>
						</div>
						<div class="modal-body">


							<form role="form" id="save-schedule">

								<div class="form-group">
									<label for="title">Title</label> <input type="text"
										class="form-control" id="title1" name="title"
										placeholder="Enter title" />

								</div>
								<div class="form-group">
									<label for="startDate">Start Date</label> <input type="date"
										class="form-control" name="startDate" placeholder="Start-date" />
								</div>
								<div class="form-group">
									<label for="endDate">End Date</label> <input type="date"
										class="form-control" id="end-date1" name="endDate"
										placeholder="end-date" />
								</div>
								<div class="form-group">
									<label for="duration">Depart Time</label> <input type="time"
										class="form-control" id="depart-time1" name="departTime"
										placeholder="depart-time" />
								</div>
								<div class="form-group">
									<label for="content">Content</label> <input type="text"
										class="form-control" id="content1" name="content"
										placeholder="content" />
								</div>
								<button type="button" id="save" class="btn btn-default"
									data-dismiss="modal">저장</button>
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
							<h4 class="modal-title">Modify Schedule</h4>
						</div>
						<div class="modal-body">

							<form role="form">

								<div class="form-group">
									<label for="title">Title</label> <input type="text"
										class="form-control" id="title2" readonly></input>

								</div>
								<div class="form-group">
									<label for="startDate">Start Date</label> <input type="text"
										class="form-control" id="start-date2" readonly></input>
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

								<button type="button" class="btn btn-default" id="intro-modify"
									onClick="changeReadOnlyAttribute()">수정</button>
								<button type="button" class="btn btn-default" id="modify"
									style="display: none" onClick="reverseDisplay()">완료</button>

							</form>

						</div>
						<!-- Modal Footer -->
						<div class="modal-footer">
							<button id="return" type="button" class="btn btn-default"
								data-dismiss="modal" onClick="reverseDisplay()">확인</button>
							<button id="cancle" type="button" class="btn btn-default"
								data-dismiss="modal" style="display: none"
								onClick="reverseDisplay()">취소</button>
						</div>

					</div>
				</div>
			</div>
		</td>

	</tr>
	</table>















</body>
</html>

