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
	
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	
	<script type="text/javascript">
		$(function() {
		$('#status').on('change', function(event) {
			var url = $('#status').val();
			$( "#carlist" ).load( url );
			
		});
	});
	$(function(){
		$("#but").on('click', function(event){
			var startDate = $('#startDate').val();
			var endDate = $('#endDate').val();
			var carNo =$("#status option:selected").text();
		
			$.ajax({
				url:"/car/carhistory/list.action",
				type:"post",
				data: {	startDate:startDate,
						endDate:endDate,
						carNo:carNo},
				success : function(data){
					
				}
			})
		})
	})
	
	
	</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/head.jsp" />
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
    <div id="pageContainer" class="panel panel-heading" style="padding-top:25px;text-align=center;margin:auto;width:1000px">

        <div id="content">
        	<br /><br />
      
        	<div id="selectCar" >
        	
        	<select id="status" name="status" >
        		<option value="/car/car/list.action">선택하세요</option>
        		<c:forEach var="car" items="${ cars }" varStatus="Status">
	        		<option value="/car/car/view.action?carno=${ car.carno }" >
	        		${ car.carno }
	        		</option>
        		</c:forEach>
        	</select>
        	
	        	
			   <a href="register.action">차량등록</a>
			   
        	</div>
        	<br><br>
        	<table id="carlist" class="table table-striped"  align="center" width="700px">
        	
        		<tr style="height:30px" align="center">
        			<td><input type="hidden" value="멤버"/></td>
        			<td onclick="#">주유금액</td>
        			<td onclick="#">주유횟수</td>
        			<td onclick="#">정비비용</td>
        			<td onclick="#">유지비용</td>
        		</tr>        	
        	<c:forEach var="car" items="${ cars }">
        		<tr style="height:30px" align="center">
        		
        			<td><input type="hidden" ${ car.memberNo }/></td>
        			<td>${ car.carindex }</td>
        			<td>${ car.model }</td>
        			<td>${ car.carno }</td>
        			<td><fmt:formatDate value="${ car.regdate }" pattern="yyyy-MM-dd" var="regDate"/>
                      ${ regDate }</td>
   				
        		</tr>
        		
        	</c:forEach>
        	
        	</table>
        	
        	
     <div class="content ledger_area" id="ledgerGraph">
	<header class="con_title">
		<h1 class="title_ledger_graph">그래프</h1>
		
	</header>
	<article class="con_wrap">
		<header class="box_graph_nav">
			<div class="graph_nav">
				<!-- 선택시 selected 추가해주세요 -->
				<a href="###" title="주유금액 보기" class="btn_graph_nav" data-val="refuel_cost">주유금액</a>
				<a href="###" title="주유횟수 보기" class="btn_graph_nav" data-val="refuel_number">주유횟수</a>
				<a href="###" title="정비비용 보기" class="btn_graph_nav" data-val="maintenance">정비비용</a>
				<a href="###" title="유지비용 보기" class="btn_graph_nav" data-val="car_keep">유지비용</a>
			</div>
		
		</header>
		<div class="graph_wrap">
			<div class="graph_current">
			</div>
			<div class="graph_accumulate">
			</div>
		</div>
	</article>
</div>
        	
        
        </div>
    </div>
    
</body>
</html>

