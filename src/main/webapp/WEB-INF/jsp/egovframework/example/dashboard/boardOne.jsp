<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모든약국</title>
<jsp:include page="/WEB-INF/jsp/egovframework/example/cmmn/common_include.jsp"></jsp:include>
<jsp:include page="/WEB-INF/jsp/egovframework/example/cmmn/header.jsp"></jsp:include>

<!-- 카카오맵 API key -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b17525f834ecee297d264ccce2e1b077&libraries=services"></script>
 
<script type="text/javascript">
	
	/** OnLoad event **/ 
	$(function() {
		
	/* 카카오맵 JS코드 시작 */
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${vo.pharm_add}', function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
	/* 카카오맵 JS코드 끝 */    
	
	});
	
	
</script>

</head>
<body>
	<div class="container" id="wrapper">
		
		<!-- 내용 -->
		<div class="layout">
			<div class="layout-header">			
				<h1>${vo.pharm_name}</h1>
				<hr>
			</div>
			<table class="table mt-2 mb-4">
				<tbody>
	                 <tr>
	                     <th>주소</th>
	                     <td>${vo.pharm_add}<span style="color:#a0a0a0">&nbsp;&nbsp;&nbsp;&nbsp;(우)${vo.pharm_zip}</span></td>
	                 </tr>
	                 <tr>
	                     <th>전화번호</th>
	                     <td>${vo.pharm_tel}</td>
	                 </tr>
	                 <tr>
	                     <th>개업일</th>
	                     <td>${vo.pharm_open}</td>
	                 </tr>
	             </tbody>
			</table>
			
			<!-- 카카오맵 표출 -->
			<div id="map" style="width:100%;height:350px;"></div>
			
			<!-- 뒤로가기 버튼 -->
			<div class="mt-3">			
				<a href="/dashboard/mainIndex.do" class="btn btn-outline-success rounded-pill">목록으로</a>
			</div>
			
		</div>

		<!-- 위로가기 버튼 -->
		<div class="d-flex justify-content-end">
			<a href="#" class="scrollToTop">
			  <h1>
			    <i class="bi bi-arrow-up-circle-fill"></i>
			  </h1>
			</a>
		</div>
		
	</div>
	
	<!-- 푸터 영역 -->
	<jsp:include page="/WEB-INF/jsp/egovframework/example/cmmn/footer.jsp"></jsp:include>
	
</body>
</html>