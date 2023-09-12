<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<ul>
	<c:forEach items="${crawlResult}" var="entry">
		<li>
			<a href="${entry.value}">${entry.key}</a>
		</li>
	</c:forEach>
</ul>