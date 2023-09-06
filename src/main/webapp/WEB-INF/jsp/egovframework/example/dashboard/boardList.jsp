<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모든약국</title>
<jsp:include page="/WEB-INF/jsp/egovframework/example/cmmn/common_include.jsp"></jsp:include>
<jsp:include page="/WEB-INF/jsp/egovframework/example/cmmn/header.jsp"></jsp:include>

<script type="text/javascript">

	/** 페이지네이션 **/
	var pageSize = 10;  // 1페이지에 10건씩 조회
	var pageBlockSize = 5;  
	
	
	/** OnLoad event **/ 
	$(function() {
		fn_btnEvent();  // 버튼 이벤트 등록
		fn_pharlist();  // 약국 목록
		fn_yyyymmdd();
		
		// 콤보박스 검색 (구분코드:sido_code)
		pharCombo("l","ltypecombo","sido","","","","");  // comtype(l:대   m:중   s:소), comname, type, 대분류코드, 중분류코드, 소분류 코드, ""
		// 콤보박스 검색 (구분코드:sigungu_code)
		$('#ltypecombo').change(function() {
			pharCombo("m","mtypecombo","sigungu",$("#ltypecombo").val(),"","","");   // comtype(l:대   m:중   s:소), comname, type, 선택된 상위 계정코드, "" 
			$("#stypecombo option").remove();
		});
		// 콤보박스 검색 (구분코드:pharm_no)
		$('#mtypecombo').change(function() {   
			pharCombo("s","stypecombo","pharm",$("#ltypecombo").val(),$("#mtypecombo").val(),"");   // comtype(l:대   m:중   s:소), comname, type, 선택된 상위 계정코드, "" 
		});
		
	});
	
	
	/** 버튼 이벤트 등록 **/
	function fn_btnEvent() {
		$('a[name=btn]').click(function(e) {
			e.preventDefault();

			var btnId = $(this).attr('id');

			switch (btnId) {
				case 'btnSearch' :
					fn_pharlist();
					break;
				case 'btnTop' :
					fn_scrollToTop();
					break;
			}
		});
	}
	
	
	/** 약국 목록  **/
	function fn_pharlist(pagenum) {
		
		pagenum = pagenum || 1;
		
		var param = {
				  pname : $("#pname").val()
				, ltypecombo : $("#ltypecombo").val()
				, mtypecombo : $("#mtypecombo").val()
				, stypecombo : $("#stypecombo").val()
			    , pageSize : pageSize
			    , pageBlockSize : pageBlockSize
			    , pagenum : pagenum
		}
		
		var listcallback = function(returnvalue) {
			console.log(returnvalue);
			
			$("#listphar").empty().append(returnvalue);
			
			var  totalcnt = $("#totalcnt").val();
			console.log("totalcnt : " + totalcnt);
			
			var paginationHtml = getPaginationHtml(pagenum, totalcnt, pageSize, pageBlockSize, 'fn_pharlist');
			console.log("paginationHtml : " + paginationHtml);
			 
			$("#pharPagination").empty().append(paginationHtml);
			
			$("#pageno").val(pagenum);
		}
		callAjax("../dashboard/boardlist.do", "post", "text", true, param, listcallback);
	}
	
	
	
	
</script>

</head>
<body>
<form id="myForm" action=""  method="">

	<input type="hidden" id="pageno"  name="pageno"  />
	<div class="container" id="wrapper">
	
		<!-- 검색창 영역 -->
		<div class="d-flex justify-content-center align-items-center py-5">
			<!-- 텍스트 영역 -->
			<div class="p-3">
				<h1 class="fw-bold">약국 찾기</h1>
			</div>
			<!-- 검색조건 입력 영역 -->
			<div class="p-3">
				<div class="d-flex flex-column">
					<div class="form-floating" style="width:30rem; height:4rem;">
						<input id="pname" name="pname" class="form-control" type="text" placeholder="약국 이름">
						<label for="pname">이름을 입력해주세요.</label>
					</div>
					<div class="d-flex py-1" style="width:30rem;">					
						<select id="ltypecombo" name="ltypecombo" class="form-select me-1" style="width:8rem;"></select>
						<select id="mtypecombo" name="mtypecombo" class="form-select me-1" style="width:15rem;"></select>
						<select id="stypecombo" name="stypecombo" class="form-select"></select>
					</div>
				</div>
			</div>
			<!-- 버튼 영역 -->
			<div class="p-3">
				<a href="" id="btnSearch" name="btn" class="btn btn-success rounded-pill py-2 px-3">검 색</a>
			</div>
		</div>
		
		<!-- 목록 테이블 영역 -->
		<div class="px-5">
			<table class="table table-hover text-center">
				<colgroup>
						<col width="10%">
						<col width="15%">
						<col width="15%">
						<col width="35%">
						<col width="25%">
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>시도</th>
						<th>시군구</th>
						<th>약국명</th>
						<th>개업일</th>
					</tr>
				</thead>
				<tbody id="listphar"></tbody>
			</table>
		</div>
		
		<!-- 페이지네이션 영역 -->
		<div class="paging"  id="pharPagination"></div>
		
		<!-- 위로가기 버튼 -->
		<div class="d-flex justify-content-end">
			<a href="#" id="btnTop">
			  <h1>
			    <i class="bi bi-arrow-up-circle-fill text-success"></i>
			  </h1>
			</a>
		</div>
		
	</div>
	
	<!-- 푸터 영역 -->
	<jsp:include page="/WEB-INF/jsp/egovframework/example/cmmn/footer.jsp"></jsp:include>

</form>
</body>
</html>