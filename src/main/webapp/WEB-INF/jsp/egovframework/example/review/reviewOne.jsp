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
	});
	
	
</script>

</head>
<body>
	<div class="container" id="wrapper">
		
		<!-- 내용 -->
		<div class="layout">
			<div class="layout-header">			
				<h1>${vo.review_title}</h1>
				<hr>
			</div>
			<table class="table mt-2 mb-4">
				<tbody>
					<colgroup>
						<col width="20%">
						<col width="80%">
					</colgroup>
	                 <tr>
	                     <th>작성자</th>
	                     <td>방문자</td>
	                 </tr>
	                 <tr>
	                     <th>내용</th>
	                     <td>${vo.review_content}</td>
	                 </tr>
	                 <tr>
	                     <th>작성일</th>
	                     <td>${vo.review_created_at}</td>
	                 </tr>
	                 <tr>
	                     <th>비밀번호</th>
	                     <td>${vo.review_password}</td>
	                 </tr>
	             </tbody>
			</table>
			
			<!-- 뒤로가기 버튼 -->
			<div>
				<a href="/review/reviewIndex.do" class="btn btn-outline-success rounded-pill">목록으로</a>
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