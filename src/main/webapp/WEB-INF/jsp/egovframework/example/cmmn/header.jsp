<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="/WEB-INF/jsp/egovframework/example/cmmn/common_include.jsp"></jsp:include>

<script type="text/javascript">


 /** OnLoad event **/ 
	$(function() {
		fn_news();
	});

 
/** 지금 뜨는 약국 뉴스 **/		
function fn_news() {
	var listcallback = function(returnvalue) {
		// console.log(returnvalue);
		$("#listnews").empty().append(returnvalue);
	}
	callAjax("../crawl/jsoupCrawler.do", "post", "text", true, "", listcallback);
}

</script>

<!-- 네비게이션 바 -->
<nav class="navbar navbar-expand-lg" style="background-color:#198754;">
  <div class="container-fluid px-5">
    <a class="navbar-brand" href="/dashboard/mainIndex.do" style="color:white; font-weight:bold;">
    	<img src="<c:url value='/resources/images/logo.png'/>" alt="" width="30" height="30" class="d-inline-block align-text-top">
    	모든약국
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-end" id="navbarNavAltMarkup">
      <div class="navbar-nav">
  		<a class="nav-link active" aria-current="page" href="/dashboard/mainIndex.do" style="color:white; font-weight:bold; padding-right:1rem;">메인으로</a>
        <a class="nav-link" href="/region/regionIndex.do" style="color:white; font-weight:bold; padding-right:1rem;">지역별 약국 현황</a>
        <a class="nav-link" href="/review/reviewIndex.do" style="color:white; font-weight:bold;">약국 추천 게시판</a>
      </div>
    </div>
  </div>
</nav>

<!-- 지금 뜨는 약국 뉴스 -->
<div class="container-fluid p-0">
	<div class="d-flex flex-column justify-content-center align-items-center text-center py-5" style="background-color:#F0F0F0;">
		<div>
			<p style="font-size:1.3rem; font-weight:bold;">지금 뜨는 약국 뉴스</p>
		</div>
		<div class="rollingbanner">
		    <div class="title">NEW</div>
		    <div class="wrap">
		        <ul>
		            <li class="current"><a href="#">노바백스 백신 2월중순부터 접종</a></li>
		            <li class="next"><a href="#">얼어붙은 투심에…현대엔지니어링 상장 철회</a></li>
		            <li><a href="#">"일본 정부, 사도광산 세계유산 추천 방침 굳혀, 일본과 갈등 첨예화 예상"</a></li>
		            <li><a href="#">"공법변경 구조검토 요구, 현산 측이 묵살했다"</a></li> 
		            <li class="prev"><a href="#">12월 주담대 금리 연 3.63%…7년7개월 만에 최고</a></li>
		        </ul>
		        
		        <!-- CrawlController.java 에서 받아온 "crawlResult" -->
		        <!-- 시작하는 li 태그의 class="current", 그다음 태그의 class="next", ... , 마지막 태그의 class="prev" -->
		        <!--
				<ul>
					<c:forEach items="${crawlResult}" var="entry">
						<li>
							<a href="${entry.value}">${entry.key}</a>
						</li>
					</c:forEach>
				</ul>
				 -->
				
		    </div>
		</div>
	</div>
</div>

<!-- 
<div>
	<span>return 테스트</span>
	<div id="listnews"></div>
</div>
 -->









