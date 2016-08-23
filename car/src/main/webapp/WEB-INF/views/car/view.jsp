<%@page import="com.car.model.dto.Car"%>
<%@page import="com.car.model.dao.CarDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">

$(function() {
	$('#delete').on('click', function(event) {
		var carindex = $('#carindex').val();
		var result = confirm('삭제 하시겠습니까?');
		if (result) {
			//yes
			location.href = ('/car/car/delete.action?carindex=' + carindex);
		} else {
			//no
		}
	});
});
$(function(){
	$('#search').on('click', function(event) {
		var url = "/car/car/searchview.action?startDate=" + $('#startDate').val() + "&endDate=" + $('#endDate').val()
				+ "&carindex="+$('#status').val();
		$("#searchlist").load(url);

	});
	});

</script>


	 <div>
	 <c:forEach var="car" items="${ cars }">
	 
		<table id="carlist" class="table table-striped" align="center" width="700px">
        	
        		<tr style="height:30px" align="center">
        			
        			<td></td>
        			<td>차종</td>
        			<td>차량번호</td>
        			<td>기록시작일</td>
        			<td>총주행거리</td>
        			<td>총지출금액</td>
        			<td></td>
        			<td></td>
        			
        		</tr>        	
        	
        		<tr style="height:30px"align="center">
        		
        			
        			<td><input type="hidden"${ car.carindex }><input type="hidden" ${ car.memberNo }/></td>
        			<td>${ car.model }</td>
        			<td>${ car.carno }</td>
        			<td><fmt:formatDate value="${ car.regdate }" pattern="yyyy-MM-dd" var="regDate"/>
                      ${ regDate }</td>
        			<td>${ car.totaldistance }</td>
        			<td>${ total }</td>
   					<td><a href="update.action?carindex=${ car.carindex }">수정</a></td>
		        	<td> 
			        	<a href='#' id="delete">삭제</a>
			        	<input type="hidden" id="carindex" value="${ car.carindex }">
		        	</td>
        		</tr>
        		
		        	
		 	
        	</table>
        	
        
        	</c:forEach>
        	
        	
        	<table class="table table-striped" align="center" width="700px" id="searchlist">

				<tr style="height: 30px" align="center">

					<td>기간별 조회</td><td></td>
					<td class="form-group"><label for="inputRegdate">기록시작일</label>
						<input type="date" path="regdate" class="form-control"
						placeholder="기록시작일" id="startDate" /></td>
					<td class="form-group"><label for="inputRegdate">기록종료일</label>
						<input type="date" path="regdate" class="form-control"
						placeholder="기록종료일" id="endDate" /></td>
					<td></td>

				</tr>
				<tr style="height: 30px; text-align: center;" align="center" >
					<td>주유횟수</td>
					<td>주유비용</td>
					<td>정비비용</td>
					<td>유지비용</td>
				</tr>
			
			</table>
			<button type="button" id="search" >조회</button>
       </div>


