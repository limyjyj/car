<%@page import="com.car.model.dto.Carhistory"%>
<%@page import="com.car.model.dto.Outcome"%>
<%@page import="com.car.model.dao.CarhistoryDao"%>
<%@page import="com.car.model.dao.OutcomeDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8" />
<title></title>
<!-- Custom CSS -->
<link href="/car/resources/css/business-casual.css" rel="stylesheet">
</head>
<body>

	<div id="pageContainer" class="panel panel-heading"
		style="padding-top: 25px; text-align: center; margin: auto; width: 1000px">

		<div id="content">
			<br />
			<br />
			<div>
				<input class="btn btn-danger" type="button" id="inputOutcome"
					value="지출입력" style="height: 30px"
					onclick="location.href='/car/carhistory/writeform.action?historyno=${ carhistory.historyno }';" />
				<input class="btn btn-danger" type="button" id="inputFuel"
					value="주유입력" style="height: 30px" 
					onclick="location.href='/car/carhistory/writeform.action?historyno=${ carhistory.historyno }';" />

			</div>

			<table class="table table-striped" align="center" width="700px">

				<tr style="height: 30px" align="center">
					<td>날짜</td>
					<td>항목</td>
					<td>금액</td>
					<td>리터</td>
				</tr>
				<c:forEach var="outcome" items="${ outcome }">
					<tr style="height: 30px">

						<td><fmt:formatDate value="${ outcome.regdate }"
								pattern="yyyy-MM-dd" var="regDate" /> ${ regDate }</td>
						<td>${ outcome.category }</td>
						<td>${ outcome.payment }</td>
						<td>${ outcome.location }</td>

					</tr>

				</c:forEach>

			</table>

		</div>
<<<<<<< HEAD
	</div>

=======
	</section> --%>
			
			
			
        	<table class="table table-striped"  align="center" width="700px">
        	
        	<select name="carno" >
        	<option value="선택하세요">선택하세요.</option>
     <%--    	<c:forEach var="car" items="${ cars }">
        		
        		<option value="${ car.carno }">
        		${ car.carno }
        		</option>
        		
        	</c:forEach> --%>
        	</select>
        		<tr style="height:30px" align="center">
        			<td>날짜</td>
        			<td>항목</td>
        			<td>금액</td>
        			<td>리터</td>
        		</tr>        	
        	<c:forEach var="carhistory" items="${ historys }" >
        		<tr style="height:30px">
        		
        			<td><fmt:formatDate value="${ carhistory.regdate }" pattern="yyyy-MM-dd" var="regDate"/>
                      ${ regDate }</td>
        			<td>${ carhistory.category }</td>
        			<td>${ carhistory.fee }</td>
        			<td>${ carhistory.liter }</td>
   
        		</tr>
        		
        	</c:forEach>
        	
        	</table>
        	
        </div>
    </div>
    
>>>>>>> branch 'master' of https://github.com/limyjyj/car.git
</body>
</html>

