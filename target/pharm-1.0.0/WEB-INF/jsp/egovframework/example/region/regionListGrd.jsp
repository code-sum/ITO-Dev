<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


	<c:forEach items="${list}" var="result">
		<tr>
			<td>${result.sido_name}</td>
			<td class="numcom">${result.counts}</td>
		</tr>
	</c:forEach>
