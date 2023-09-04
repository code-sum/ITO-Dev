<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역별 약국 현황</title>
<jsp:include page="/WEB-INF/jsp/egovframework/example/cmmn/common_include.jsp"></jsp:include>
<jsp:include page="/WEB-INF/jsp/egovframework/example/cmmn/header.jsp"></jsp:include>

<script type="text/javascript">
	
	
	/** OnLoad event **/ 
	$(function() {
		fn_btnEvent();  // 버튼 이벤트 등록
		fn_phartable();  // 광역시도별 약국 개수 출력
	});
	
	
	/** 광역시도별 약국 개수 출력  **/
	function fn_phartable() {
		
	   var param = {};
	   
	   var listcallback = function(data) {
		   $(".table tbody").empty();

		   // 데이터 구조 확인 후 수정
		   if (data && data.pharmacybyregion) {
		       $.each(data.pharmacybyregion, function(index, item) {
		           var row = $("<tr></tr>");
		           var nameCell = $("<td></td>").text(item.sido_name);
		           var countCell = $("<td></td>").text(item.count);

		           row.append(nameCell);
		           row.append(countCell);
		           $(".table tbody").append(row);
		       });
		   } else {
	       		console.log("Invalid or missing data format.");
		   }
		}
	   callAjax("/region/regionIndex.do", "post", "json", true, param, listcallback);
	}
	
	
	/** 버튼 이벤트 등록 */
	function fn_btnEvent() {
		$('a[name=btn]').click(function(e) {
			e.preventDefault();

			var btnId = $(this).attr('id');

			switch (btnId) {
				case 'btnTop' :
					fn_scrollToTop();
					break;
			}
		});
	}
	
	
</script>

</head>
<body>
	<div class="container" id="wrapper">
	
		<!-- 시각화 표출 상단(페이지 타이틀) -->
		<div class="d-flex justify-content-center my-5">
			<div>
				<h1 class="fw-bold">지역별 약국 현황</h1>
			</div>		
		</div>
		
		<!-- 시각화 표출 영역 (1.표 / 2.차트) -->
		<div class="d-flex" style="width:100%;">
		
			<!-- 1.표 -->
			<div style="float:left; width:30%;">
				
				<table class="table table-hover">
					<colgroup>
							<col width="50%">
							<col width="50%">
					</colgroup>
					<thead>
						<tr>
							<th>시도 이름</th>
							<th>(단위: 개소)</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
				
				<!-- 1.표(전체개수출력) -->
				<div>
					<span></span>
				</div>
				
			</div>
			
			<!-- 2.차트 -->
			<div style="float:right; width:70%;">
				차트 영역입니다
			</div>
			
		</div>
		
		<!-- 위로가기 버튼 -->
		<div class="d-flex justify-content-end">
			<a href="#" id="btnTop">
			  <h1>
			    <i class="bi bi-arrow-up-circle-fill text-success"></i>
			  </h1>
			</a>
		</div>
		
	</div>
	
	<!-- 푸터 영역 -->
	<jsp:include page="/WEB-INF/jsp/egovframework/example/cmmn/footer.jsp"></jsp:include>
	
</body>
</html>