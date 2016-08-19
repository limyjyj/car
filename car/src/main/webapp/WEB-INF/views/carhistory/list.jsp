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

		
		$("#inputFuel")
				.on(
						'click',
						function(event) {
							//alert($("#status").val());
							var carindex = $('#status').val();
							location.href = "/car/carhistory/fuelwriteform.action?carindex="
									+ $('#status').val();
						})

		//ajax
		//작성	
		$('#save').on('click', function(event) {

			var groupCarhistory;

			groupCarhistory = {
				"category" : $('#category1').val(),
				"payment" : $('#payment1').val(),
				"location" : $('#location1').val(),
				"regDate" : $('#regDate1').val(),
				"content" : $('#content1').val(),
				"carindex" : $('#status').val()
			};

			/* groupSchedule = JSON.stringify(groupSchedule); */

			$.ajax({
				url : "/car/carhistory/outcomewrite.action",
				type : "post",
				data : groupCarhistory,
				/* contentType: "application/json",  */
				success : function(data, status, xhr) {

					alert("저장했습니다.");
					//location.reload();

				},

				error : function(request, status, error) {
					alert("주유내역이 이미 존재하니 존재하는 걸로 사용해 주세요.");
				}

			});

		});

		// view schedule 	
		$('tr#viewOutcome')
				.on('click',
						function() {
					var historyNo = $(this).attr('data-rno');
					alert($(this).attr('data-rno'));	
					alert(historyNo);
		            
					//var historyNo = $("#historyNo").val();
					$("#historyNo2").val(historyNo);
					var category = $("#category").val();
					$("#category2").val(category);
					var payment = $("#payment").val();
					$("#payment2").val(payment);
					var location = $("#location").val();
					$("#location2").val(location);
					var content = $("#content").val();
					$("#content2").val(content);
					
					
				})

		
		function changeReadOnlyAttribute() {

			$("#category2").readOnly = false;
			$("#payment2").readOnly = false;
			$("#regDate2").readOnly = false;
			$("#location2").readOnly = false;
			$("#content2").readOnly = false;

			changeDisplay();

			$("#regDate2").type = 'date';
		
		}


		
		
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
				</select> 
				
				<input class="btn btn-danger" type="button" id="inputOutcome"
					value="지출입력" style="height: 30px" 
					data-toggle="modal" data-target="#inputOutcome1"/> 
					
				<input class="btn btn-danger"
					type="button" id="inputFuel" value="주유입력" style="height: 30px" 
					data-toggle="modal" data-target="#inputFuel"/>

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
					<tr style="height: 30px" align="center" id="viewOutcome"
						data-toggle="modal" data-target="#oView">
						
						<td><input type="hidden" ${ o.historyNo } /></td>
						<td><input id="historyNo" type="hidden" readonly="readonly" 
						" data-rno="${ o.historyNo }">${ o.historyNo }</td>
						<td><input id="category" type="hidden" readonly="readonly" value="${ o.category }">${ o.category }</td>
						<td><input type="hidden" id="regDate" readonly="readonly" value="${ regDate }">${ regDate }</td>
						
						<td><input id="payment" type="hidden" readonly="readonly" value="${ o.payment }">${ o.payment }</td>
						<td></td>
						
						<!-- Modal -->
		<div class="modal fade" id="oView" role="dialog">
			<div class="modal-dialog modal-md">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">지출 상세 내역</h4>
					</div>
					<div class="modal-body">

						<form role="form">

							<div class="form-group">
								<label for="historyNo">지출 금액</label> <input type="text"
									class="form-control" id="historyNo2" ></input>
							</div>

							<div class="form-group">
								<label for="category">지출 유형</label> <input type="text"
									class="form-control" id="category2" readonly></input>
							</div>
							
							<div class="form-group">
								<label for="payment">지출 금액</label> <input type="text"
									class="form-control" id="payment2" ></input>
							</div>
							<div class="form-group">
								<label for="regDate">지출 날짜</label> <input type="text"
									class="form-control" id="regDate2" readonly></input>
							</div>
							<div class="form-group">
								<label for="location">장소</label> <input type="text"
									class="form-control" id="location2" readonly></input>
							</div>
							<div class="form-group">
								<label for="content">메모</label> <input type="text"
									class="form-control" id="content2" readonly></input>
							</div>

							<button type="button" class="btn btn-default" id="intro-modify"
								onClick="oViewChange">수정</button>
							<button type="button" class="btn btn-default" id="modify"
								style="display: none" onClick="reverseDisplay()">완료</button>

							<button type="button" class="btn btn-default" id="intro-modify"
								onClick="oViewChange">수정</button>
							<button type="button" class="btn btn-default" id="modify"
								style="display: none" onClick="reverseDisplay()">완료</button>

						</form>

					</div>
					<!-- Modal Footer  -->
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

	<!-- ------------------------------------------------------------ -->







	<!-- Modal -->
	<div class="modal fade" id="inputOutcome1" role="dialog">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">지출 작성</h4>
				</div>
				<div class="modal-body">

					<form role="form" id="save-schedule">

						<div class="form-group">
							<label for="category">지출 유형</label> 
							<select class="form-control" id="category1" name="category"  
										style="height: 40px; width:230px; font-size: medium;">
										<option value="정비비">정비비</option>
										<option value="유지비">유지비</option>
									</select>
						</div>
						<div class="form-group">
							<label for="payment">지출 금액</label> <input type="text"
								class="form-control" id="payment1" name="payment" 
								placeholder="payment" />
						</div>
						<div class="form-group">
							<label for="regDate">지출 날짜</label> <input type="date"
								class="form-control" id="regDate1" name="regDate"
								placeholder="regDate" />
						</div>
						<div class="form-group">
							<label for="location">장소</label> <input type="text"
								class="form-control" id="location1" name="location"
								placeholder="location" />
						</div>
						<div class="form-group">
							<label for="content">메모</label> <input type="text"
								class="form-control" id="content1" name="content"
								placeholder="content" />
						</div>
						<button type="button" id="save" class="btn btn-default"
							data-dismiss="modal">저장</button>
					</form>

				</div>

				<!-- Modal Footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>

	</div>







		<!-- -------------------------------------------------------------------------------------- -->

		

























</body>
</html>

