<%@page import="com.car.model.dto.Reservation"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8" />
<title>예약하기</title>

<style> 
.swell th{
	padding: 10px;
}
.swell .form-control:hover{
	border: solid 1px white;
}

.dot {overflow:hidden;float:left;width:12px;height:12px;background: url('http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');}    
.dotOverlay {position:relative;bottom:10px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;font-size:12px;padding:5px;background:#fff;}
.dotOverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}    
.number {font-weight:bold;color:#ee6152;}
.dotOverlay:after {content:'';position:absolute;margin-left:-6px;left:50%;bottom:-8px;width:11px;height:8px;background:url('http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')}
.distanceInfo {position:relative;top:5px;left:5px;list-style:none;margin:0;}
.distanceInfo .label {display:inline-block;width:50px;}
.distanceInfo:after {content:none;}
</style>

	<jsp:include page="/WEB-INF/views/include/head.jsp" />
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	
	
		<div class="bdiv" align="center">예약 설정</div>
		<br/><br/>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//apis.daum.net/maps/maps3.js?apikey=0b310b2f318c9e4b7fd52459eb35d927&libraries=services"></script>
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });

    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("departure").value = fullAddr;
                // 주소로 좌표를 검색
                geocoder.addr2coord(data.address, function(status, result) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {
                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
    
    
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("arrival").value = fullAddr;
                // 주소로 좌표를 검색
                geocoder.addr2coord(data.address, function(status, result) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {
                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
</script>
</head>

<body>
	<div id="map" style="width:300px;height:300px;margin-top:10px;"></div>

		<br/><br/>
		
					<form id="write" action="write.action" method="post" enctype="multipart/form-data" onSubmit="return chkval(this)">
						<table class="table table-striped"  style="width: 70%; border: 2px solid white;" align="center" >
							<tr class="bfile">
								<th style="width: 200px">종류</th>
								<td style="width: 900px">
								
									
									<select id="frequency" name="frequency" 
										style="height: 30px; width:150px; font-size: medium;">
									
										<option value="실시간">실시간 카풀</option>
						
										<option value="정기">정기 카풀</option>
										
									</select>
								</td>
							</tr>


							<tr>
								<th>작성자</th>
								<td style="width: 220px; font-size: large;; padding-left:10px; "><font color="#EC0A7B">
									<input class="form-control" type="hidden" name="memberId" value="${loginuser.memberId}" />
									${loginuser.memberId}
								</font></td>
							</tr>
							
					
							
							<tr>
								<th>목적</th>
								<td>
									<input class="form-control" type="text" name="type"
									style="height: 20px; width: 220px;" />
								</td>
							</tr>
							<tr>
								<th>타태워</th>
								<td>
								
								<select id="purpose" name="purpose" 
										style="height: 30px; width:150px; font-size: medium;">
									
										<option value="타세요">타세요</option>
										<option value="태워주세요">태워주세요</option>
									</select>
								</td>
							</tr>
							
							<tr>
								<th>출발</th>
								<td>
									<!-- <input  type="text" name="departure" style="height: 30px; width: 220px;" /> -->
									<input type="text" id="departure" name="departure" placeholder="주소">
									<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
								
								</td>
							</tr>
							<tr>
								<th>도착</th>
								<td>
								<!-- 	<input  type="text" name="arrival" style="height: 25px; width: 220px;" /> -->
								<input type="text" id="arrival"  name="arrival" placeholder="주소">
									<input type="button" onclick="sample6_execDaumPostcode()" value="주소 검색"><br>
								
								</td>
							</tr>
							
							 <tr>
								<th>시작날짜</th>
								<td><input type="date" name="startDate"
										style="height: 30px;width: 200px" /></td>
							</tr>
							 <tr>
								<th>끝날짜</th>
								<td><input type="date" name="endDate"
										style="height: 30px;width: 200px" /></td>
							</tr>
							
							 <tr>
								<th>인원수</th>
								<td><input  type="text" name="totalMember"
										style="width: 50px" />명</td>
							</tr>
							<tr>
								<th>내용</th>
								<td>
								  
								<textarea name="content" cols="5" rows="5"></textarea>
								</td>
							</tr>
						</table>

						<br />
						<br />
			
						<div class="bbtn" align="center">
							<!-- 아래 a 링크는 input type='submit' 버튼을 누르는 효과 발생 -->
					<!-- 	<!-- <!-- 	<a href="javascript:document.forms[0].submit();">글쓰기</a> 
								&nbsp;&nbsp; 
							<a href="/car/reservation/list.action">목록보기</a>  --> 
							
							<input id='submitbutton' type="submit" value="등록"
						style="height: 25px" /> <input type="button" value="취소"
						style="height: 25px" onclick="location.href='/car/reservation/list.action';" />
						
							
							
						</div>
					</form>
				
			<br />
			<br />
			<br />
			<br />
			<br />
	

</body>
</html>