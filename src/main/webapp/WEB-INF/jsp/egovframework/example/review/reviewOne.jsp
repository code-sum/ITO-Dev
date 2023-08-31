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


	/** OnLoad event **/ 
	$(function() {
		fn_btnEvent();  // 버튼 이벤트 등록
		fn_update();  // 글수정
		fn_delete();  // 글삭제
	});
	
	
	/** 버튼 이벤트 등록 */
	function fn_btnEvent() {
		$('a[name=btn]').click(function(e) {
			e.preventDefault();
	
			var btnId = $(this).attr('id');
	
			switch (btnId) {
				case 'btnUpdate' :
					fn_update();
					break;
				case 'btnDelete' :
					fn_delete();
					break;
				case 'btnTop' :
					fn_scrollToTop();
					break;
			}
		});
	}
	
	
	/** 글수정 **/ 
	function fn_update() {		
		$(document).on('click', '#btnUpdate', function(e) {
	        if (confirm("정말 수정하시겠습니까 ?") == true) {
	            $("#update_form").submit();
	        } else {
	            return;
	        }
	    });
	}
	
	
	/** 글삭제 **/
	function fn_delete() {		
		$(document).on('click', '#btnDelete', function(e) {
	        var review_no = ${vo.review_no};
	        if (confirm("정말 삭제하시겠습니까 ?") == true) {
	            $("#update_form").attr("action", "reviewdelete.do?review_no="+review_no);
	            $("#update_form").submit();
	        } else {
	            return;
	        }
	    });
	}
	
	
</script>

</head>
<body>

	<div class="container" id="wrapper">
		
		<!-- 내용 -->
		<div class="layout">
			<div class="layout-header">			
				<h1>약국 추천 게시판</h1>
				<hr>
			</div>
			<form id="update_form" action="reviewupdate.do" method="post" encType="multiplart/form-data">
				
				<input type="hidden" value="${vo.review_no}" name="review_no" class="form-control"  />			
				<table class="table mt-2 mb-4">
					<tbody>
						<colgroup>
							<col width="15%">
							<col width="75%">
						</colgroup>
		                <tr>
		                    <th>작성자</th>
		                    <td>방문자</td>
		                </tr>
						<tr>
	                        <th>제목</th>
	                        <td><input type="text" value="${vo.review_title}" name="review_title" class="form-control" /></td>
	                    </tr>
	                    <tr>
	                        <th>내용</th>
	                        <td><textarea name="review_content" class="form-control" style="height:15rem;">${vo.review_content}</textarea></td>
	                    </tr>
		                <tr>
		                    <th>작성일</th>
		                    <td>${vo.review_created_at}</td>
		                </tr>
	                    <tr>
	                        <th>비밀번호</th>
	                        <td>
	                        	<input type="text" value="${vo.review_password}" maxlength="4" name="review_password" class="form-control" />
	                        	<span style="font-size:0.7rem; color:#32A852;">※ 4자리 이하 숫자를 입력하세요.</span>
                        	</td>
	                    </tr>
		             </tbody>
				</table>
			</form>
			
			<!-- 버튼 영역 -->
			<div class="d-flex justify-content-between">			
				<div>
					<a href="/review/reviewIndex.do" class="btn btn-outline-success rounded-pill">목록으로</a>
				</div>
				<div>
					<button id="btnUpdate" type="button" class="btn btn-outline-success rounded-pill">수정</button>
					<button id="btnDelete" type="button" class="btn btn-outline-danger rounded-pill">삭제</button>
				</div>
			</div>
			
		</div>

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