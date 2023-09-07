<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

			
<c:forEach items="${revlist}" var="list">
	<tr>
		<td class="text-end">
			<img src="<c:url value='/resources/images/new.gif'/>" alt="" width="30" height="15" class="d-inline-block align-text-top">
		</td>
		<td><a href="../review/reviewselectone.do?review_no=${list.review_no}">${list.review_title}</a></td>
		<td>${list.review_created_at}</td>
	</tr>
</c:forEach>
