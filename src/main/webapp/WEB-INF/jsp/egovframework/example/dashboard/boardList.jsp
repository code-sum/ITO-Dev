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
	  text: "Though yet of Hamlet our dear brother's death The memory be green, and that it us befitted To bear our hearts in grief and our whole kingdom To be contracted in one brow of woe, Yet so far hath discretion fought with nature That we with wisest sorrow think on him, Together with remembrance of ourselves. Therefore our sometime sister, now our queen, The imperial jointress to this warlike state, Have we, as 'twere with a defeated joy,-- With an auspicious and a dropping eye, With mirth in funeral and with dirge in marriage, In equal scale weighing delight and dole,-- Taken to wife: nor have we herein barr'd Your better wisdoms, which have freely gone With this affair along. For all, our thanks. Now follows, that you know, young Fortinbras, Holding a weak supposal of our worth, Or thinking by our late dear brother's death Our state to be disjoint and out of frame, Colleagued with the dream of his advantage, He hath not fail'd to pester us with message, Importing the surrender of those lands Lost by his father, with all bonds of law, To our most valiant brother. So much for him. Now for ourself and for this time of meeting: Thus much the business is: we have here writ To Norway, uncle of young Fortinbras,-- Who, impotent and bed-rid, scarcely hears Of this his nephew's purpose,--to suppress His further gait herein; in that the levies, The lists and full proportions, are all made Out of his subject: and we here dispatch You, good Cornelius, and you, Voltimand, For bearers of this greeting to old Norway; Giving to you no further personal power To business with the king, more than the scope Of these delated articles allow. Farewell, and let your haste commend your duty. Tis sweet and commendable in your nature, Hamlet,To give these mourning duties to your father: But, you must know, your father lost a father; That father lost, lost his, and the survivor bound In filial obligation for some term To do obsequious sorrow: but to persever In obstinate condolement is a course Of impious stubbornness; 'tis unmanly grief; It shows a will most incorrect to heaven, A heart unfortified, a mind impatient, An understanding simple and unschool'd: For what we know must be and is as common As any the most vulgar thing to sense, Why should we in our peevish opposition Take it to heart? Fie! 'tis a fault to heaven, A fault against the dead, a fault to nature, To reason most absurd: whose common theme Is death of fathers, and who still hath cried, From the first corse till he that died to-day, 'This must be so.' We pray you, throw to earth This unprevailing woe, and think of us As of a father: for let the world take note, You are the most immediate to our throne; And with no less nobility of love Than that which dearest father bears his son, Do I impart toward you. For your intent In going back to school in Wittenberg, It is most retrograde to our desire: And we beseech you, bend you to remain Here, in the cheer and comfort of our eye, Our chiefest courtier, cousin, and our son.",
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
		<div class="d-flex flex-row justify-content-center">
			<!-- 게시판 최신글 모아보기(5건) 영역 (화면 좌측) -->
			<div class="customcard">
				<div class="cardtop">#게시판 최신글</div>
				<div class="cardbottom">...</div>
			</div>
			
			<!-- Word Cloud 영역 (화면 우측) -->
			<div class="customcard">
				<div class="cardtop">#와글와글</div>
				<div class="cardbottom">
					<div id="chartdiv" style="height:20rem;"></div>
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