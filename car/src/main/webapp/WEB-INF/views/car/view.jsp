<%@page import="com.car.model.dto.Car"%>
<%@page import="com.car.model.dao.CarDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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
        	
 

