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
		console.log(returnvalue);
		$("#listnews").empty().append(returnvalue);
	}
	callAjax("../crawl/jsoupCrawler.do", "post", "text", false, "", listcallback);
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
		    <div class="wrap" id="listnews">		         
		    </div>
		</div>
	</div>
</div>







