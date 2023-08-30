<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


	<c:if test="${totalcnt eq 0 }">
		<tr>
			<td colspan="3">데이터가 존재하지 않습니다.</td>
		</tr>
	</c:if>
			
	<c:if test="${totalcnt > 0 }">
		<c:forEach items="${reviewsearchlist }" var="list">
			<tr>
				<td>${list.review_no }</td>
				<td><a href="/review/reviewselectone.do?review_no=${list.review_no}">${list.review_title }</a></td>
				<td>방문자</td>
				<td>${list.review_created_at }</td>
			</tr>
		</c:forEach>
	</c:if>
	
	<input type="hidden" id="totalcnt" name="totalcnt" value ="${totalcnt}"/>