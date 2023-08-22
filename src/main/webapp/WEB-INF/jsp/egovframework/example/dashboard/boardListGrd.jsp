<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


	<c:if test="${totalcnt eq 0 }">
		<tr>
			<td colspan="4">데이터가 존재하지 않습니다.</td>
		</tr>
	</c:if>
			
	<c:if test="${totalcnt > 0 }">
		<c:forEach items="${list }" var="list">
			<tr>
				<td><c:out value="${list.pharm_no }" /></td>
				<td><c:out value="${list.sido_name }" /></td>
				<td><c:out value="${list.pharm_name }" /></td>
				<td><c:out value="${list.pharm_open }" /></td>
			</tr>
		</c:forEach>
	</c:if>
	
	<input type="hidden" id="totalcnt" name="totalcnt" value ="${totalcnt}"/>