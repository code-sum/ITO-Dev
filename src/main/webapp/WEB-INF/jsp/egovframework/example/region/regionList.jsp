<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역별 약국 현황</title>
<jsp:include page="/WEB-INF/jsp/egovframework/example/cmmn/header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/jsp/egovframework/example/cmmn/common_include.jsp"></jsp:include>

</head>
<body>
	<h1>지역별 약국 현황</h1>
		<div>
			<table class="custom-table">
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
</body>
</html>