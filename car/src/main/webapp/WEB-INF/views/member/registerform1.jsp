<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<html>
<head>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/head.jsp" />
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	
	<div class="col-md-12">
		<div class="page-header">
			<h1>회원가입</h1>
		</div>
		<form class="form-horizontal" action="register.action" method="post">
			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputEmail">아이디</label>
				<div class="col-sm-6">
					<input class="form-control" id="memberId" type="text" name="memberId"
						placeholder="아이디">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputPassword">비밀번호</label>
				<div class="col-sm-6">
					<input class="form-control" id="passWd" type="password" name="passWd"
						placeholder="비밀번호">
					<p class="help-block">숫자, 특수문자 포함 8자 이상</p>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputPasswordCheck">비밀번호
					확인</label>
				<div class="col-sm-6">
					<input class="form-control" id="confirm" type="password"
						placeholder="비밀번호 확인">
					<p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputName">이름</label>
				<div class="col-sm-6">
					<input class="form-control" id="name" type="text" name="name"placeholder="이름">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputNumber">휴대폰번호</label>
				<div class="col-sm-6">
					<div class="input-group">
						<input type="tel" class="form-control" id="phone" name="phone"
							placeholder="- 없이 입력해 주세요" />
					</div>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputNumber">성별</label>
				<div class="col-sm-6">
					<div class="input-group">
			<select id="gender" name="gender">
				<option value="male">남자</option>
				<option value="female">여자</option>
			</select></div></div></div>

			<div class="form-group">
				<label class="col-sm-3 control-label" for="inputAgree">약관 동의</label>
				<div class="col-sm-6" data-toggle="buttons">
					<label class="btn btn-warning active"> <input id="agree"
						type="checkbox" autocomplete="off" checked> <span
						class="fa fa-check"></span>
					</label> <a href="#">이용약관</a> 에 동의 합니다.
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-12 text-center">
					<button class="btn btn-primary" type="submit">
						회원가입<i class="fa fa-check spaceLeft"></i>
					</button>
					<button class="btn btn-danger" type="submit">
						가입취소<i class="fa fa-times spaceLeft"></i>
					</button>
				</div>
			</div>
		</form>
		<hr>
	</div>

</body>
</html>