<%@page import="com.car.model.dto.Car"%>
<%@page import="com.car.model.dao.CarDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">

$(function() {
	$('#delete').on('click', function(event) {
		var carindex = ${car.carindex}
		var result = confirm('삭제 하시겠습니까?');
		if (result) {
			//yes
			location.href = ('/car/car/delete.action?carindex=' + carindex);
		} else {
			//no
		}
	});
});


</script>


	 <div>
	 <c:forEach var="car" items="${ cars }">
	 
		<table id="carlist" class="table table-striped"  align="center" width="700px">
        	
        		<tr style="height:30px" align="center">
        			
        			<td>차량정보번호</td>
        			<td>차종</td>
        			<td>차량번호</td>
        			<td>기록시작일</td>
        			<td>총주행거리</td>
        			<td>총지출금액</td>
        			<td></td>
        			<td></td>
        			
        		</tr>        	
        	
        		<tr style="height:30px"align="center">
        		
        			
        			<td>${ car.carindex }<input type="hidden" ${ car.memberNo }/></td>
        			<td>${ car.model }</td>
        			<td>${ car.carno }</td>
        			<td><fmt:formatDate value="${ car.regdate }" pattern="yyyy-MM-dd" var="regDate"/>
                      ${ regDate }</td>
        			<td>${ car.totaldistance }</td>
        			<td>${ total }</td>
   					<td><a href="update.action?carindex=${ car.carindex }">수정</a></td>
		    
		        	<td><a href='javascript:doDelete(${ car.carindex })' id="delete">삭제</a></td>
        		</tr>
        		
		        	
		 	
        	</table>
        	 
        	</c:forEach>
       </div>


