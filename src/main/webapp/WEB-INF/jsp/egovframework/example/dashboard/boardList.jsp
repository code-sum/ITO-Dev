<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대시보드</title>
<jsp:include page="/WEB-INF/jsp/egovframework/example/cmmn/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/jsp/egovframework/example/cmmn/common_include.jsp"></jsp:include>

</head>
<body>
	<div class="container">
		<h1 class="fw-bold">약국 찾기</h1>
		<div>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>번호</th>
						<th>약국이름</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="list">
						<tr>
							<td><c:out value="${list.pharm_no }" /></td>
							<td><c:out value="${list.pharm_name }" /></td>
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