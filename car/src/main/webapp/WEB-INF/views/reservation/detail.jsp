
<%@page import="com.car.model.dto.Member"%>
<%@page import="com.car.model.dto.Reservation"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" session="true"%>

<%	//치환변수선언
    pageContext.setAttribute("cr", "\r"); //Space
    pageContext.setAttribute("cn", "\n"); //Enter
    pageContext.setAttribute("crcn", "\r\n"); //Space, Enter
    pageContext.setAttribute("br", "<br/>"); //br 태그 %> 
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8" />
<title>자유게시판</title>

<jsp:include page="/WEB-INF/views/include/head.jsp" />
<link rel="Stylesheet" href="/weeklyfarm/resources/css/bootstrap.css" />
<link rel="Stylesheet" href="/weeklyfarm/resources/css/bootstrap-responsive.css" />
<script type="text/javascript">
	function doDelete(boardNo, pageNo) {
		yes = confirm(boardNo + '번 글을 삭제할까요?');
		if (yes) { location.href = 'delete.action?boardno=' + boardNo + '&pageno='+ pageNo;
		}
	}
	
    //편집 메서드
    var v = null, e = null;
      	function toggleCommentStatus(commentNo, edit) {
    if (v != null) {        	
        v.style.display = edit ? 'block' : 'none';
        e.style.display = edit ? 'none' : 'block';      
    } 
        v = document.getElementById("commentview" + commentNo);
        e = document.getElementById("commentedit" + commentNo);

        v.style.display = edit ? 'none' : 'block';  
        e.style.display = edit ? 'block' : 'none';
    }
      
    //삭제 메서드
    function deleteComment(commentNo, boardNo, pageNo) {
    var yes = confirm(commentNo + '번 댓글을 삭제할까요?');
    if (yes) {
        location.href = 'deletecomment.action?commentno=' + commentNo + "&boardno=" + boardNo + "&pageno=" + pageNo;
        }
    }
    
</script>
</head>
<body>
	
		<br/><br/>
		<div>
		<div class="bdiv">자유게시판</div>
		<br/><br/>
			
			<table class="dtable">
				<tr>
					<th>제&nbsp;&nbsp;&nbsp;&nbsp;목</th>
					<td>${ board.boardTitle }</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${ board.memberId }</td>
					</tr>
				<tr>
					<th>작성일</th>
					<td>${ board.boardRegDate }</td>
				</tr>
				<tr>
					<th>조회수</th>
					<td>${ board.boardCount }</td>
				</tr>
				<tr>	
					<th style="color: #a2642d;">첨부자료</th>
					<td>
						<c:forEach var="file" items="${ board.files }">
							<c:if test="${ not empty file.userFileName }">
								<a href='download.action?uploadfileno=${ file.uploadFileNo }'>${ file.userFileName } </a>&nbsp;		             
		                	</c:if>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<th valign="middle">추&nbsp;가&nbsp;내&nbsp;용</th>
					<td style="height:150px; vertical-align: top; text-align:left; padding-left: 30px;">
						
					</td>
				</tr>
			</table>
			
			<br/><br/>
					
			<div class="bbtn">
				<c:choose>
					<c:when test="${ loginuser.memberId eq board.memberId }">						
						<a href='javascript:doDelete(${ board.boardNo }, ${ pageno })'>삭제</a>&nbsp;&nbsp;
						<a href='edit.action?boardno=${ board.boardNo }&pageno=${ pageno }'>수정</a>&nbsp;&nbsp;
					</c:when>
					<c:otherwise>
						<%-- 작성자가 자기 글에 댓글을 쓸 수 없다면 여기에 댓글 링크 만들기 --%>
					</c:otherwise>
				</c:choose>
					
					<a href='list.action?pageno=${ pageno }'>목록보기</a>
			</div>
		</div>
		
		<br /> <br />

		

</body>
</html>