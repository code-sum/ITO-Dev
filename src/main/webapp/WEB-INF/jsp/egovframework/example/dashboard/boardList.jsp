<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모든약국</title>
<jsp:include page="/WEB-INF/jsp/egovframework/example/cmmn/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/jsp/egovframework/example/cmmn/common_include.jsp"></jsp:include>

</head>
<body>
	<div class="container">
		<h1 class="fw-bold">약국 찾기</h1>
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
				<tbody>
					<c:forEach items="${list }" var="list">
						<tr>
							<td><c:out value="${list.pharm_no }" /></td>
							<td><c:out value="${list.sido_name }" /></td>
							<td><c:out value="${list.pharm_name }" /></td>
							<td><c:out value="${list.pharm_open }" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	<!-- TOP 버튼 -->
	<a href="#" class="scrollToTop">
	  <h1>
	    <i class="bi bi-arrow-up-circle-fill"></i>
	  </h1>
	</a>
</body>
</html>