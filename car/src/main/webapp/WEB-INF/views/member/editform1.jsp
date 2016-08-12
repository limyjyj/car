<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8" />
<title>사용자등록</title>

<style type="text/css">
.error {
	color: red;
	font-weight: bold
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#delete').on('click',
				function(event) {
					var id = $('#ID').val();
					var result = confirm('탈퇴 하시겠습니까?');
					if (result) {
					//yes
					location.href = ('/car/member/delete.action?memberid=' + id);
					} else {
					//no
					}
				});
	});
</script>
</head>
<body>

	<div id="pageContainer">

		<c:import url="/WEB-INF/views/include/header.jsp" />

		<div id="inputcontent">
			<br />
			<br />
			<div id="inputmain">
				<div class="inputsubtitle">회원기본정보</div>

				<form:form action="edit.action" method="post">
					<table>
						<tr>
							<th>아이디(ID)</th>
							<td>
							<form:input path="memberId" cssStyle="width:280px" /> 
							<form:errors path="memberId" cssClass="error" element="div" /> <%-- 영문자, 숫자 조합 8개 15개 (대소문자, 숫자 반드시 혼용)  --%>
							</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="passWd"
								style="width: 280px" /> <form:errors path="passWd"
									cssClass="error" element="div" /> <%-- 영문자, 숫자 조합 8개 15개 (대소문자, 숫자 반드시 혼용)  --%>
							</td>
						</tr>
						<tr>
							<th>비밀번호 확인</th>
							<td><input type="password" name="confirm"
								style="width: 280px" /></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><form:input type="text" path="name"
									cssStyle="width:280px" /> <form:errors path="name"
									cssClass="error" element="div" /></td>
						</tr>

						<tr>
							<th>전화번호</th>
							<td><form:input type="text" path="phone"
									cssStyle="width:280px" /> <form:errors path="phone"
									cssClass="error" element="div" /></td>
						</tr>

						<%-- 모든 입력 요소에 대해 필수 입력 항목 처리 --%>
					</table>

					<div class="buttons">
						<input type="submit" value="등록" style="height: 25px" /> <input
							type="button" value="취소" style="height: 25px"
							onclick="location.href='list.action';" />
							 <input	 id="delete" type="button" value="탈퇴"
							style="height: 40px" /> <input id="ID" type="hidden" value="${ member.memberId }" />
						<!-- location.href='path' : path로 이동하는 javascript 명령 -->
					</div>
				</form:form>
			</div>
		</div>

	</div>

</body>
</html>