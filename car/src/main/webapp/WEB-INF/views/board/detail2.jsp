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
<script src="/car/resources/js/bootstrap.min.js"></script>

<style type="text/css">
.button {
	font-weight: bold;
	text-decoration: none;
	font-family: Arial;
	box-shadow: inset #ffffff 0px 5px 8px -1px, #ffdee9 1px 5px 2px;
	o-box-shadow: inset #ffffff 0px 5px 8px -1px, #ffdee9 1px 5px 2px;
	-moz-box-shadow: inset #ffffff 0px 5px 8px -1px, #ffdee9 1px 5px 2px;
	-webkit-box-shadow: inset #ffffff 0px 5px 8px -1px, #ffdee9 1px 5px 2px;
	background: #e6d6dc;
	background: -o-linear-gradient(90deg, #e6d6dc, #ffffff);
	background: -moz-linear-gradient(center top, #e6d6dc 5%, #ffffff 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #e6d6dc
		), color-stop(1, #ffffff));
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#e6d6dc',
		endColorstr='#ffffff');
	background: -webkit-linear-gradient(#e6d6dc, #ffffff);
	background: -ms-linear-gradient(#e6d6dc, #ffffff);
	background: linear-gradient(#e6d6dc, #ffffff);
	text-indent: 0px;
	line-height: 7px;
	-moz-border-radius: 14px;
	-webkit-border-radius: 14px;
	border-radius: 14px;
	text-align: center;
	vertical-align: middle;
	display: inline-block;
	font-size: 13px;
	color: #ce4869;
	width: 90px;
	height: 7px;
	padding: 13px;
	text-shadow: #f7c6d8 -1px -1px 0px;
	border-color: #ffe0eb;
	border-width: 1px;
	border-style: solid;
}

.button:active {
	box-shadow: inset #ffffff 0px 5px 8px -1px, #ffdee9 1px 0 2px;
	o-box-shadow: inset #ffffff 0px 5px 8px -1px, #ffdee9 1px 0 2px;
	-moz-box-shadow: inset #ffffff 0px 5px 8px -1px, #ffdee9 1px 0 2px;
	-webkit-box-shadow: inset #ffffff 0px 5px 8px -1px, #ffdee9 1px 0 2px;
	position: relative;
	top: 5px
}

.button:hover {
	background: #ffffff;
	background: -o-linear-gradient(90deg, #ffffff, #e6d6dc);
	background: -moz-linear-gradient(center top, #ffffff 5%, #e6d6dc 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ffffff
		), color-stop(1, #e6d6dc));
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff',
		endColorstr='#e6d6dc');
	background: -webkit-linear-gradient(#ffffff, #e6d6dc);
	background: -ms-linear-gradient(#ffffff, #e6d6dc);
	background: linear-gradient(#ffffff, #e6d6dc);
}

.view_titlebg01 {
	background: repeat-x #aeaeae;
	width: 100%;
	border-collapse: collapse;
}

.view_titlebg02 {
	padding: 3px 10px;
	font-size: 13px;
	COLOR: #ffffff;
	font-weight: bold;
	letter-spacing: -1px;
}

.view01 {
	font-size: 11px;
	width: 65px;
	padding: 4px 0 4px 18px;
	letter-spacing: -1px;
	background: no-repeat 8px 10px;
	border-bottom: 1px solid #dfdfdf;
	vertical-align: top;
}

.view02 {
	font-size: 12px;
	padding: 4px 10px;
	background: no-repeat left 6px;
	border-bottom: 1px solid #dfdfdf;
}

.board_title {
	border-collapse: collapse;
	width: 100%;
	border-top: 2px solid #f0f0f0;
	table-layout: fixed;
}

tbody {
	display: table-row-group;
	vertical-align: middle;
	border-color: inherit;
}

body, th, td, textarea, p, dt, dd, li, select, div {
	margin: 0;
	padding: 0;
	line-height: 150%;
	font-family: NanumGothic, '나눔고딕', '맑은 고딕', Tahoma, AppleGothic,
		sans-serif;
	color: #666;
}

.view_content {
	padding: 30px 15px 30px 15px;
	line-height: 150%;
}

.bbs_area_view {
	margin: 20px 0;
	padding: 20px 0 20px 0;
	border-top: 1px solid #ddd;
}

img {
	width: 200px;
}
</style>
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
		$('img#sms').on('click', function(event){
			var view = $('input#sc').val();
			$('#img').attr("src", $(this).attr('src'));
		})
	});
</script>

</head>
<body>

	<%
		pageContext.include("/WEB-INF/views/include/header.jsp");
	%>

	<div id="inputcontent">

		<br />

		<h3 style="text-align: center">후 기</h3>

		<br />

		<div id="inputmain">
			<!-- <div class="inputsubtitle">게시판 글 내용</div> -->

			<table style="text-align: center; margin: auto;" class="type11">
				<tr>
					<th style="text-align: center;" scope="cols">제목</th>
					<td>${ board.title }</td>
				</tr>
				<tr>
					<th style="text-align: center;" scope="cols">작성자</th>
					<td><input type="hidden" name="memberId"
						value="${ loginuser.memberId }" /> 관리자</td>
				</tr>
				<tr>
					<th style="text-align: center;" scope="cols">작성일</th>
					<td><fmt:formatDate value="${ board.regDate }"
							pattern="yyyy-MM-dd" var="regDate" /> ${ regDate }</td>
				</tr>

				<tr>
					<th style="text-align: center; vertical-align: middle" scope="cols">내용</th>
					<td style="height: 300px; width: 400px; vertical-align: middle">${ board.content }</td>
				</tr>

				<tr>
					<th style="text-align: center; vertical-align: middle" scope="cols">첨부파일</th>
					<td style="height: 300px; width: 400px; vertical-align: middle"	id="view">
					<img src="" id="img">
					</td>
				</tr>

			</table>
			<br />
			
			<div style="margin: auto; text-align: center;" id="select">
				<c:forEach items="${ boardupload }" var="b">
					<img id="sms" class="jbox-img img-rounded"
						style="height: 100px; width: 100px; vertical-align: middle"
						src="/car/resources/Upload/${ b.savedFileName }">
				</c:forEach>
			</div>
			
			<br />

			<div>

				<div style="text-align: center;">
					<input id="delete" value="삭제" class="button" /> <input
						id="boardNo" type="hidden" value="${ board.boardNo }" /> <input
						value="수정" class="button"
						onclick="location.href='edit2.action?boardNo=${ board.boardNo }';" />

					<input value="목록" class="button"
						onclick="location.href='list2.action';" />
				</div>
			</div>
		</div>
	</div>


	<br />
	<br />


	<form id="comentform" action="writecoment.action" method="post">

		<input type="hidden" name="boardNo" value="${ board.boardNo }" /> <input
			type="hidden" name="pageno" value="${ pageno }" />
		<table style="width: 600px; border: solid 1px; margin: 0 auto">
			<tr>
				<td style="width: 550px"><textarea name="content"
						style="width: 550px" rows="3"></textarea></td>
				<td style="width: 50px; vertical-align: middle"><a
					href="javascript:document.getElementById('comentform').submit();"
					style="text-decoration: none"> 댓글<br />등록
				</a></td>
			</tr>
		</table>
	</form>

	<hr align="center" style="width: 600px;" />


	<!-------------------------------------------------------->

	<c:if test="${ empty coments }">
		<h4 id="nodata" style="text-align: center">작성된 댓글이 없습니다.</h4>
	</c:if>
	<!-- comment 표시 영역 -->
	<script type="text/javascript">
		var v = null, e = null;
		function toggleComentStatus(comentNo, edit) {
			if (v != null) {
				v.style.display = edit ? 'block' : 'none';
				e.style.display = edit ? 'none' : 'block';
			}
			v = document.getElementById("comentview" + comentNo);
			e = document.getElementById("comentedit" + comentNo);

			v.style.display = edit ? 'none' : 'block';
			e.style.display = edit ? 'block' : 'none';
		}
		function deleteComent(comentNo, boardNo, pageno) {
			var yes = confirm(comentNo + '번 댓글을 삭제할까요?');
			if (yes) {
				location.href = 'deletecoment.action?comentNo=' + comentNo
						+ "&boardNo=" + boardNo + "&pageno=" + pageno;
			}
		}
	</script>
	<table style="width: 600px; border: solid 1px; margin: 0 auto">
		<c:forEach var="coment" items="${ coments }">
			<tr>
				<td style="text-align: left; margin: 5px; border-bottom: solid 1px">

					<div id='comentview${ coment.comentNo }'>
						${ coment.writer } &nbsp;&nbsp;
						<fmt:formatDate value="${ coment.regDate }" pattern="yyyy-MM-dd"
							var="regDate" />
						${ regDate } <br /> <br /> <span> ${ coment.content } </span> <br />
						<br />
						<div>
							<a
								href="javascript:toggleComentStatus(${ coment.comentNo }, true);">편집</a>
							&nbsp; <a
								href="javascript:deleteComent(${ coment.comentNo }, ${ board.boardNo }, ${ pageno })">삭제</a>
						</div>

					</div>

					<div id='updateComent${ coment.comentNo }' style="display: none">

						<br /> <br />
						<form id="comenteditform${ coment.comentNo }"
							action="updatecoment.action" method="post">
							<input type="hidden" name="boardNo" value="${ board.boardNo }" />
							<input type="hidden" name="pageno" value="${ pageno }" /> <input
								type="hidden" name="comentNo" value="${ coment.comentNo }" />
							<textarea name="content" style="width: 600px" rows="3"
								maxlength="200">${ board.coment.content }</textarea>
						</form>
						<br />
						<div>
							<a
								href="javascript:document.getElementById('comenteditform${ coment.comentNo }').submit();">수정</a>
							&nbsp; <a
								href="javascript:toggleComentStatus(${ coment.comentNo }, false);">취소</a>
						</div>
					</div>

				</td>
			</tr>
		</c:forEach>

	</table>

	<br />
	<br />


</body>
</html>