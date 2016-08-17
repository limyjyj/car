<%-- <%@page import="com.mvcdemoweb.model.dto.BoardComment"%> --%>
<%@page import="com.car.model.dto.Member"%>
<%@page import="com.car.model.dto.Board"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>

<html>
<head>

	<meta charset="utf-8" />
	<title>글쓰기</title>	
	<jsp:include page="/WEB-INF/views/include/head.jsp" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	<script type="text/javascript">
	$(function() {
		$('#delete').on('click', function(event) {
			var boardNo = $('#boardNo').val();
			var result = confirm('삭제 하시겠습니까?');
			if (result) {
				//yes
				location.href = ('/car/board/delete.action?boardNo=' + boardNo);
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
		        
		        <table style="text-align:center;">
		            <tr>
		                <th style="text-align:center;">제목</th>
		                <td>${ board.title }</td>
		            </tr>
		            <tr>
		                <th style="text-align:center;">작성자</th>
						<td><input type="hidden" name="memberId" value="${ loginuser.memberId }" />
						관리자
						</td>
		            </tr>
		            <tr>
		                <th style="text-align:center;">작성일</th>
		                <td>
		                <fmt:formatDate value="${ board.regDate }" pattern="yyyy-MM-dd" var="regDate"/>
		                ${ regDate }                
		                </td>
		            </tr>					
		            
		            <tr>
		                <th style="text-align:center;vertical-align:middle;">내용</th>
		                <td>${ board.content }</td>
		            </tr>
		            
		        </table>
		
		      <div>
		      
		        	<div>
		        		<input id="delete" type="button" value="삭제" style="height: 40px" /> 
		        		<input id="boardNo" type="hidden" value="${ board.boardNo }" />
		        	</div>
		        	<div>
		        		<input type="button" value="수정" style="height: 40px" onclick="location.href='edit.action?boardNo=${ board.boardNo }';"/> 
		        	</div>
		        	<div>
		        		<input type="button" value="목록보기" style="height: 40px" onclick="location.href='list.action';"/> 
		        	</div>
		   		</div>
		      </div> 
		     </div>
		  
		
		<br /><br />


</body>
</html>