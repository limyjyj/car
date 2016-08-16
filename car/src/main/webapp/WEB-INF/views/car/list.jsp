<%@page import="com.car.model.dto.Car"%>
<%@page import="com.car.model.dao.CarDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8" />
    <title></title>
	<!-- Custom CSS -->
	<link href="/car/resources/css/business-casual.css" rel="stylesheet">
	<script type="text/javascript">
	$(function() {
		$('#Status').on('click', function(event) {
			var carno = $('#carno').val();
			if (result) {
				//yes
				location.href = ('/car/car/view.action?carno=' + carno);
			} else {
				//no
			}
		});
	});
	
	
	
	</script>
</head>
<body>

    <div id="pageContainer" class="panel panel-heading" style="padding-top:25px;text-align:center;margin:auto;width:1000px">

        <div id="content">
        	<br /><br />
      
        	<div id="selectCar">
        	
        	<select name="carno" >
        	<option value="선택하세요">선택하세요.</option>
        	<c:forEach var="car" items="${ cars }" varStatus="Status">
        		<option value="${ car.carno }" id="Status">
        		${ car.carno }<!-- <br /> -->
        		</option>
        		</c:forEach>
        	</select>
        	
        	<div id="regist" class="buttons">
		        	<a href="register.action">차량등록</a>
		    </div>
        	</div>
        	
        	<table class="table table-striped"  align="center" width="700px">
        	<c:forEach var="car" items="${ cars }">
        		<tr style="height:30px" align="center">
        			<td>멤버</td>
        			<td>차량정보번호</td>
        			<td>차종</td>
        			<td>차량번호</td>
        			<td>기록시작일</td>
        			<td>총주행거리</td>
        			<td>총지출금액</td>
        		</tr>        	
        	
        		<tr style="height:30px">
        		
        			<td>${ car.memberNo }</td>
        			<td>${ car.carindex }</td>
        			<td>${ car.model }</td>
        			<td>${ car.carno }</td>
        			<td><fmt:formatDate value="${ car.regdate }" pattern="yyyy-MM-dd" var="regDate"/>
                      ${ regDate }</td>
        			<td>${ car.totaldistance }</td>
        			<td>${ car.totaloutcome }</td>
   
        		</tr>
        	</c:forEach>
        	
        	</table>
        	<table class="table table-striped"  align="center" width="700px">
        	
        		<tr style="height:30px">
        		
        		<td>기간별 조회</td>
        		</tr>
        	
        	
        	
        	</table>
        	
        	<div class="buttons">
		        	<a href="update.action">수정</a>
		    </div>
        	<div class="buttons">
		        	<a href="delete.action">삭제</a>
		    </div>
        </div>
    </div>
    
</body>
</html>

