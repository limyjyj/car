<%@page import="com.car.model.dto.Car"%>
<%@page import="com.car.model.dao.CarDao"%>
<%@page import="com.car.model.dto.Carhistory"%>
<%@page import="com.car.model.dao.CarhistoryDao"%>
<%@page import="com.car.model.dto.Outcome"%>
<%@page import="com.car.model.dto.Fuel"%>


<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>

<html class="no-js" lang="en" xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org">
<head>	

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
	function changeReadOnlyAttribute() {
		$("#category2").attr("disabled",false);
		$("#regDate2").attr("readonly",false);
		$("#payment2").attr("readonly",false);
		$("#location2").attr("readonly",false);
		$("#content2").attr("readonly",false);
		changeDisplay();
		
		}

	function changeDisplay() {

		$("#intro-modify").css("display", "none");
		$("#modify").css("display", "");
		$("#return").css("display", "none");
		$("#cancle").css("display", "");
		
		
	}

	function reverseDisplay() {


		$("#intro-modify").css("display", "");
		$("#modify").css("display", "none");
		$("#return").css("display", "");
		$("#cancle").css("display", "none");
		
	}	
	
 	$(function() {
 		
 		//선택한 차량내역 리스트 보기
 		$(function() {
 			$('#status').on(
 					'change',
 					function(event) {
 						
 						var status=$("#status option:selected").val();
 				 		alert(status);
 						
 						var url = "/car/carhistory/view.action?carindex="
 								+ status;
 						$("#carlist").load(url);

 					});
 		});
 		
 		//날짜별 조회 이벤트
// 		$("#but").on('click', function(event) {
// 			var startDate = $('#startDate').val();
// 			var endDate = $('#endDate').val();
// 			var carNo = $("#status option:selected").text();

// 			$.ajax({
// 				url : "/car/carhistory/list.action",
// 				type : "post",
// 				data : {
// 					startDate : startDate,
// 					endDate : endDate,
// 					carNo : carNo
// 				},
// 				success : function(data) {
// 				}
// 			})
// 		})

		//버튼클릭시 발생이벤트
// 		$("#inputOutcome")
// 				.on(
// 						'click',
// 						function(event) {
// 							//alert($("#status").val());
// 							var carindex = $('#status').val();
// 							location.href = "/car/carhistory/outcomewriteform.action?carindex="
// 									+ $('#status').val();
// 						})
// 		$("#inputFuel")
// 				.on(
// 						'click',
// 						function(event) {
// 							//alert($("#status").val());
// 							var carindex = $('#status').val();
// 							location.href = "/car/carhistory/fuelwriteform.action?carindex="
// 									+ $('#status').val();
// 						})
		

 		//내역 작성 이벤트
		$('#inputOutcome').on('click', function(event) {
			$.ajax("/car/carhistory/outcomewrite.action?carindex=" + $('#carindex').val(), {
			});
		});

		//insert  	
		$('#save').on('click', function(event) {
			
			
			var outcome;
			
			outcome = {
				"category" : $('#category1').val(),
				"regDate" : $('#regDate1').val(),
				"payment" : $('#payment1').val(),
				"location" : $('#location1').val(),
				"content" : $('#content1').val()
			};

			/* groupSchedule = JSON.stringify(groupSchedule); */

			$.ajax({
				url : "/car/carhistory/outcomewrite.action?carindex=" + $("#status option:selected").val(),
				type : "post",
				data : outcome,
				/* contentType: "application/json",  */
				success : function(data, status, xhr) {
					
					alert("저장했습니다.");
					//location.reload();
				},
				error : function(request, status, error) {
					alert("선택된 차량 번호가 없습니다. 차량 번호를 선택해 주세요.");
				}
			});
		});

		
	 	// view  
		$(function() {
				$('tr#viewOutcome').on('click',
					function(event) {		
				
					var historyno = $(this).attr('data-hno');
					
						$.ajax("/car/carhistory/outcomeview.action?historyNo=" + historyno + "&carindex=" + $('#carindex').val()
								,{
						
							success : function(data) {
								
								eval("var outcome = " + data);
								
								$("#category2").val(outcome.category);
								$("#regDate2").val(outcome.regDate);
								$("#payment2").val(outcome.payment);
								$("#location2").val(outcome.location);
								$("#content2").val(outcome.content);
								
								//location.reload();

							},

							error : function(request,
									status, error) {
								alert("작성된 내역이 없습니다.");								
							}
						});
					});
		 	});
		
		// modify  	
		$('button#modify').on('click', function(event) {
			
			var outcome;
			
			var historyno = $(this).attr('data-hhno');
			
			outcome = {
				"historyNo" : historyno,
				"category" : $('#category2').val(),
				"regDate" : $('#regDate2').val(),
				"payment" : $('#payment2').val(),
				"location" : $('#location2').val(),
				"content" : $('#content2').val()
			};
			$.ajax({			
				url : "/car/carhistory/outcomeupdate.action" ,
				type : "post",
				data : outcome,
				
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
						<option id="carindex" value="${ car.carindex }">${ car.carno }</option>
					</c:forEach>
				</select> 
				
				<input class="btn btn-danger" type="button" value="지출입력" style="height: 30px" 
					data-toggle="modal" id="inputOutcome" data-target="#outcomeWrite"/> 
			<div class="modal fade" id="outcomeWrite" role="dialog">
				<div class="modal-dialog modal-md">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
				
							<h4 class="modal-title">지출 내역 작성 </h4>
						</div>
				
							<div class="modal-body">
							
								<div class="form-group">
									<label for="category">지출 항목</label> 
									<select class="form-control" id="category1" name="category" 
										style="height: 40px; width:230px; font-size: medium;">
									<option value="정비비">정비비</option>
									<option value="유지비">유지비</option>
									</select>
								</div>
								
								<div class="form-group">
									<label for="regDate">지출 날짜</label>
									<input type="Date" class="form-control" 
									id="regDate1" name="regDate" placeholder="지출 날짜 입력" />
								</div>
								
								<div class="form-group">
									<label for="payment">지출 금액</label> 
									<input type="text" class="form-control" 
									id="payment1" name="payment" placeholder="지출 금액 입력" />
								</div>
								
								<div class="form-group">
									<label for="location">지출 장소</label> 
									<input type="text" class="form-control"
									id="location1" name="location" placeholder="지출 장소 입력" />
								</div>
								
								<div class="form-group">
									<label for="content">지출 내용</label> 
									<input type="text" class="form-control" 
									id="content1" name="content" placeholder="지출 내용 입력" />
								</div>
								<button type="button" style="margin-left: 250px;" id="save" class="btn btn-default" data-dismiss="modal">저장</button>
						</div>

						<!-- Modal Footer -->
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">취소</button>
						</div>

					</div>
				</div>
			</div>
				
			<input class="btn btn-danger" type="button"  value="주유입력" style="height: 30px" 
				data-toggle="modal" id="inputFuel" data-target="#fuelWrite"/>

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
				
					<div class="modal fade" id="viewO" role="dialog">
						<div class="modal-dialog modal-md">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									
									<h4 class="modal-title">지출 상세 내역</h4>
								</div>
								
								<div class="modal-body">
					
									<form role="form">
					
										<div class="form-group">
											<label for="category">지출 항목</label> 
											<select class="form-control" id="category2" name="category" 
												style="height: 40px; width:230px; font-size: medium;"
												disabled="disabled">
												<option value="정비비">정비비</option>
												<option value="유지비">유지비</option>
											</select>
					
										</div>
										<div class="form-group">
											<label for="regDate">지출 날짜</label> 
											<input type="Date" class="form-control" id="regDate2" readonly />
										</div>
										<div class="form-group">
											<label for="payment">지출 금액</label> 
											<input type="text" class="form-control" id="payment2" readonly />
										</div>
										<div class="form-group">
											<label for="location">지출 장소</label> 
											<input type="text" class="form-control" id="location2" readonly />
										</div>
										<div class="form-group">
											<label for="content">지출 내용</label> 
											<input type="text" class="form-control" id="content2" readonly />
										</div>
										
										<button type="button" class="btn btn-default" id="intro-modify" onClick="changeReadOnlyAttribute()">수정</button>
										<button type="button" class="btn btn-default" id="modify" style="display:none" onClick="reverseDisplay()"
										data-hhno="${ o.historyNo }">완료</button>
										
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
								
											
					<tr style="height: 30px" align="center" id="viewOutcome" data-toggle="modal" data-target="#viewO"
					data-hno="${ o.historyNo }">
						<td>
						<input type="hidden" value="${ o.historyNo }" id="historyNo" /></td>
						<td>${ o.historyNo }</td>
						<td>${ o.category }</td>
						<td><fmt:formatDate value="${ o.regDate }"
								pattern="yyyy-MM-dd" var="regDate" /> ${ regDate }</td>
						<td>${ o.payment }</td>
						<td></td>
					</tr>
				</c:forEach>

			</table>

<!-- 			<table class="table table-striped" align="center" width="700px"> -->

<!-- 				<tr style="height: 30px"> -->

<!-- 					<td>기간별 조회</td> -->
<!-- 					<td class="form-group"><label for="inputRegdate">기록시작일</label> -->
<!-- 						<input type="date" path="regdate" class="form-control" -->
<!-- 						placeholder="기록시작일" id="startDate" /></td> -->
<!-- 					<td class="form-group"><label for="inputRegdate">기록종료일</label> -->
<!-- 						<input type="date" path="regdate" class="form-control" -->
<!-- 						placeholder="기록종료일" id="endDate" /></td> -->

<!-- 				</tr> -->

<!-- 				<button type="button" id="but">조회</button> -->

<!-- 			</table> -->

		</div>
	</div>

	<!-- ------------------------------------------------------------ -->






















</body>
</html>

