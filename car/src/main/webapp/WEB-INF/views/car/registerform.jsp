<%@ page import="com.car.model.dto.Car" %>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>차량 등록</title>


<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>

<script>

$(function(){
	
	$('#btnNext').on('click', function(event) {
		
		event.stopPropagation();
		event.preventDefault();
		
		var info = $("#model, #carno, #regdate, #totaldistance")
		valid = true;
		$.each(info, function(index, element) {
			if (element.value == null || element.value.length == 0) {
				valid = false;	
			}
		});
		
		if (valid) {
			$('form').submit();
		} else {
			alert('차량정보를 빠짐없이 입력해주세요')
		}
})	
});    



</script>

</head>
<body>

	<div id="pageContainer" >
	
		<%-- <c:import url="/WEB-INF/views/include/header.jsp" /> --%>
		
		   		<div id="inputmain">
		        <div class="inputsubtitle"><h2 align="center">차량 등록</h2></div>
		        <br>
		        
			    <div class="col-md-6 col-md-offset-3">
			    
		        <form:form action="register.action" method="post" modelAttribute="car"><!-- 상대경로표시 -->
		       		
     		       <div class="form-group">
     		     	  <label for="inputModel">차종</label>
     		     	  <form:input type="text" path="model" class="form-control" placeholder="연락처"/>
     		     	  <font size="1" style="color: red">*제조사와 모델명을 적어주세요</font>
			       </div>
		       		<div class="form-group">
     		     	  <label for="inputCarno">차량번호</label>
		              <form:input type="text" path="carno" class="form-control" placeholder="" />
			       </div>
		          <div class="form-group">
     		     	  <label for="inputRegdate">기록시작일</label>
		              <form:input type="text" path="regdate" class="form-control"  placeholder="" />
			       </div>
			       <div class="form-group">
     		     	  <label for="inputTotaldistance">총 주행거리</label>
					<form:input type="text" path="totaldistance" class="form-control"  placeholder="" />
		                
		           </div>

		       <br><br>
		        <div class="buttons" align="center">
						<input class="btn btn-primary" type="submit" id="btnNext" 
							value="등록 " style="height: 30px" />
						<input class="btn btn-danger" type="button" id="btnCancel"
							value="취소" style="height: 30px" onclick="location.href='/car/home.action';"/>
				</div>
				
		        </form:form>
		    </div>
		</div>   	<br><br><br>
</div>

</body>
</html>