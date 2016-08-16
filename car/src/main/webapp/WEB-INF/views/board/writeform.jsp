<%@page import="com.car.model.dto.Board"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8" />
	<title>공지 등록</title>
</head>
<body>

	<div id="pageContainer">
	
		<c:import url="/WEB-INF/views/include/header.jsp" />
		
		<div id="inputmain">
			    
		        <form:form action="write.action" method="post" modelAttribute="Board"><!-- 상대경로표시 -->
		       		
		       		<div>
     		     	  <label for="inputTitle">제목</label>
		              <form:input type="text" path="title"/>
			        </div>
		       		
		        	<div>
     		     	  <label for="inputName">작성자</label>
     		     	  관리자
			        </div>
			        
			        <div>
     		     	  <label for="inputContent">내용</label>
		             <form:input type="text" path="content"/>
			        </div>
			        	  

		       <br><br>
		        <div class="buttons" align="center">
						<input type="button" id="submit" value="글등록 " style="height:30px"  />
						<input type="button" id="Cancel"
							value="취소" style="height: 30px" onclick="location.href='/car/board/list.action';"/>
				</div>				
		        </form:form>
		    
		</div>

	</div>

</body>
</html>