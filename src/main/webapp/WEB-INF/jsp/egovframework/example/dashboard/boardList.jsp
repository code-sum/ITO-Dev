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
	var pageSize = 5;     
	var pageBlockSize = 5;  
	
	/** OnLoad event **/ 
	$(function() {
		fn_pharlist();  // 약국 목록
	});
	
	/** 약국 목록  **/
	function fn_pharlist(pagenum) {
		
		pagenum = pagenum || 1;
		
		var param = {
			      pageSize : pageSize
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
	<div class="container" id="wrapper">
	
		<!-- 검색창 영역 -->
		<div class="d-flex justify-content-center align-items-center">
			<!-- 텍스트 영역 -->
			<div class="p-3">
				<h1 class="fw-bold">약국 찾기</h1>
			</div>
			<!-- 검색조건 입력 영역 -->
			<div class="p-3">
				<select></select>
			</div>
			<!-- 버튼 영역 -->
			<div class="p-3">
				<button type="button" class="btn btn-success">검 색</button>
			</div>
		</div>
		
		<!-- 목록 테이블 영역 -->
		<div>
			<table class="table table-hover">
				<colgroup>
						<col width="25%">
						<col width="25%">
						<col width="25%">
						<col width="25%">
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
		<div class="paging_area"  id="pharPagination"> </div>
		
		<!-- 위로가기 버튼 -->
		<div class="d-flex justify-content-end">
			<a href="#" class="scrollToTop">
			  <h1>
			    <i class="bi bi-arrow-up-circle-fill"></i>
			  </h1>
			</a>
		</div>
		
	</div>
	
	<!-- 푸터 영역 -->
	<jsp:include page="/WEB-INF/jsp/egovframework/example/cmmn/footer.jsp"></jsp:include>
	
</body>
</html>