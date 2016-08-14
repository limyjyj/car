<%@page import="com.car.model.dto.Reservation"%>
<%@page import="com.car.model.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8" />
<title>예약수정</title>

</head>
<body>

	<div id="pageContainer">

	
		
		<div style="padding-top: 25px; text-align: center">
			<div id="inputcontent">
				<div id="inputmain">
					<div class="inputsubtitle">예약 수정하기</div>
					<form action="update.action" method="post">
						
						<input type='hidden' name="reservationNo"
							value="${ reservation.reservationNo }" /> <input type='hidden'
							name="pageno" value="${ pageno }" />
						<table>
							
							<tr>
								<th>작성자</th>
								<td>	${ sessionScope.loginuser.memberId }
								</td>
							</tr>
							
							<tr>
								<th>출발지</th>
								<td>	<input class="form-control" type="text" name="departure"
										style="width: 100px" />
								</td>
							</tr>
							
							<tr>
								<th>도착지</th>
								<td>	<input class="form-control" type="text" name="arrival"
										style="width: 100px" />
								</td>
							</tr>
							
							<tr>
					<th>시작날짜</th>
					<td><input type="date" name="startDate"
										style="width: 100px" /></td>
				</tr>
					
				<tr>
					<th>끝날짜</th>
					<td><input type="date" name="endDate"
										style="width: 100px" /></td>
				</tr>
							<tr>
								<th>내용</th>
								<td><textarea name="content" >
								${resrvation.content }</textarea>
								</td>
							</tr>
						</table>
						<div class="buttons">
							<!-- 아래 a 링크는 input type='submit' 버튼을 누르는 효과 발생 -->
							<%-- <a href="javascript:document.forms[0].submit();">수정완료</a>
							&nbsp;&nbsp; 
							<a
								href='detail.action?reservationno=${reservation.reservationNo }&pageno=${pageno}'>취소</a> --%>
								
					<input id='submitbutton' type="submit" value="수정완료"
						style="height: 25px" /> <input type="button" value="취소"
						style="height: 25px" onclick="location.href='detail.action?reservationno=${reservation.reservationNo }&pageno=${pageno}';" />			
						</div>
					</form>
				</div>
			</div>

		</div>
	</div>

</body>
</html>