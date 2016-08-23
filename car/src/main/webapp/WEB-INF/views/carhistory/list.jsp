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

//선택한 차량내역 리스트 보기(index해결)
$(function() {
	$('#index').on(
			'change',
			function(event) {
				var url = "/car/carhistory/view.action?carindex="
						+ $('#index').val();
				$("#carlist").load(url);
			});
});		

//Outcome
function changeReadOnlyAttribute() {
	$("#category2").attr("readonly",false);
	$("#regDate2").attr("readonly",false);
	$("#payment2").attr("readonly",false);
	$("#location2").attr("readonly",false);
	$("#content2").attr("readonly",false);
	changeDisplay();
	}
function changeReadonly() {
	$("#category2").attr("readonly",true);
	$("#regDate2").attr("readonly",true);
	$("#payment2").attr("readonly",true);
	$("#location2").attr("readonly",true);
	$("#content2").attr("readonly",true);
	reverseDisplay();
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
		//내역 작성 이벤트
	$('#inputOutcome').on('click', function(event) {
		$.ajax("/car/carhistory/outcomewrite.action?carindex=" + $('#index').val(), {

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
		$.ajax({
			url : "/car/carhistory/outcomewrite.action?carindex=" + $('#index option:selected').val(),
			type : "post",
			data : outcome,
			/* contentType: "application/json",  */
			success : function(data, status, xhr) {					
				alert("저장했습니다.");									
				//location.reload();
			},
			error : function(request, status, error) {
				alert("저장에 실패 했습니다. 다시 시도해 주세요.");
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
							$("#modify").attr("data-hhno", historyno);
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
		var historyno = $(this).attr('data-hhno');
		var outcome;						
		outcome = {
			"category" : $('#category2').val(),
			"regDate" : $('#regDate2').val(),
			"payment" : $('#payment2').val(),
			"location" : $('#location2').val(),
			"content" : $('#content2').val()
		};			
		$.ajax({			
			url : "/car/carhistory/outcomeupdate.action?historyNo=" + historyno ,
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

	
//-------------------------------------------------------------------------------
//Fuel
function changeReadOnlyAttribute2() {
	$("#category4").attr("readonly",false);
	$("#regDate4").attr("readonly",false);
	$("#perLiter4").attr("readonly",false);
	$("#liter4").attr("readonly",false);
	$("#payment4").attr("readonly",true);
	$("#location4").attr("readonly",false);
	$("#content4").attr("readonly",false);
	changeDisplay2();
	}
function changeReadonly2() {
	$("#category4").attr("readonly",true);
	$("#regDate4").attr("readonly",true);
	$("#perLiter4").attr("readonly",true);
	$("#liter4").attr("readonly",true);
	$("#payment4").attr("readonly",true);
	$("#location4").attr("readonly",true);
	$("#content4").attr("readonly",true);
	reverseDisplay2();
	}
function changeDisplay2() {
	$("#intro-modify2").css("display", "none");
	$("#modify2").css("display", "");
	$("#return").css("display", "none");
	$("#cancle").css("display", "");
}
function reverseDisplay2() {
	$("#intro-modify2").css("display", "");
	$("#modify2").css("display", "none");
	$("#return").css("display", "");
	$("#cancle").css("display", "none");	
}	

$(function() {
		//내역 작성 이벤트
	$('#inputFuel').on('click', function(event) {
			//실시간 계산		 	
			k=function() {
				p = parseInt($("#perLiter3").val()); 
				l = parseInt($("#liter3").val()); 
				m = $("#payment3").val(); 
			
				switch($("#e").text()){ 
					case "+": 
						$("#payment3").val(p+l);break; 
					case "-": 
						$("#payment3").val(p-l);break; 
					case "*": 
						$("#payment3").val(p*l);break; 
					case "/": 
					if(!vb); return false; 
						$("#payment3").val(p/l);break; 
					} 
				} 
				$("#perLiter3, #liter3").change(k).keydown(function(e){ 
					switch(e.keyCode){ 
					case 107: 
						$("#e").text("+"); 
						e.preventDefault(); 
						return false; 
						break; 		
					case 109: 
						$("#e").text("-"); 
						e.preventDefault(); 
						return false; 
						break; 
					case 106: 
						$("#e").text("*"); 
						e.preventDefault(); 
						return false; 
						break; 		
					case 111: 
						$("#e").text("/"); 
						e.preventDefault(); 
						return false; 
						break; 
						} 
					}).keyup(function(){ 
				k(); 
			});	
			
		$.ajax("/car/carhistory/fuelwrite.action?carindex=" + $('#index').val(), {
		});
	});
	//insert	
	$('#save2').on('click', function(event) {			
		var fuel;			
	
		fuel = {
			
			"category" : $('#category3').val(),
			"regDate" : $('#regDate3').val(),
			"perLiter" : $('#perLiter3').val(),
			"liter" : $('#liter3').val(),
			"payment" : $('#payment3').val(),
			"location" : $('#location3').val(),
			"content" : $('#content3').val()
		};
		$.ajax({
			url : "/car/carhistory/fuelwrite.action?carindex=" + $('#index option:selected').val(),
			type : "post",
			data : fuel,
			/* contentType: "application/json",  */
			success : function(data, status, xhr) {					
				alert("저장했습니다.");									
				//location.reload();
			},
			error : function(request, status, error) {
				alert("저장에 실패 했습니다. 다시 시도해 주세요.");
			}
		});
	});		
 	// view  
	$(function() {
			$('tr#viewFuel').on('click',
				function(event) {												
				var historyno = $(this).attr('data-fhno');
				
					$.ajax("/car/carhistory/fuelview.action?historyNo=" + historyno + "&carindex=" + $('#carindex').val()
							,{						
						success : function(data) {								
							eval("var fuel = " + data);
							$("#modify2").attr("data-fhno2", historyno);
							$("#category4").val(fuel.category);
							$("#regDate4").val(fuel.regDate);
							$("#perLiter4").val(fuel.perLiter);
							$("#liter4").val(fuel.liter);
							$("#payment4").val(fuel.payment);
							$("#location4").val(fuel.location);
							$("#content4").val(fuel.content);								
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
	$('button#modify2').on('click', function(event) {

		var historyno = $(this).attr('data-fhno2');
					
		var fuel;	
		
		fuel = {
			"category" : $('#category4').val(),
			"regDate" : $('#regDate4').val(),
			"perLiter" : $('#perLiter4').val(),
			"liter" : $('#liter4').val(),
			"payment" : $('#payment4').val(),
			"location" : $('#location4').val(),
			"content" : $('#content4').val()
		};			
		$.ajax({			
			url : "/car/carhistory/fuelupdate.action?historyNo=" + historyno ,
			type : "post",
			data : fuel,			
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
				
				<select id="index" name="index">
					<option value="/car/carhistory/list.action">선택하세요</option>
					<c:forEach var="car" items="${ cars }" varStatus="index">
						<option id="carindex" value="${ car.carindex }">${ car.carno }</option>
					</c:forEach>
				</select> 
				
				<!-- Outcome -->
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
													style="height:50px; width:230px; font-size: medium;">
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
												<label for="content">지출 메모</label> 
												<input type="text" class="form-control" 
												id="content1" name="content" placeholder="지출 메모 입력" />
											</div>											
											<button type="button" style="margin-left: 250px;" 
											id="save" class="btn btn-default" data-dismiss="modal">저장</button>
									</div>
			
									<!-- Modal Footer -->
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
									</div>
								</div>
							</div>
						</div>
						
				<!-- Fuel -->
				<input class="btn btn-danger" type="button"  value="주유입력" style="height: 30px" 
					data-toggle="modal" id="inputFuel" data-target="#fuelWrite"/>
					
						<div class="modal fade" id="fuelWrite" role="dialog">
							<div class="modal-dialog modal-md">
								<div class="modal-content">
									
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h4 class="modal-title">주유 내역 작성 </h4>
									</div>
							
										<div class="modal-body">										
											<div class="form-group">
												<label for="category">주유 항목</label> 
												<select class="form-control" id="category3" name="category" 
													style="height:50px; width:230px; font-size: medium;">
												<option value="주유비">주유비</option>
												</select>
											</div>
											<div class="form-group">
												<label for="regDate">주유 날짜</label>
												<input type="Date" class="form-control" 
												id="regDate3" name="regDate" placeholder="주유 날짜 입력" />
											</div>
								
											<div class="form-group">
												<label for="perLiter">리터당 금액<span id="e">*</span></label> 
												<input type="text" class="form-control" 
												id="perLiter3" name="perLiter" placeholder="리터당 금액" value="0" />
											</div>
											
											<div class="form-group">
												<label for="liter">리터</label> 
												<input type="text" class="form-control" 
												id="liter3" name="liter" placeholder="리터" value="0" />
											</div>
											
											<div class="form-group">
												<label for="payment">총 금액</label> 
												<input type="text" class="form-control" 
												id="payment3" name="payment" placeholder="총 금액" 
												disabled="disabled" />
											</div>
											
											<div class="form-group">
												<label for="location">주유 장소</label> 
												<input type="text" class="form-control"
												id="location3" name="location" placeholder="주유 장소 입력" />
											</div>
											
											<div class="form-group">
												<label for="content">주유 메모</label> 
												<input type="text" class="form-control" 
												id="content3" name="content" placeholder="주유 메모 입력" />
											</div>
											
											<button type="button" style="margin-left: 250px;" 
											id="save2" class="btn btn-default" data-dismiss="modal">저장</button>
									</div>
			
									<!-- Modal Footer -->
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
									</div>
			
								</div>
							</div>
						</div>				
				</div>
			<br> <br>

			
			<table id="carlist" class="table table-striped" style="vertical-align:middle; width:1000px;">
				
				<tr style="height: 30px;text-align: center;">
					<td><input type="hidden" value="멤버" /></td>
					<td>번호</td>
					<td>항목</td>
					<td>날짜</td>
					<td>금액</td>
					<td>리터</td>
					<td></td>
				</tr>		
					
				<c:forEach var="o" items="${ outcomes }">
				<tr style="height:30px" align="center" id="viewOutcome"
						data-toggle="modal" data-target="#viewO" data-hno="${ o.historyNo }" >
						<td><input type="hidden" value="${ o.historyNo }" id="historyNo" /></td>
						<td>${ o.historyNo }</td>
						<td>${ o.category }</td>
						<td><fmt:formatDate value="${ o.regDate }"
								pattern="yyyy-MM-dd" var="regDate" /> ${ regDate }</td>
						<td>${ o.payment }</td>
						<td></td><td></td>
				</tr>
			
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
														style="height:50px; width:230px; font-size: medium;"
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
												<label for="content">지출 메모</label> 
												<input type="text" class="form-control" id="content2" readonly />
											</div>
											
				
											<button type="button" class="btn btn-default" 
											id="intro-modify" onClick="changeReadOnlyAttribute()">수정</button>										
																
											<button type="button" class="btn btn-default" 
											id="modify" style="display:none" onClick="changeReadonly()" 
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
					
				</c:forEach>

				<c:forEach var="f" items="${ fuels }">
					<tr style="height:30px" align="center" id="viewFuel"
						data-toggle="modal" data-target="#viewF" data-fhno="${ f.historyNo }">
						<td><input type="hidden" value="${ f.historyNo }" /></td>
						<td>${ f.historyNo }</td>
						<td>${ f.category }</td>
						<td><fmt:formatDate value="${ f.regDate }"
								pattern="yyyy-MM-dd" var="regDate" /> ${ regDate }</td>
						<td><input type="hidden" value="${ f.payment }" id="fpayment"/>${ f.payment }</td>
						<td>${ f.liter }</td>
						<td></td>
					</tr>
					
					<div class="modal fade" id="viewF" role="dialog">
						<div class="modal-dialog modal-md">
							<div class="modal-content">
								
								<div class="modal-header">	
									<button type="button" class="close" data-dismiss="modal">&times;</button>										
									<h4 class="modal-title">주유 상세 내역</h4>
								</div>
								
								<div class="modal-body">
									<form role="form">
										<div class="form-group">
											<label for="category">주유 항목</label> 
											
												<select class="form-control" id="category4" name="category" 
													style="height:50px; width:230px; font-size: medium;"
													disabled="disabled">
													<option value="주유비">주유비</option>
												</select>
										</div>

										<div class="form-group">
											<label for="regDate">주유 날짜</label> 
											<input type="Date" class="form-control" id="regDate4" readonly />
										</div>
										
										<div class="form-group">
											<label for="perLiter">리터당 금액<span id="w">*</span></label> 
											<input type="text" class="form-control" id="perLiter4" readonly />
										</div>
										
										<div class="form-group">
											<label for="liter">리터</label> 
											<input type="text" class="form-control" id="liter4" readonly />
										</div>
										
										<div class="form-group">
											<label for="payment">총 금액</label> 
											<input type="text" class="form-control" id="payment4" readonly />
										</div>
										
										<div class="form-group">
											<label for="location">주유 장소</label> 
											<input type="text" class="form-control" id="location4" readonly />
										</div>
										
										<div class="form-group">
											<label for="content">주유 메모</label> 
											<input type="text" class="form-control" id="content4" readonly />
										</div>
										
			
										<button type="button" class="btn btn-default" 
										id="intro-modify2" onClick="changeReadOnlyAttribute2()">수정</button>										
															
										<button type="button" class="btn btn-default" 
										id="modify2" style="display:none" onClick="changeReadonly2()" 
										data-fhno2="${ f.historyNo }">완료</button>											
									</form>	
								</div>
								
								<!-- Modal Footer -->
								<div class="modal-footer">
									<button id="return" type="button" class="btn btn-default"
										data-dismiss="modal" onClick="reverseDisplay2()">확인</button>
									<button id="cancle" type="button" class="btn btn-default"
										data-dismiss="modal" style="display:none" onClick="reverseDisplay2()">취소</button>
								</div>
					
							</div>
						</div>
					</div>	
					
				</c:forEach>

			</table>


		</div>
	</div>

	<!-- ------------------------------------------------------------ -->






















</body>
</html>

