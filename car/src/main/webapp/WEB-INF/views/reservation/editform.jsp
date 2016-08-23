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
	
	
		<br/><br/>

</head>

<body>

	<div class="bdiv"  style="text-align:center; font-size: 20px">수정하기</div>
	<br/><br/>

<script>
  

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

		
		<div  class="table table-striped" style="padding-top: 25px; text-align: center">
			<div id="inputcontent">
				<div id="inputmain">
					<div class="inputsubtitle" style="text-align:center; font-size: 20px">예약 수정하기</div>
					<br/><br/>
					
					
					<form id="edit" action="update.action" method="post"  enctype="multipart/form-data">
						
						<input type='hidden' name="reservationNo"
							value="${ reservation.reservationNo }" /> 
							<input type='hidden' name="pageno" value="${ pageno }" />
						<table  class="table table-striped" style="width: 20%; border: 2px solid white;" align="center">
							
							<tr>
								<th>작성자</th>
								<td style="width: 220px; font-size: large;; padding-left:10px; "><font color="#EC0A7B">	${ sessionScope.loginuser.memberId }
								</td>
							</tr>
							
							<tr>
									<th>출발</th>
								<td>
									<!-- <input  type="text" name="departure" style="height: 30px; width: 220px;" /> -->
									<input type="text" id="departure" name="departure" placeholder="주소" style="height: 20px;width:200px">
									<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
								
								</td>
							</tr>
							
							<tr>

								<th>도착</th>
								<td>
								<input type="text" id="arrival" name="arrival" placeholder="주소" style="height: 20px; width: 200px;">
								<input type="button" onclick="sample6_execDaumPostcode()" value="주소 검색"><br>
							</tr>
							<tr>
								<th>목적</th>
								<td>
									<input class="form-control" type="text" name="type"	style="height: 20px; width: 200px;" />
								</td>
							</tr>
							<tr>
							<th>시작날짜</th>
							<td><input type="date" name="startDate"	style="height: 20px; width: 200px;" /></td>
							</tr>
					
						<tr>
							<th>끝날짜</th>
							<td><input type="date" name="endDate" style="height: 20px; width: 200px;" /></td>
				       </tr>
							<tr>
								<th>내용</th>
								<td>
								  
								<textarea name="content" cols="5" rows="5"></textarea>
								</td>
							</tr>
						</table>
						<div class="buttons">
							<!-- 아래 a 링크는 input type='submit' 버튼을 누르는 효과 발생 -->
							<%-- <a href="javascript:document.forms[0].submit();">수정완료</a>
							&nbsp;&nbsp; 
							<a
								href='detail.action?reservationno=${reservation.reservationNo }&pageno=${pageno}'>취소</a> --%>
								
					<input id='submitbutton' type="submit" value="수정완료" style="height: 25px" /> 
						<input type="button" value="취소"
						style="height: 25px" onclick="location.href='detail.action?reservationno=${reservation.reservationNo }&pageno=${pageno}';" />			
						</div>
					</form>
			
				</div>
			</div>

		</div>
	</div>

</body>
</html>