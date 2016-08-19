<%@page import="com.car.model.dto.Outcome"%>
<%@page import="com.car.model.dao.OutcomeDao"%>
<%@page import="com.car.model.dto.Carhistory"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8" />
<title>지출 입력</title>

<!-- <script src="/car/resources/js/jquery-1.12.4.js"></script> -->
<!-- <script src="/car/resources/js/jquery.js"></script> -->
<script type="text/javascript">

    var $messageBox = $.parseHTML('<div id="alertBox"></div>');
    $("content").append($messageBox);

    $($messageBox).dialog({
        open: $($messageBox).append(msg),
        title: "경고창",
        autoOpen: true,
        modal: true,
        buttons: {
            OK: function () {
                $("#alertBox").dialog("close");
            }
        }
    });


$(function () {
    $.jQueryAlert("메세지를 입력해주세요");
});


</script>
</head>

<body>
	<div style="padding-left: 100px"> 지출 입력</div>
		<br/><br/>
					<form action="outcomewrite.action" method="post">
						<table class="swell" style="width: 70%; border: 2px solid white;">
							<tr class="bfile">
								<th style="width: 200px">지출 항목</th>
								<td style="width: 900px">
									<select class="form-control" id="category" name="category" 
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
								<th>장소</th>
								<td>
									<input class="form-control" type="text" name="location"
									style="height: 20px; width: 220px;" />
								</td>
							</tr>
							<tr>
								<th>내용</th>
								<td><input type="hidden" name="carindex" value="${ carindex }" />
									<textarea class="form-control" name="content" cols="35" rows="15" style="font-size: small;"></textarea>
								</td>
							</tr>
						</table>

						<br />
						<br />
			
						<div class="bbtn">
							<!-- 아래 a 링크는 input type='submit' 버튼을 누르는 효과 발생 -->
							<a href="javascript:document.forms[0].submit();">저장</a> 
								&nbsp;&nbsp; 
							<a href="/car/carhistory/list.action">취소</a>
						</div>
					</form>
				
			<br />
			<br />
			<br />
			<br />
			<br />
	

</body>
</html>