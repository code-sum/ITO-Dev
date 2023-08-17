<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="/WEB-INF/jsp/egovframework/example/cmmn/common_include.jsp"></jsp:include>

<nav class="navbar navbar-expand-lg" style="background-color: #32A852; ">
  <div class="container-fluid">
    <a class="navbar-brand" href="/boardList.do" style="color:white; font-weight:bold; padding-left: 2rem; padding-right:1rem;">
    	<img src="/images/egovframework/cmmn/logo.png" alt="Logo" width="30" height="30" class="d-inline-block align-text-top">
    	모든약국
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <div class="navbar-nav">
        <a class="nav-link" href="/boardList.do" style="color:white; font-weight:bold; padding-right:1rem;">메인으로</a>
        <a class="nav-link" href="/regionList.do" style="color:white; font-weight:bold; padding-right:1rem;">지역별 약국 현황</a>
        <a class="nav-link" href="/reviewList.do" style="color:white; font-weight:bold; padding-right:1rem;">약국 추천 게시판</a>
      </div>
    </div>
  </div>
</nav>