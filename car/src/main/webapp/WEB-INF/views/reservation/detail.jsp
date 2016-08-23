
<%@page import="com.car.model.dto.Member"%>
<%@page import="com.car.model.dto.Reservation"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8" session="true"%>
   
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   

<%   //치환변수선언
    pageContext.setAttribute("cr", "\r"); //Space
    pageContext.setAttribute("cn", "\n"); //Enter
    pageContext.setAttribute("crcn", "\r\n"); //Space, Enter
    pageContext.setAttribute("br", "<br/>"); //br 태그 %> 
<!DOCTYPE html>
<html>
<head>
 
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script type="text/javascript">
   $(function() {
	   alert($('#departure').val());
		console.log(departure);
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  

	// 지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption); 

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();

		
		
	// 주소로 좌표를 검색합니다
	geocoder.addr2coord(departure, function(status, result) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === daum.maps.services.Status.OK) {

	        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new daum.maps.Marker({
	            map: map,
	            position: coords
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new daum.maps.InfoWindow({
	            content: '<div style="padding:5px;">출발지</div>'
	        });
	        infowindow.open(map, marker);
	    } 
	});    
		
		
		
      $('#delete').on('click', function(event) {
         var reservationno = ${reservation.reservationNo}
         var result = confirm('삭제 하시겠습니까?');
         if (result) {
            //yes
            location.href = ('/car/reservation/delete.action?reservationno=' + reservationno);
         } else {
            //no
         }
      });
   });
</script>

<meta charset="utf-8" />
<title>세부사항</title>

   
      <jsp:include page="/WEB-INF/views/include/head.jsp" />
      <jsp:include page="/WEB-INF/views/include/header.jsp" />


</head>
<body>
   
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//apis.daum.net/maps/maps3.js?apikey=0b310b2f318c9e4b7fd52459eb35d927&libraries=services"></script>
   <table align="center">
   <tr>
   <td>
   <div id="map" style="width:500px;height:300px;margin-top:10px; margin:auto"></div></td>
   <td/>
    <td><div id="map2" style="width:500px;height:300px;margin-top:10px; margin:auto"></div>
    </td>
    </tr>
    </table>
  
<script>
$(function(){
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  

	// 지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption); 

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();
	var departure = document.getElementById('departure').value;
	
	// 주소로 좌표를 검색합니다
	geocoder.addr2coord(departure, function(status, result) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === daum.maps.services.Status.OK) {

	        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new daum.maps.Marker({
	            map: map,
	            position: coords
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new daum.maps.InfoWindow({
	            content: '<div style="padding:5px;">출발지</div>'
	        });
	        infowindow.open(map, marker);
	    } 
	});    
	
})

$(function(){

	var mapContainer = document.getElementById('map2'), // 지도를 표시할 div 
	    mapOption = {
	        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  

	// 지도를 생성합니다    
	var map = new daum.maps.Map(mapContainer, mapOption); 

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();
	var arrival = document.getElementById('arrival').value;
	
	// 주소로 좌표를 검색합니다
	geocoder.addr2coord(arrival, function(status, result) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === daum.maps.services.Status.OK) {

	        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new daum.maps.Marker({
	            map: map,
	            position: coords
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new daum.maps.InfoWindow({
	            content: '<div style="padding:5px;">도착지</div>'
	        });
	        infowindow.open(map, marker);
	    } else {
	    	
	    	alert(status);
	    }
	});    
	
})

</script>

<div  id="pageContainer" class="panel panel-heading"
		style="padding-top: 25px; margin: auto;  width: 400px">
	<div class="bdiv" style="text-align:center; font-size: 20px" >세부사항</div>
	<br />
	<br />
		
			<form id="detailform" action="detail.action" method="post">	
			<table  class="table table-striped" align="center" margin="auto">
				<tr >
		     		<th>작성자</th>
					<td >
					${ reservation.member.memberId }
                    
                    </td>
				</tr>
				
					<tr>
					<th>출발지</th>
					<td>${ reservation.departure}
					<input type="hidden" id="departure" value="${ reservation.departure}">
					</td>
					</tr>
				
					<tr>
					<th>도착지</th>
					<td>${ reservation.arrival}
					<input type="hidden" id="arrival" value="${ reservation.arrival}">
					</td>
					</tr>
				
				<tr>
					<th>시작날짜</th>
					<td>${ reservation.startDate }</td>
				</tr>
					
				<tr>
					<th>끝날짜</th>
					<td>${ reservation.endDate }</td>
				</tr>
				
				<tr>
					<th >내&nbsp;용</th>
					
					<td > 
						${reservation.content }
					</td>
				</tr>
			</table>
			
			<br/><br/>
					
	<%-- 		<div class="bbtn">
				<c:choose>
					<c:when test="${ loginuser.memberNo eq reservation.memberNo }">						
						<a href='javascript:doDelete(${ reservation.reservationNo })' id="delete">삭제</a>&nbsp;&nbsp;
						<a href='edit.action?reservationno=${ reservation.reservationNo }&pageno=${ pageno }'>수정</a>&nbsp;&nbsp;
						<a href='list.action?pageno=${pageno}'>뒤로가기</a>
					</c:when>
					<c:otherwise>
						작성자가 자기 글에 댓글을 쓸 수 없다면 여기에 댓글 링크 만들기
					</c:otherwise>
				</c:choose>
					
	
			</div> --%>
			
			<div class="buttons" align="center">
						<c:choose>
							<c:when test="${ loginuser.memberNo eq reservation.memberNo  }">
							
							
						<a href='javascript:doDelete(${ reservation.reservationNo })' id="delete">삭제</a>&nbsp;&nbsp;
						<a href='edit.action?reservationno=${ reservation.reservationNo }&pageno=${ pageno }'>수정</a>&nbsp;&nbsp;
						<a href='list.action?pageno=${ pageno }'>뒤로가기</a>						
								
								</c:when>
							<c:otherwise>
					    		<a href='list.action?pageno=${ pageno }'>뒤로가기</a>
							</c:otherwise>
						</c:choose>
					
					</div>
			</form>
		</div>
		
		<br /> <br />

		

</body>
</html>