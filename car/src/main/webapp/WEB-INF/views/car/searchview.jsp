<%@page import="com.car.model.dto.Car"%>
<%@page import="com.car.model.dao.CarDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript">
$(function(){
$('#search').on('click', function(event) {
	var url = "/car/car/searchview.action?startDate=" + $('#startDate').val() + "&endDate=" + $('#endDate').val()
			+ "&carindex="+$('#status').val();
	$("#searchlist").load(url);

});
});
</script>


<div>


	<table class="table table-striped" align="center" width="700px">

		<tr style="height: 30px" align="center">

			<td>기간별 조회</td>
			<td></td>
			<td class="form-group"><label for="inputRegdate">기록시작일</label> <input
				type="date" path="regdate" class="form-control" placeholder="기록시작일"
				id="startDate" /></td>
			<td class="form-group"><label for="inputRegdate">기록종료일</label> <input
				type="date" path="regdate" class="form-control" placeholder="기록종료일"
				id="endDate" /></td>
			<td><button type="button" id="search" >조회</button></td>

		</tr>
		<tr style="height: 30px; text-align: center;" align="center">
			<td></td>
			<td>주유횟수</td>
			<td>주유비용</td>
			<td>정비비용</td>
			<td>유지비용</td>
			<td></td>
		</tr>
	
			<tr style="height: 30px; text-align: center;" align="center">
				<td></td>
				<td>${ count }회</td>
				<td>${ totalFuel }</td> 
				<td>${ totalRepair }</td>
				<td>${ totalMaintain }</td>
				<td></td>
			</tr>
			
	
	</table>


</div>


