<%@page import="com.car.model.dto.Outcome"%>
<%@page import="com.car.model.dto.Carhistory"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8" />
<title>수정</title>

<%-- <jsp:include page="/WEB-INF/views/include/head.jsp" /> --%>
</head>
<body>
<%-- <jsp:include page="/WEB-INF/views/include/header.jsp" /> --%>
	
	<br/><br/>	
	<div class="bdiv">지출 내역 수정</div>
	<br/><br/>
	
			<form action="update.action" method="post">
			<input class="form-control" type='hidden' name="outcomeNo"value="${ outcomeNo }" /> 
				<table class="swell" style="width: 50%; border: 2px solid white;">
					<tr>
						<th>번호</th>
						<td>
							<input type="hidden" name="outcomeNo" value="${ outcomeNo }"></input>
							${ outcomeNo }
						</td>		
					</tr>	
					<tr>
						<th>지출 항목</th>
						<td style="width: 900px">
							<select class="form-control" id="cartegory" name="Cartegory" 
								style="height: 40px; width:230px; font-size: medium;">
								<option value="정비비">정비비</option>
								<option value="유지비">유지비</option>
							</select>
						</td>	
					</tr>	
					<tr>
						<th>지출 금액</th>
						<td>
							<input class="form-control" type="text" name="payment"
								style="height: 20px; width: 220px;" />
						</td>
					</tr>
					<tr>
						<th>지출 날짜</th>
						<td style="width: 200px; font-size: x-large;; padding-left:50px; ">
							<input class="form-control" type="date" name="regDate" />
						</td>
					</tr>
					<tr>
						<th>지출 장소</th>
						<td>
							<input class="form-control" type="text" name="location"
							style="height: 20px; width: 220px;" />
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<textarea class="form-control" name="content" cols="35" rows="15" style="font-size: small;">
${ outcome.content }
							</textarea>
						</td>
					</tr>
				</table>
		
				<div class="bbtn">
					<a href="javascript:document.forms[0].submit();">글쓰기</a>
					&nbsp;&nbsp; 
					<a href='detail.action?outcomeno=${ outcome.outcomeNo }'>취소</a>
				</div>
			</form>
			<br/><br/>

</body>
</html>