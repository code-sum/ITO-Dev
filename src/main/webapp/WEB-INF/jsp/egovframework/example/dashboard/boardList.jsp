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
		fn_cloud();     // 시각화(Word Cloud) 및 데이터 요청
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
					fn_display();
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
			// console.log(returnvalue);
			$("#listrev").empty().append(returnvalue);
			 
		}
		callAjax("../dashboard/revlist.do", "post", "text", true, "", listcallback);
	}
	
	
	/** 시각화(Word Cloud) 구현 및 데이터 요청 **/
	function fn_cloud() {
		
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
			var series = root.container.children.push(
			  am5wc.WordCloud.new(root, {
				  excludeWords: 
					  ["합니다", "같아요", "있습니다", "방문했습니다", "됩니다", "저는", "제가", "저도", 
						  "그래서", "그리고", "하지만", "오늘은", "최근에", "참고로", "분들이", "모르겠지만", 
						  "가장", "많이", "너무", "제일", "같이", "정말", "조금", "있는", "있다고", "설명해", "좋은", 
						  "00", "30", "ㅎㅎ", "apos"],   // 시각화에서 제외할 불용어 목록
				  maxCount:100,     // 시각화할 단어의 갯수
				  minWordLength:2,  // 시각화할 단어의 최소길이
				  maxFontSize:am5.percent(35),
				  colors: am5.ColorSet.new(root, {
				      colors: [
				        am5.color(0x095256),
				        am5.color(0x087f8c),
				        am5.color(0x5aaa95),
				        am5.color(0x86a873),
				        am5.color(0xbb9f06)
				      ]
				    }),
				  text: "",
			}));
		
		
			/** 시각화(Word Cloud) 구현을 위한 JSON 데이터 받기 **/
			function fn_getJSON() {
				
				var callback = function(returndata) {
					
					var str = $.parseJSON(JSON.stringify(returndata));  //parse JSON
					var str_list = str.list;
					
					var parsedData = $.parseJSON(JSON.stringify(str_list));  //parse JSON
					var listLen = parsedData.length;
					
					// parsedData 에서 key가 review_content인 값들만 뽑아오는 배열(content_list) 만들기
					var content_list = [];
					for (var i=0; i<listLen; i++) {
						var items = JSON.stringify(parsedData[i]);
			            var item = $.parseJSON(items);
						
						// 만들어진 배열을 content_list 에 저장
						if (item.hasOwnProperty("review_content")) {
							content_list.push(item.review_content);
			            } else {
			        	    console.log("잘못됨");
			            };
					}
				
					// JSON 데이터가 담긴 배열 content_list를 하나의 문자열(str_cloud)로 합치기
					str_cloud = content_list.join(' ');
					
					// 'series' 의 'text' 를 str_cloud 로 업데이트
					series.set("text", str_cloud);
				}
				callAjax("../dashboard/wordJSON.do", "get", "json", true, "", callback);
			}
			
			// DB 데이터 호출 및 'text' 업데이트
			fn_getJSON();
		
			// Configure labels
			series.labels.template.setAll({
			  paddingTop: 5,
			  paddingBottom: 5,
			  paddingLeft: 5,
			  paddingRight: 5,
			  fontFamily: "Courier New"
			});
			
			}); // end am5.ready()	
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
			// console.log(returnvalue);
			
			$("#listphar").empty().append(returnvalue);
			
			var  totalcnt = $("#totalcnt").val();
			// console.log("totalcnt : " + totalcnt);
			
			var paginationHtml = getPaginationHtml(pagenum, totalcnt, pageSize, pageBlockSize, 'fn_pharlist');
			// console.log("paginationHtml : " + paginationHtml);
			
			// 콤보박스 활용해서 1건 조회할 때만 생기던 페이지네이션 문제 해결 완료
			// 해결 방법 : #stypecombo 가 입력되면(=콤보박스로 1건 조회 시), 페이징 영역 삭제
			if ( $("#stypecombo").val()==null || $("#stypecombo").val()=='') {			
				$("#pharPagination").empty().append(paginationHtml);
			} else {				
				$("#pharPagination").empty();
			}
			
			$("#pageno").val(pagenum);
		}
		callAjax("../dashboard/boardlist.do", "post", "text", true, param, listcallback);
	}
	
	
	/** btnSearch 기능 추가 **/
	
	// [초기값] 평소엔 section2 열고, section3 닫기
	// [함수 동작 시] btnSearch 클릭 시, section2 닫고, section3 열기

	function fn_display() {
		
		var second = document.getElementById("section2");
		var third = document.getElementById("section3");
		
		var param1 = $("#pname").val()
		var param2 = $("#ltypecombo").val()
		var param3 = $("#mtypecombo").val()
		var param4 = $("#stypecombo").val()
				
		// if 검색조건으로 넘기는 파라미터가 하나도 없으면, 화면을 전환하지 않는다.
		// else if 검색조건으로 넘기는 파라미터가 하나라도 있으면, 화면을 전환한다.
		if ( ((param1==null)||(param1=='')) && ((param2==null)||(param2=='')) && ((param3==null)||(param3=='')) && ((param4==null)||(param4=='')) ) {
			third.style.display = 'none';
			second.style.display = 'block';
		} else if ( ((param1 != null)||(param1 != '')) || ((param2 != null)||(param2 != '')) || ((param3 != null)||(param3 != '')) || ((param4 != null)||(param4 != '')) ) {			
			third.style.display = 'block';
			second.style.display = 'none';
		}
		
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
		<div id="section2" class="container text-center">
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
						<div id="chartdiv" style="height:18rem; cursor:pointer;" onclick="location.href='../review/reviewIndex.do';"></div>
					</div>
				</div>		
			</div>
		</div>
		<!-- Section 2 : 게시판 최신글 모아보기(좌) / 게시판 Word Cloud(우) 영역 끝 -->

		
		<!-- Section 3 : 약국 목록 테이블 영역 시작 -->
		<div id="section3">
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