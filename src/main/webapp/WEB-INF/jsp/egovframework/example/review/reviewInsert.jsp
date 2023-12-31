<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>약국 추천 게시판</title>
<jsp:include page="/WEB-INF/jsp/egovframework/example/cmmn/common_include.jsp"></jsp:include>
<jsp:include page="/WEB-INF/jsp/egovframework/example/cmmn/header.jsp"></jsp:include>
 
<script type="text/javascript">


	/** OnLoad event **/ 
	$(function() {
		fn_btnEvent();  // 버튼 이벤트 등록
		fn_randomID();  // 랜덤아이디
		fn_insert();    // 글생성
	});
	
	
	/** 버튼 이벤트 등록 */
	function fn_btnEvent() {
		$('a[name=btn]').click(function(e) {
			e.preventDefault();

			var btnId = $(this).attr('id');

			switch (btnId) {
				case 'btnRegister' :
					fn_insert();
					break;
				case 'btnTop' :
					fn_scrollToTop();
					break;
			}
		});
	}
	
	
	/** 글작성자 이름 랜덤 문자열로 생성하는 로직 **/
	function fn_randomID() {
		
		var randomStr = Math.random().toString(36).substring(2, 8);
		// console.log(randomStr);
		
		$("#review_writer").attr("value", randomStr);
		
	}
	
	
	/** 글생성 **/ 
	function fn_insert() {
		   $(document).on('click', '#btnRegister', function(e) {
		       // 제목과 비밀번호 값 가져오기
		       var titleValue = $("#review_title").val();
		       var passwordValue = $("#review_password").val();

		       // 제목과 비밀번호가 비어있는지 확인
		       if (titleValue.trim() === "") {
		           alert("제목을 입력하세요.");
		           e.preventDefault(); // 폼 제출 중단
		       } else if (passwordValue.trim() === "") {
		           alert("비밀번호를 입력하세요.");
		           e.preventDefault(); // 폼 제출 중단
		       } else if (titleValue.trim() !== "" && passwordValue.trim() !== "") {
		           // 유효한 데이터이므로 폼 제출
		           $("#review_form").submit();
		       }
		   });
		}
	
	
	
</script>

</head>
<body>
	<div class="container" id="wrapper">
		
		<!-- 내용 -->
		<div class="layout">
			<div class="layout-header">			
				<h1>약국 추천 글쓰기</h1>
				<hr>
			</div>
			<form id="review_form" action="reviewinsert.do" method="post" encType="multiplart/form-data">
	            <table class="table mt-2 mb-4">
	                <tbody>
        				<colgroup>
							<col width="15%">
							<col width="75%">
						</colgroup>
	                    <tr>
	                        <th><span style="color:red;">*</span>제목</th>
	                        <td><input type="text" placeholder="제목을 입력하세요." id="review_title" name="review_title" class="form-control" /></td>
	                    </tr>
	                    <tr>
	                        <th>내용</th>
	                        <td><textarea placeholder="내용을 입력하세요." id="review_content" name="review_content" class="form-control" style="height:25rem;"></textarea></td>
	                    </tr>
	                    <tr>
	                        <th><span style="color:red;">*</span>비밀번호</th>
	                        <td>
	                        	<input type="password" maxlength="4" placeholder="****" id="review_password" name="review_password" class="form-control" 
	                        	       oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"/>
	                        	<span style="font-size:0.7rem; color:#32A852;">※ 4자리 이하 숫자를 입력하세요.</span>
                        	</td>
	                    </tr>
	                    <input type="hidden" id="review_writer" name="review_writer" class="form-control" />
	                </tbody>
	            </table>
        	</form>
			
			<!-- 버튼 영역 -->
			<div class="d-flex justify-content-between">
				<div>
					<a href="/review/reviewIndex.do" class="btn btn-outline-success rounded-pill">목록으로</a>
				</div>
				<div>
					<button id="btnRegister" type="button" class="btn btn-outline-success rounded-pill">등록</button>
				</div>
			</div>
			
		</div>

		<!-- 위로가기 버튼 -->
		<div class="d-flex justify-content-end">
			<a href="#" class="scrollToTop">
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