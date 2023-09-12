<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>약국 추천 게시판</title>
<jsp:include page="/WEB-INF/jsp/egovframework/example/cmmn/common_include.jsp"></jsp:include>
<jsp:include page="/WEB-INF/jsp/egovframework/example/cmmn/header.jsp"></jsp:include>

<script type="text/javascript">


	/** 페이지네이션 **/
	var pageSize = 10;  // 1페이지에 10건씩 조회
	var pageBlockSize = 5;  
	
	
	/** OnLoad event **/ 
	$(function() {
		fn_btnEvent();    // 버튼 이벤트 등록
		fn_reviewlist();  // 게시글 목록
	});
	
	
	/** 버튼 이벤트 등록 */
	function fn_btnEvent() {
		$('a[name=btn]').click(function(e) {
			e.preventDefault();

			var btnId = $(this).attr('id');

			switch (btnId) {
				case 'btnSearch' :
					fn_reviewlist();
					break;
				case 'btnTop' :
					fn_scrollToTop();
					break;
			}
		});
	}
	
	
	/** 게시글 목록  **/
	function fn_reviewlist(pagenum) {
		
		pagenum = pagenum || 1;
		
		var param = {
					  searchKey : $("#searchKey").val()
				    , sname : $("#sname").val()
				    , pageSize : pageSize
				    , pageBlockSize : pageBlockSize
				    , pagenum : pagenum
		}
		
		var listcallback = function(returnvalue) {
			console.log(returnvalue);
			
			$("#listreview").empty().append(returnvalue);
			
			var  totalcnt = $("#totalcnt").val();
			console.log("totalcnt : " + totalcnt);
			
			var paginationHtml = getPaginationHtml(pagenum, totalcnt, pageSize, pageBlockSize, 'fn_reviewlist');
			console.log("paginationHtml : " + paginationHtml);
			 
			$("#reviewPagination").empty().append(paginationHtml);
			
			$("#pageno").val(pagenum);
		}
		callAjax("/review/reviewlist.do", "post", "text", false, param, listcallback);
	}
	
	
</script>

</head>
<body>
	<input type="hidden" id="pageno"  name="pageno"  />
	<div class="container" id="wrapper">
	
		<!-- 내용 -->
		<div class="layout">
			<div class="layout-header">
				<div class="d-flex justify-content-between align-items-center">				
					<div>
						<h1>약국 추천 게시판</h1>
					</div>
					<div>
						<a class="btn btn-outline-success rounded-pill" href="insertview.do">글쓰기</a>
					</div>			
				</div>
				<hr>
			</div>
			
			<!-- 검색창 -->
			<div class="searchbox">
				<select class="form-select" id="searchKey" name="searchKey" style="width:150px; margin-right:5px;" >
			        <option value="" >검색조건</option>
					<option value="re_title" >제목</option>
					<option value="re_content" >내용</option>
				</select>
				<div class="form-floating" style="width:20rem;">
					<input id="sname" name="sname" class="form-control" placeholder="검색어" type="text" >
					<label for="sname">검색어를 입력해주세요.</label>
				</div>
				<div class="d-flex align-items-center">				
					<a href="" id="btnSearch" name="btn" class="btn btn-success rounded-pill py-2 px-3 ms-2">검 색</a>
				</div>
			</div>
			
			<table class="table table-hover mt-2 mb-4 text-center">
				<colgroup>
						<col width="15%">
						<col width="45%">
						<col width="20%">
						<col width="20%">
				</colgroup>
				<thead>
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody id="listreview"></tbody>
			</table>
		</div>
		
		<!-- 페이지네이션 영역 -->
		<div class="paging"  id="reviewPagination"></div>

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