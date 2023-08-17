<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대시보드</title>
<jsp:include page="/WEB-INF/jsp/egovframework/example/cmmn/common_include.jsp"></jsp:include>

</head>
<body>
	<h1>약국 찾기</h1>
		<div>
			<table class="table">
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">약국이름</th>
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