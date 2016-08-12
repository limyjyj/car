<%@page import="com.car.model.dto.Car"%>
<%@page import="com.car.model.dao.CarDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8" />
    <title></title>
	<!-- Custom CSS -->
	<link href="/car/resources/css/business-casual.css" rel="stylesheet">
</head>
<body>

    <div id="pageContainer" class="panel panel-heading" style="padding-top:25px;text-align:center;margin:auto;width:1000px">

        <div id="content">
        	<br /><br />
        	
        	<table class="table table-striped"  align="center" width="700px">
        		
        		<tr style="height:30px" align="center">
        			<td>차량정보번호</td>
        			<td>차종</td>
        			<td>차량번호</td>
        			<td>기록시작일</td>
        			<td>총주행거리</td>
        		</tr>        	
        	<c:forEach var="car" items="${ cars }">
        		<tr style="height:30px">
        		
        			<td>${ car.carindex }</td>
        			<td>${ car.model }</td>
        			<td>${ car.carno }</td>
        			<td>${ car.regdate }</td>
        			<td>${ car.totaldistance }</td>
   
        		</tr>
        	</c:forEach>
        	
        	</table>
        	
        </div>
    </div>
    
</body>
</html>

