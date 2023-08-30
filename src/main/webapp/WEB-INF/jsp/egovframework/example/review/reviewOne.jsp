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
	
	/** 수정 버튼 클릭 시, form 제출 **/ 
	$(document).on('click', '#btn_modify', function(e) {
        if (confirm("정말 수정하시겠습니까 ?") == true) {
            $("#update_form").submit();
        } else {
            return;
        }
    });
	
	
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
	                        	<span style="font-size:0.7rem; color:#32A852;">※ 4자리 숫자를 입력하세요.</span>
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
					<button id="btn_modify" type="button" class="btn btn-outline-success rounded-pill">수정</button>
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