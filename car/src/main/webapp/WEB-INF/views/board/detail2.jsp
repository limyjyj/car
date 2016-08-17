<%-- <%@page import="com.mvcdemoweb.model.dto.BoardComment"%> --%>
<%@page import="com.car.model.dto.Member"%>
<%@page import="com.car.model.dto.Board"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>

<html>
<head>

<meta charset="utf-8" />
<title>글쓰기</title>
<jsp:include page="/WEB-INF/views/include/head.jsp" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#delete')
				.on(
						'click',
						function(event) {
							var boardNo = $('#boardNo').val();
							var result = confirm('삭제 하시겠습니까?');
							if (result) {
								//yes
								location.href = ('/car/board/delete2.action?boardNo=' + boardNo);
							} else {
								//no
							}
						});
	});
</script>

</head>
<body>

	<% pageContext.include("/WEB-INF/views/include/header.jsp"); %>

	<div id="inputcontent">
		<div id="inputmain">
			<!-- <div class="inputsubtitle">게시판 글 내용</div> -->

			<table style="text-align: center;">
				<tr>
					<th style="text-align: center;">제목</th>
					<td>${ board.title }</td>
				</tr>
				<tr>
					<th style="text-align: center;">작성자</th>
					<td><input type="hidden" name="memberId"
						value="${ loginuser.memberId }" /> 관리자</td>
				</tr>
				<tr>
					<th style="text-align: center;">작성일</th>
					<td><fmt:formatDate value="${ board.regDate }"
							pattern="yyyy-MM-dd" var="regDate" /> ${ regDate }</td>
				</tr>

				<tr>
					<th style="text-align: center; vertical-align: middle;">내용</th>
					<td>${ board.content }</td>
				</tr>

			</table>

			<div>

				<div>
					<input id="delete" type="button" value="삭제" style="height: 40px" />
					<input id="boardNo" type="hidden" value="${ board.boardNo }" />
				</div>
				<div>
					<input type="button" value="수정" style="height: 40px"
						onclick="location.href='edit2.action?boardNo=${ board.boardNo }';" />
				</div>
				<div>
					<input type="button" value="목록보기" style="height: 40px"
						onclick="location.href='list2.action';" />
				</div>
			</div>
		</div>
	</div>


	<br />
	<br />


	<form id="comentform" action="writecoment.action" method="post">

		<input type="hidden" name="boardNo" value="${ board.boardNo }" />
		<input type="hidden" name="pageno" value="${ pageno }" />
		<table style="width: 600px; border: solid 1px; margin: 0 auto">
			<tr>
				<td style="width: 550px">
				<textarea name="content" style="width: 550px" rows="3"></textarea></td>
				<td style="width: 50px; vertical-align: middle"><a
					href="javascript:document.getElementById('comentform').submit();"
					style="text-decoration: none"> 댓글<br />등록
				</a></td>
			</tr>
		</table>
	</form>
	
	<hr align="center" style="width: 600px;" />


	<!-------------------------------------------------------->

	
	<h4 id="nodata" style="text-align: center">작성된 댓글이 없습니다.</h4>
	
	<!-- comment 표시 영역 -->
	<script type="text/javascript">
		var v = null, e = null;
		function toggleCommentStatus(comentNo, edit) {
			if (v != null) {
				v.style.display = edit ? 'block' : 'none';
				e.style.display = edit ? 'none' : 'block';
			}
			v = document.getElementById("comentview" + comentNo);
			e = document.getElementById("comentedit" + comentNo);

			v.style.display = edit ? 'none' : 'block';
			e.style.display = edit ? 'block' : 'none';
		}
		function deleteComent(comentNo, boardNo, pageNo) {
			var yes = confirm(comentNo + '번 댓글을 삭제할까요?');
			if (yes) {
				location.href = 'deletecoment.action?comentno=' + comentNo
						+ "&boardno=" + boardNo + "&pageno=" + pageNo;
			}
		}
	</script>
	<table style="width: 600px; border: solid 1px; margin: 0 auto">
		<c:forEach var="coment" items="${ coment }" > 
		<tr>
			<td style="text-align: left; margin: 5px; border-bottom: solid 1px">

				<div id='comentview${ coment.comentNo }'>
				 ${ coment.writer } &nbsp;&nbsp;
					<fmt:formatDate value="${ coment.regDate }"
						pattern="yyyy-MM-dd" var="regDate" />
					${ regDate }  <br />
					<br /> <span> ${ coment.content } </span> <br />
					<br />
					<div>
						<a href="javascript:toggleComentStatus(${ coment.comentNo }, true);">편집</a>
						&nbsp; 
						<a href="javascript:deleteComent(${ coment.comentNo }, ${ board.boardNo }, ${ pageNo })">삭제</a>
					</div>
					
				</div>

				<div id='updateComent${ coment.comentNo }' style="display: none">
					
					<br />
					<br />
					<form id="comenteditform${ coment.comentNo }" action="updatecoment.action" method="post">
						<input type="hidden" name="boardno" value="${ board.boardNo }" /> 
							<input type="hidden" name="pageno" value="${ pageNo }" /> 
							<input type="hidden" name="comentno" value="${ coment.comentNo }" />
						<textarea name="content" style="width: 600px" rows="3" maxlength="200">${ coment.content }</textarea>
					</form>
					<br />
					<div>
						<a href="javascript:document.getElementById('comenteditform${ coment.comentNo }').submit();">수정</a>
						&nbsp; 
						<a href="javascript:toggleComentStatus(${ coment.comentNo }, false);">취소</a>
					</div>
				</div>

			</td>
		</tr>
	</c:forEach>

	</table>
	


	<br />
	<br />
	<br />
	<br />
	<br />




</body>
</html>