<%@page import="com.car.model.dto.Board"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8" />
	<title>후기 등록</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	<script src="/car/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
	<style type="text/css">
.button {
	font-weight:bold;
	text-decoration:none;
	font-family:Arial;
	box-shadow:inset #ffffff 0px 5px 8px -1px,#ffdee9 1px 5px 2px;
	o-box-shadow:inset #ffffff 0px 5px 8px -1px,#ffdee9 1px 5px 2px;
	-moz-box-shadow:inset #ffffff 0px 5px 8px -1px,#ffdee9 1px 5px 2px;
	-webkit-box-shadow:inset #ffffff 0px 5px 8px -1px,#ffdee9 1px 5px 2px;
	background:#e6d6dc;
	background:-o-linear-gradient(90deg, #e6d6dc, #ffffff);
	background:-moz-linear-gradient( center top, #e6d6dc 5%, #ffffff 100% );
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #e6d6dc), color-stop(1, #ffffff) );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#e6d6dc', endColorstr='#ffffff');
	background:-webkit-linear-gradient(#e6d6dc, #ffffff);
	background:-ms-linear-gradient(#e6d6dc, #ffffff);
	background:linear-gradient(#e6d6dc, #ffffff);
	text-indent:0px;
	line-height:7px;
	-moz-border-radius:14px;
	-webkit-border-radius:14px;
	border-radius:14px;
	text-align:center;
	vertical-align:middle;
	display:inline-block;
	font-size:13px;
	color:#ce4869;
	width:90px;
	height:7px;
	padding:13px;
	text-shadow:#f7c6d8 -1px -1px 0px;
	border-color:#ffe0eb;
	border-width:1px;
	border-style:solid;
}

.button:active {
	box-shadow:inset #ffffff 0px 5px 8px -1px,#ffdee9 1px 0 2px;
	o-box-shadow:inset #ffffff 0px 5px 8px -1px,#ffdee9 1px 0 2px;
	-moz-box-shadow:inset #ffffff 0px 5px 8px -1px,#ffdee9 1px 0 2px;
	-webkit-box-shadow:inset #ffffff 0px 5px 8px -1px,#ffdee9 1px 0 2px;
	position:relative;
	top:5px
}

.button:hover {
	background:#ffffff;
	background:-o-linear-gradient(90deg, #ffffff, #e6d6dc);
	background:-moz-linear-gradient( center top, #ffffff 5%, #e6d6dc 100% );
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #ffffff), color-stop(1, #e6d6dc) );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff', endColorstr='#e6d6dc');
	background:-webkit-linear-gradient(#ffffff, #e6d6dc);
	background:-ms-linear-gradient(#ffffff, #e6d6dc);
	background:linear-gradient(#ffffff, #e6d6dc);
}
</style>
<script type="text/javascript">

	
	</script>
	<jsp:include page="/WEB-INF/views/include/head.jsp" />
</head>


<body>

	<div id="pageContainer">
	<c:import url="/WEB-INF/views/include/header.jsp" />
	
		
		
		<div id="inputmain" style="padding-top: 20px; text-align: center; margin: auto; width: 800px">
			    
		        <form:form action="write2.action" method="post" modelAttribute="Board" id="form"><!-- 상대경로표시 -->
		        
		       		
		       		<div>
		       			<form:input type="hidden" value="Review" path="type" />
		       		</div>
		       		
		       		<table style="text-align:center; margin: auto;" class="type11">
		       		
		       		<tr>
						<th style="text-align: center;" scope="cols">제목</th>
						<td><form:input type="text" path="title" style="text-align: center; width: 400px;" /></td>
					</tr>
		       		
		        	<tr>
						<th style="text-align: center;" scope="cols">작성자</th>
						<td>관리자</td>
					</tr>
			        
			        <tr>
						<th style="text-align:center; vertical-align:middle" scope="cols">내용</th>
						<td style="height: 300px; width: 400px; vertical-align: middle">
						<form:input type="text" path="content" style="height: 300px; width: 400px; vertical-align: middle; text-align: center;" /> 
						</td>
					</tr>
			        	  
				</table>
			        	  

		       <br><br>
		        <div align="center">
						<input class="button" id="submit" value="등록 " type="submit"  />
						<input class="button" id="cancel" value="취소" onclick="location.href='/car/board/list2.action';"/>
				</div>				
		        </form:form>
		    
		</div>

	</div>

</body>
</html>