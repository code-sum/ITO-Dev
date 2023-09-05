<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="/WEB-INF/jsp/egovframework/example/cmmn/common_include.jsp"></jsp:include>

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
	<div class="text-center pt-5 pb-4" style="background-color:#F0F0F0;">
		<p style="font-size:1.1rem; font-weight:bold;">지금 뜨는 약국 뉴스</p>
		<p style="font-size:1rem;"><span class="fw-bold me-2" style="color:#32A852;">NEW</span>'판매중단' 1·2위 어린이 해열제, 약국 복귀</p>
	</div>
</div>









