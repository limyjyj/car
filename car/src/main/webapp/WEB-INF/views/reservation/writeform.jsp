<%@page import="com.car.model.dto.Reservation"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8" />
<title>글쓰기</title>

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
			<div class="bdiv"> 게시판 글 쓰기</div>
		<br/><br/>
					<form action="write.action" method="post" enctype="multipart/form-data">
						<table class="swell" style="width: 70%; border: 2px solid white;">
							<tr class="bfile">
								<th style="width: 200px">종류</th>
								<td style="width: 900px">
									<select class="form-control" id="boardkind" name="boardKind" 
										style="height: 40px; width:230px; font-size: medium;">
									<c:if test="${loginuser.memberType=='admin'}">
										<option value="공지">공지사항</option>
									</c:if>
										<option value="질문">질문있어요</option>
										<option value="후기">후기게시판</option>
									</select>
								</td>
							</tr>

							<tr>
								<th>제목</th>
								<td>
									<input class="form-control" type="text" name="boardTitle"
									style="height: 20px; width: 220px;" />
								</td>
							</tr>
							<tr>
								<th>작성자</th>
								<td style="width: 200px; font-size: x-large;; padding-left:50px; "><font color="#0a9e36">
									<input class="form-control" type="hidden" name="memberId" value="${ loginuser.memberId }" />
									${ loginuser.memberId }
								</font></td>
							</tr>
							<tr>
								<th>첨부자료</th>
								<td>
									<input class="form-control" type="file" name="attach" style="width: 200px; height: 15px; font-size: small;" />
								</td>
							</tr>
							<tr>
								<th>내용</th>
								<td>
									<textarea class="form-control" name="boardContent" cols="35" rows="15" style="font-size: small;"></textarea>
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