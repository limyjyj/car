<%@page import="com.car.model.dto.Reservation"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>
<head>

<meta charset="utf-8" />
<title>글쓰기</title>


</head>
<body>

	<div id="pageContainer">

		

		<div style="padding-top: 25px; text-align: center">
			<div id="inputcontent">
				<div id="inputmain">
					<div class="inputsubtitle">내농작물 주문</div>
					<form action="write.action" method="post">

						<table>
							<tr>
								<th>작성자</th>
								<td><input type="hidden" name="memberId"
									value="${ loginuser.memberId }" />
									${ loginuser.memberId }
								</td>
							</tr>
							
							<tr>
								<th>주문방법</th>
								<td><select style="height: 30px" id="deliverywayNo"
									name="deliverywayNo">
										<option value="1">택배</option>
										<option value="2">직접수령</option>
									</select></td>
										
							</tr>
							
							<tr>
								<th>수량</th>
								<td><select style="height: 30px" id="quantity"
									name="quantity">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
								</select></td>
								
							</tr>
							
							 <input type="hidden" value="${ product.productNo }" name="productno"/> 
						</table>
						<div class="buttons">
							<!-- 아래 a 링크는 input type='submit' 버튼을 누르는 효과 발생 -->


							<a href="javascript:document.forms[0].submit();">확인</a>
							&nbsp;&nbsp; 
						</div>
					</form>
				</div>
			</div>

		</div>
	</div>


	<hr>

	<br>
	<br>
	<br>
	<br>
	

	<link href="/weeklyfarm/resources/css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
	
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="/weeklyfarm/resources/js/fileinput.js" type="text/javascript"></script>
	<script src="/weeklyfarm/resources/js/fileinput_locale_fr.js" type="text/javascript"></script>
	<script src="/weeklyfarm/resources/js/fileinput_locale_es.js" type="text/javascript"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js" type="text/javascript"></script>

</body>
<script>
	$('#file-fr').fileinput({
		language : 'fr',
		uploadUrl : '#',
		allowedFileExtensions : [ 'jpg', 'png', 'gif' ],
	});
	$('#file-es').fileinput({
		language : 'es',
		uploadUrl : '#',
		allowedFileExtensions : [ 'jpg', 'png', 'gif' ],
	});
	$("#file-0").fileinput({
		'allowedFileExtensions' : [ 'jpg', 'png', 'gif' ],
	});
	$("#file-1").fileinput({
		uploadUrl : '#', // you must set a valid URL here else you will get an error
		allowedFileExtensions : [ 'jpg', 'png', 'gif' ],
		overwriteInitial : false,
		maxFileSize : 1000,
		maxFilesNum : 10,
		//allowedFileTypes: ['image', 'video', 'flash'],
		slugCallback : function(filename) {
			return filename.replace('(', '_').replace(']', '_');
		}
	});
	/*
	$(".file").on('fileselect', function(event, n, l) {
	    alert('File Selected. Name: ' + l + ', Num: ' + n);
	});
	 */
	$("#file-3").fileinput({
		showUpload : false,
		showCaption : false,
		browseClass : "btn btn-primary btn-lg",
		fileType : "any",
		previewFileIcon : "<i class='glyphicon glyphicon-king'></i>"
	});
	$("#file-4").fileinput({
		uploadExtraData : {
			kvId : '10'
		}
	});
 	$(".btn-warning").on('click', function() {
		if ($('#file-4').attr('disabled')) {
			$('#file-4').fileinput('enable');
		} else {
			$('#file-4').fileinput('disable');
		}
	}); 
	$(".btn-info").on('click', function() {
		$('#file-4').fileinput('refresh', {
			previewClass : 'bg-info'
		});
	});
	/*
	$('#file-4').on('fileselectnone', function() {
	    alert('Huh! You selected no files.');
	});
	$('#file-4').on('filebrowse', function() {
	    alert('File browse clicked for #file-4');
	});
	 */
	 $(document).ready(function() {
		$("#test-upload").fileinput({
			'showPreview' : false,
			'allowedFileExtensions' : [ 'jpg', 'png', 'gif' ],
			'elErrorContainer' : '#errorBlock'
		}); 
		/*
		$("#test-upload").on('fileloaded', function(event, file, previewId, index) {
		    alert('i = ' + index + ', id = ' + previewId + ', file = ' + file.name);
		});
		 */
	});
</script>
</html>