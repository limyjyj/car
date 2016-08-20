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

$(function() {
	$('#search').on('click', function(event) {
		var url = "/car/car/searchview.action?startDate=" + $('#startDate').val() + "&endDate=" + $('#endDate').val();
		$("#searchlist").load(url);

	});

	}); 

</script>


	 <div>
	 <c:forEach var="car" items="${ cars }">
	 
			<table class="table table-striped" align="center" width="700px">

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
				<tr style="height: 30px; text-align: center;" align="center" >
					<td>${ count }</td>
					<%-- <td>${ }</td>
					<td>정비비용</td>
					<td>유지비용</td> --%>
				</tr>

			</table>

        	 
        	</c:forEach>
       </div>


