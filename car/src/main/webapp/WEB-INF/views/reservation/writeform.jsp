<%@page import="com.car.model.dto.Reservation"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8" />
<title>예약하기</title>

<style> 
.swell th{
	padding: 10px;
}
.swell .form-control:hover{
	border: solid 1px white;
}
</style>
</head>

<body>
	

		<br/><br/>
			<div class="bdiv">예약 설정</div>
		<br/><br/>
					<form action="write.action" method="post">
						<table class="swell" style="width: 70%; border: 2px solid white;">
							<tr class="bfile">
								<th style="width: 200px">종류</th>
								<td style="width: 900px">
									<select class="form-control" id="reservationsearch" name="reservationsearch" 
										style="height: 30px; width:220px; font-size: medium;">
									
										<option value="실시간">실시간 카풀</option>
						
										<option value="정기">정기 카풀</option>
										
									</select>
								</td>
							</tr>


							<tr>
								<th>작성자</th>
								<td style="width: 200px; font-size: x-large;; padding-left:50px; "><font color="#0a9e36">
									<input class="form-control" type="hidden" name="memberId" value="${ sessionScope.loginuser.memberId }" />
									${ sessionScope.loginuser.memberId }
								</font></td>
							</tr>
							<tr>
								<th>목적</th>
								<td>
									<input class="form-control" type="text" name="type"
									style="height: 20px; width: 220px;" />
								</td>
							</tr>
							<tr>
								<th>타태워</th>
								<td>
									<input class="form-control" type="text" name="purpose"
									style="height: 20px; width: 220px;" />
								</td>
							</tr>
							
							
							 <tr>
								<th>시작날짜</th>
								<td><input type="date" name="startdate"
										style="width: 100px" /></td>
							</tr>
							 <tr>
								<th>끝날짜</th>
								<td><input type="date" name="enddate"
										style="width: 100px" /></td>
							</tr>
							<tr>
								<th>내용</th>
								<td>
									<textarea class="form-control" name="content" cols="35" rows="15" style="font-size: small;"></textarea>
								</td>
							</tr>
						</table>

						<br />
						<br />
			
						<div class="bbtn">
							<!-- 아래 a 링크는 input type='submit' 버튼을 누르는 효과 발생 -->
							<a href="javascript:document.forms[0].submit();">글쓰기</a> 
								&nbsp;&nbsp; 
							<a href="/car/reservation/list.action">목록보기</a>
						</div>
					</form>
				
			<br />
			<br />
			<br />
			<br />
			<br />
	

</body>
</html>