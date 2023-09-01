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


	/**
	 * 약국 대분류/중분류/소분류 콤보박스
	 * (메인화면 검색기능)
	 */
	function pharCombo(comtype, combo_name, type, lcode, mcode, selvalue) {
	//                (combo type(l:대분류   m:중분류   s:소분류), combo_name, type(기본값  all: 전체   sel: 선택), 대분류코드, 중분류코드, 소분류코드, "")
		
		var selectbox = document.getElementById(combo_name);

		var data = {
					  "comtype" : comtype
					, "lcode" : lcode
					, "mcode" : mcode
			};	
		
		$(selectbox).find("option").remove();
	  		
		$.ajax({ 
			 url : "/system/pharCombo.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소 - 정상
			 data : data,
			 type : "POST", // HTTP 요청 방식(GET, POST)
		     dataType : "text",  // 서버 측에서 클라이언트로 리턴하는 데이터 타입, html 이나 text 로 고치면 success 로 넘어감
		     success: function(data)
		     { 				
		    	 console.log(data);
		    	 
		    	 /******************************
		    	 console.log(JSON.stringify(data));
			     var json_obj = $.parseJSON(JSON.stringify(data));//parse JSON 
			     var jsonstr = json_obj.list;
			     console.log("jsonstr : " + jsonstr);
			     
			     var jsonstr_obj = $.parseJSON(JSON.stringify(jsonstr));//parse JSON 
			     var listLen = jsonstr_obj.length;

		    	 if(type == "all") {
		    	    $(selectbox).append("<option value=''>전체</option>");
		    	 }		     
			     
		    	 if(type == "sel") {
			    	$(selectbox).append("<option value=''>선택</option>");
			     }
		    	 console.log(" selvalue : " + selvalue);
		    	 
		         for (var i=0; i<listLen; i++)
		         { 		
		        	 var eleString = JSON.stringify(jsonstr_obj[i]);
		        	 var item_obj = $.parseJSON(eleString);//parse JSON
	            
		        	 if (selvalue != null && selvalue != null && selvalue != "") {
		        		 if (selvalue == item_obj.dtl_cod) {
		        			 console.log(" item_obj.cd : " + item_obj.cd);
		        			 
		        			 $(selectbox).append("<option value='"+ item_obj.cd + "' selected>" + item_obj.name + "</option>");
		        		 } else {
		        			 $(selectbox).append("<option value='"+ item_obj.cd + "'>" + item_obj.name + "</option>");
		        		 }
		        	 } else {
		        		 $(selectbox).append("<option value='"+ item_obj.cd + "'>" + item_obj.name + "</option>");
		        	 }
		         } 
		         $(selectbox).val(selvalue);
		         ******************************/
		     },
		     error: function(request,status,error) { alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); }
		});  
	};
	
	
	/** 페이지네이션 **/
	var pageSize = 10;  // 1페이지에 10건씩 조회
	var pageBlockSize = 5;  
	
	
	/** OnLoad event **/ 
	$(function() {
		fn_btnEvent();  // 버튼 이벤트 등록
		fn_pharlist();  // 약국 목록
		
		// 지역구분_광역시도
		pharCombo("l","ltypecombo","all","","","","");  // combo type(l:대분류   m:중분류   s:소분류) combo_name, type(기본값  all: 전체   sel: 선택), 대분류 코드, 중분류코드, 소분류 코드, ""
		// 지역구분_시군구
		$('#ltypecombo').change(function() {
			pharCombo("m","mtypecombo","all",$("#ltypecombo").val(),"","","");   // combo type(combo box 종류), combo_name, type(기본값  all: 전체   sel: 선택), 선택된 상위 계정코드, "" 
			$("#stypecombo option").remove();
		});
		// 약국이름_목록
		$('#mtypecombo').change(function() {   
			pharCombo("s","stypecombo","all",$("#ltypecombo").val(),$("#mtypecombo").val(),"");   // combo type(combo box 종류), combo_name, type(기본값  all: 전체   sel: 선택), 선택된 상위 계정코드, "" 
		});
	});
	
	
	/** 버튼 이벤트 등록 */
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
		callAjax("/dashboard/boardlist.do", "post", "text", false, param, listcallback);
	}
	
	
	
	
</script>

</head>
<body>

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
					<div class="form-floating" style="width:20rem; height:4rem;">
						<input id="pname" name="pname" class="form-control p-1 text-end" type="text" placeholder="약국 이름">
						<label for="pname">이름을 입력해주세요.</label>
					</div>
					<div class="d-flex py-1">					
						<select id="ltypecombo" name="ltypecombo"></select>
						<select id="mtypecombo" name="mtypecombo"></select>
						<select id="stypecombo" name="stypecombo"></select>
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
						<col width="15%">
						<col width="15%">
						<col width="40%">
						<col width="30%">
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>지역</th>
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

	
</body>
</html>