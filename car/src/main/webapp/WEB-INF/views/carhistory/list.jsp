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
        	<div>
              	<input class="btn btn-danger" type="button" id="inputOutcome"
							value="지출입력" style="height: 30px" onclick="location.href='/car/write.action';"/>
				<input class="btn btn-danger" type="button" id="inputFuel"
							value="주유입력" style="height: 30px" onclick="location.href='/car/write.action';"/>
			</div>
			
	<section class="section" id="content_wrapper">
		<div class="content_area">
			<div class="content ledger_area" id="ledgerHistory">
				<header class="con_title">
				<h1 class="title_ledger_history">내역</h1>
			<div class="ledger_lnb">
			<div class="lnb_lt">
				<div class="ddOutOfVision" id="selLedger_msddHolder" style="height: 0px; overflow: hidden; position: absolute;">
					<select name="" id="selLedger" tabindex="-1">
						<option value="935" selected="selected">1127</option>
						<option value="937">0131</option>															
					</select>
				</div>
				<div class="dd ddcommon borderRadius" id="selLedger_msdd" tabindex="0" style="width: 210px;">
				<div class="ddTitle borderRadiusTp">
					<span class="divider"></span>
					<span class="ddArrow arrowoff"></span>
					<span class="ddTitleText " id="selLedger_title">
						<span class="ddlabel">1127</span>
						<span class="description" style="display: none;"></span>
					</span>
				</div>
				<input id="selLedger_titleText" type="text" autocomplete="off" class="text shadow borderRadius" style="display: none;">
				<div class="ddChild ddchild_ border shadow" id="selLedger_child" style="z-index: 9999; position: absolute; visibility: visible; display: none; height: 59px;">
				<ul>
				<li class="enabled _msddli_ selected">
				<span class="ddlabel">1127</span>
				<div class="clear"></div></li>
				<li class="enabled _msddli_">
				<span class="ddlabel">0131</span>
				<div class="clear"></div>
				</li>
				</ul>
				</div>
				</div>
				<a href="###" title="차량등록하러 가기" class="btn_reg_car j_btn_reg_car">차량등록</a>
			</div>
			<div class="lnb_rt">
				<a href="###" title="지출입력하러 가기" class="btn_spend_input j_btn_spend_input">지출입력</a>
				<a href="###" title="주유입력하러 가기" class="btn_fuel_input j_btn_fuel_input">주유입력</a>
			</div>
		</div>
	</header>
	<article class="con_wrap">
		<header class="box_history_search">
			<form action="" method="">
				<fieldset>
					<legend class="hidden">내역 검색하기</legend>
					<div class="history_search_lt">
						<dl>
							<dt>유형</dt>
							<dd>
								<div class="ddOutOfVision" id="selCarSttkind1_msddHolder" style="height: 0px; overflow: hidden; position: absolute;"><select name="" id="selCarSttkind1" tabindex="-1">
									<option value="">전체</option>
									<option value="1">주유</option>
									<option value="2">정비</option>
									<option value="3">유지</option>
								</select></div><div class="dd ddcommon borderRadius" id="selCarSttkind1_msdd" tabindex="0" style="width: 85px;"><div class="ddTitle borderRadiusTp">
								<span class="divider"></span><span class="ddArrow arrowoff"></span><span class="ddTitleText " id="selCarSttkind1_title"><span class="ddlabel">전체</span><span class="description" style="display: none;"></span></span></div><input id="selCarSttkind1_titleText" type="text" autocomplete="off" class="text shadow borderRadius" style="display: none;"><div class="ddChild ddchild_ border shadow" id="selCarSttkind1_child" style="position: absolute; visibility: visible; top: 32px; display: none; height: 143px; z-index: 1;"><ul><li class="enabled _msddli_ selected"><span class="ddlabel">전체</span><div class="clear"></div></li><li class="enabled _msddli_"><span class="ddlabel">주유</span><div class="clear"></div></li><li class="enabled _msddli_"><span class="ddlabel">정비</span><div class="clear"></div></li><li class="enabled _msddli_"><span class="ddlabel">유지</span><div class="clear"></div></li><li class="enabled _msddli_"><span class="ddlabel">용품구입</span><div class="clear"></div></li></ul></div></div>
							</dd>
						</dl>
						
					</div>
					<div class="history_search_rt">
						<dl>
							<dt>시작일</dt>
							<dd>
								<div class="inp_wrap inp_num">
									
									<input type="text" name="termstartdate" value="2015-08-12" size="10" maxlength="10" readonly="readonly" title="검색 시작일 선택" class="inp_txt_comm j_inp_calendar j_termstartdate hasDatepicker" id="dp1470963723511">
								</div>
							</dd>
						</dl>
						<dl>
							<dt>종료일</dt>
							<dd>
								<div class="inp_wrap inp_num">
									<input type="text" name="termenddate" value="2016-08-12" size="10" maxlength="10" readonly="readonly" title="검색 종료일 선택" class="inp_txt_comm j_inp_calendar j_termenddate hasDatepicker" id="dp1470963723512">
								</div>
							</dd>
						</dl>
						<a href="###" title="기간별 검색" class="btn_ledger_check j_btn_ledger_check">검색</a>
					</div>
				</fieldset>
			</form>
		</header>
		<table class="tb_history">
			<caption class="hideClass">내차 내역 및 통계</caption>
			<thead>
				<tr>
					<th scope="row" class="tb_car_chk">
						<div class="icheckbox_flat-aero" style="position: relative;"><input type="checkbox" name="all_check" value="" title="모두선택" class="inp_chk_comm j_icheck j_all_icheck" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"><ins class="iCheck-helper" style="position: absolute; top: -20%; left: -20%; display: block; width: 140%; height: 140%; margin: 0px; padding: 0px; border: 0px; opacity: 0; background: rgb(255, 255, 255);"></ins></div>
					</th>
					<th scope="row" class="regdate">날짜</th>
					<th scope="row" class="category">항목</th>
					<th scope="row" class="fee">금액</th>
					<th scope="row" class="liter">리터</th>
					<th scope="row" class="deleted">
						<button type="button" title="선택삭제" class="btn_td_sel_delete j_btn_td_sel_delete">
							<span class="bg_icon icon_chk"></span>선택삭제
						</button>
					</th>
				</tr>
			</thead>
			<tbody>
												
																													</tbody>
		</table>

		<div class="paging"></div>

		<input type="hidden" name="ledgeridx" value="">
		<input type="hidden" name="page" value="">
	</article>
</div>
			<aside id="aside"></aside>
		</div>
	</section>
			
			
			
        	<table class="table table-striped"  align="center" width="700px">
        		
        		<tr style="height:30px" align="center">
        			<td>날짜</td>
        			<td>항목</td>
        			<td>금액</td>
        			<td>리터</td>
        		</tr>        	
        	<c:forEach var="carhistory" items="${ historys }">
        		<tr style="height:30px">
        		
        			<td>${ carhistory.regdate }</td>
        			<td>${ carhistory.category }</td>
        			<td>${ carhistory.fee }</td>
        			<td>${ carhistory.liter }</td>
   
        		</tr>
        	</c:forEach>
        	
        	</table>
        	
        </div>
    </div>
    
</body>
</html>

