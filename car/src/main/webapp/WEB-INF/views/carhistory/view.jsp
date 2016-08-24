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



</head>
<body>
<body>
<jsp:include page="/WEB-INF/views/include/head.jsp" />

	<div>

		<div id="content">
		
		<!-- 항목별 검색 -->
			
			<table style="margin: auto;" class="type11" id="carlist">
				<tr>
					<th style="text-align: center;" scope="cols"><input type="hidden" value="멤버" />번호</th>
					<th style="text-align: center;" scope="cols">항목</th>
					<th style="text-align: center;" scope="cols">날짜</th>
					<th style="text-align: center;" scope="cols">금액</th>
					<th style="text-align: center;" scope="cols">리터</th>	
				</tr>	
					<c:forEach var="o" items="${ outcomes }">
						<tr id="viewOutcome"
							data-toggle="modal" data-target="#viewO" data-hno="${ o.historyNo }" >
						
							<td>
								<input type="hidden" value="${ o.historyNo }" id="historyNo" />
								${ o.historyNo }
							</td>
							<td>${ o.category }</td>
							<td><fmt:formatDate value="${ o.regDate }"
									pattern="yyyy-MM-dd" var="regDate" /> ${ regDate }</td>
							<td>${ o.payment }</td>
							<td></td>
						</tr>
				
						<div class="modal fade" id="viewO" role="dialog">
							<div class="modal-dialog modal-md">
								<div class="modal-content">
									
									<div class="modal-header">	
										<button type="button" class="close" data-dismiss="modal">&times;</button>										
										<h4 class="modal-title">지출 상세 내역</h4>
									</div>
									
									<div class="modal-body">
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
											
											<button type="button" class="btn btn-default" 
											id="deleted" data-dismiss="modal">삭제</button>												
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
						<td>
							<input type="hidden" value="${ f.historyNo }" />
							${ f.historyNo }
						</td>
						<td>${ f.category }</td>
						<td><fmt:formatDate value="${ f.regDate }"
								pattern="yyyy-MM-dd" var="regDate" /> ${ regDate }</td>
						<td><input type="hidden" value="${ f.payment }" id="fpayment"/>${ f.payment }</td>
						<td>${ f.liter }</td>
					</tr>
					
					<div class="modal fade" id="viewF" role="dialog">
						<div class="modal-dialog modal-md">
							<div class="modal-content">
								
								<div class="modal-header">	
									<button type="button" class="close" data-dismiss="modal">&times;</button>										
									<h4 class="modal-title">주유 상세 내역</h4>
								</div>
								
								<div class="modal-body">
									
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
										
										<button type="button" class="btn btn-default" 
										id="deleted2" data-dismiss="modal">삭제</button>																													
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

</body>
</html>

