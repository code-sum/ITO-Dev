<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- 
<ul>
    <li class="current"><a href="#">노바백스 백신 2월중순부터 접종</a></li>
    <li class="next"><a href="#">얼어붙은 투심에…현대엔지니어링 상장 철회</a></li>
    <li><a href="#">"일본 정부, 사도광산 세계유산 추천 방침 굳혀, 일본과 갈등 첨예화 예상"</a></li>
    <li><a href="#">"공법변경 구조검토 요구, 현산 측이 묵살했다"</a></li> 
    <li class="prev"><a href="#">12월 주담대 금리 연 3.63%…7년7개월 만에 최고</a></li>
</ul>
 -->

<ul>
	<c:forEach items="${crawlResult}" var="entry">
		<li class="${status.index == 0 ? 'current' : (status.index == 1 ? 'next' : 'prev')}">
			<a href="${entry.value}">${entry.key}</a>
		</li>
	</c:forEach>
</ul>