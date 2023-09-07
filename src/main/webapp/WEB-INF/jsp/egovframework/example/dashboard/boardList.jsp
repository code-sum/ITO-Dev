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


<!-- 차트 Resources -->
<script src="https://cdn.amcharts.com/lib/5/index.js"></script>
<script src="https://cdn.amcharts.com/lib/5/wc.js"></script>
<script src="https://cdn.amcharts.com/lib/5/themes/Animated.js"></script>

<script type="text/javascript">

	/** 페이지네이션 **/
	var pageSize = 10;  // 1페이지에 10건씩 조회
	var pageBlockSize = 5;  
	
	
	/** OnLoad event **/ 
	$(function() {
		fn_btnEvent();  // 버튼 이벤트 등록
		fn_revlist();   // 게시판 최신글 목록
		fn_pharlist();  // 약국 목록
		
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
	
	
	/** 게시판 최신글 목록  **/
	function fn_revlist() {
		
		var listcallback = function(returnvalue) {
			console.log(returnvalue);
			$("#listrev").empty().append(returnvalue);
			 
		}
		callAjax("../dashboard/revlist.do", "post", "text", true, "", listcallback);
	}
	
	
	/** Word Cloud **/
	am5.ready(function() {

	// Create root element
	// https://www.amcharts.com/docs/v5/getting-started/#Root_element
	var root = am5.Root.new("chartdiv");
	
	// Set themes
	// https://www.amcharts.com/docs/v5/concepts/themes/
	root.setThemes([
	  am5themes_Animated.new(root)
	]);
	
	// Add series
	// https://www.amcharts.com/docs/v5/charts/word-cloud/
	var series = root.container.children.push(am5wc.WordCloud.new(root, {
	  maxCount:100,
	  minWordLength:2,
	  maxFontSize:am5.percent(35),
	  text: "종로 나간김에 약국 들려서 약쇼핑했습니다. 엄마가 카베진 사다달래서 열심히 서칭을 해봤더니 동네약국은 35000~40000원정도이고 종로약국거리에서는 25000원! 그 외 다른약들도 저렴해요. 저도 보은하는 마음으로 쇼핑 가격 영수증 올리옵니다. 종로약국거리에 제가 아는건 보령약국 뿐이였는데 바로 옆에 온유약국도 유명하더라고요. 몇몇제품은 가격이 더 저렴한것도 있다하고 저의 첫번째 목표인 카베진이 25000원이란 첩보로 온유로 갔습니다. 근데 약국거리약이 대체로 다 저렴하다는데 저는 모험하고 싶지않아서 알아본곳으로",
	}));
	
	// Configure labels
	series.labels.template.setAll({
	  paddingTop: 5,
	  paddingBottom: 5,
	  paddingLeft: 5,
	  paddingRight: 5,
	  fontFamily: "Courier New"
	});
	
	}); // end am5.ready()
	
	
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
			// console.log(returnvalue);
			
			$("#listphar").empty().append(returnvalue);
			
			var  totalcnt = $("#totalcnt").val();
			console.log("totalcnt : " + totalcnt);
			
			var paginationHtml = getPaginationHtml(pagenum, totalcnt, pageSize, pageBlockSize, 'fn_pharlist');
			// console.log("paginationHtml : " + paginationHtml);
			 
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
	
		<!-- Section 1 : 검색창 영역 시작 -->
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
			<!-- 검색버튼 영역 -->
			<div class="p-3">
				<a href="" id="btnSearch" name="btn" class="btn btn-success rounded-pill py-2 px-3">검 색</a>
			</div>
		</div>
		<!-- Section 1 : 검색창 영역 끝 -->
		
		
		<!-- Section 2 : 게시판 최신글 모아보기(좌) / 게시판 Word Cloud(우) 영역 시작 -->
		<div class="container text-center">
			<div class="row justify-content-center">
				<!-- 게시판 최신글 모아보기(5건) 영역 (화면 좌측) -->
				<div class="col col-lg-1 col-md-2 col-sm-2 customcard">
					<div class="cardtop">#&nbsp약국 추천 최신글</div>
					<div class="cardbottom">
						<table class="table table-hover text-start mb-0">
							<colgroup>
									<col width="20%">
									<col width="55%">
									<col width="25%">
							</colgroup>
							<thead>
								<tr>
									<th></th>
									<th>제목</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody id="listrev"></tbody>
						</table>
					</div>
				</div>
				
				<!-- Word Cloud 영역 (화면 우측) -->
				<div class="col col-lg-1 col-md-2 col-sm-2 customcard" style="border-bottom: 0.1rem solid #e7e7e7;">
					<div class="cardtop">#&nbsp약국 추천 핫이슈</div>
					<div class="cardbottom">
						<div id="chartdiv" style="height:18rem;"></div>
					</div>
				</div>		
			</div>
		</div>
		<!-- Section 2 : 게시판 최신글 모아보기(좌) / 게시판 Word Cloud(우) 영역 끝 -->

		
		<!-- Section 3 : 약국 목록 테이블 영역 시작 -->
		<div>
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
		</div>
		<!-- Section 3 : 약국 목록 테이블 영역 끝 -->
		
		
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