<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역별 약국 현황</title>
<jsp:include page="/WEB-INF/jsp/egovframework/example/cmmn/common_include.jsp"></jsp:include>
<jsp:include page="/WEB-INF/jsp/egovframework/example/cmmn/header.jsp"></jsp:include>

</head>
<body>
	<div class="container" id="wrapper">
		<h1 class="fw-bold">지역별 약국 현황</h1>
		<hr>
		
		<!-- 시각화 표출 영역 (표/차트) -->
		<div class="d-flex" style="width:100%;">
		
			<!-- 표 영역 -->
			<div style="float:left; width:30%;">
				<table class="table table-hover">
				<colgroup>
						<col width="50%">
						<col width="50%">
				</colgroup>
				<thead>
					<tr>
						<th>지역</th>
						<th>(단위: 개소)</th>
					</tr>
				</thead>
				<tbody>
					<tr>
				      <td>서울</td>
				      <td>데이터</td>
				    </tr>
   					<tr>
				      <td>부산</td>
				      <td>데이터</td>
				    </tr>
				</tbody>
			</table>
			</div>
			
			<!-- 차트 영역 -->
			<div style="float:right; width:70%;">
				차트 영역입니다
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