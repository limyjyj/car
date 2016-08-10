<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>

<html>
<head>
</head>

<body>


	<div id="inputcontent">
		<br /> <br />
		<div id="inputmain">
			<div class="inputsubtitle">회원기본정보</div>

			<form id="registerform" action="register.action" method="post">
				<!-- 상대경로표시 -->

				<table>
					<tr>

						<th>아이디(ID)</th>
						<td><input type="text" id="memberId" name="memberId"
							style="width: 280px" /></td>
					</tr>

					<tr>
						<th>비밀번호</th>
						<td><input type="password" id="passWd" name="passWd"
							style="width: 250px" /></td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td><input type="password" id="confirm" name="confirm"
							style="width: 250px" /> <!-- <input style="height: 25px"type="button" value="일치여부" onclick="pwconfirm();"> -->
						</td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" id="name" name="name"
							style="width: 280px" /></td>
					</tr>
					<tr>
						<th>성별</th>
						<td><select id="gender" name="gender">
								<option value="male">남자</option>
								<option value="female">여자</option>
						</select></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input type="text" id="phone" name="phone"
							style="width: 280px" /></td>
					</tr>


				</table>

				<div class="buttons">


					<div id="using" style="display: none">

						<input id='submitbutton' type="button" value="등록"
							style="height: 25px" /> <input type="button" value="취소"
							style="height: 25px" onclick="location.href='../home.action';" />
					</div>

				</div>
			</form>
		</div>
		<br /> <br /> <br />
	</div>


</body>
</html>