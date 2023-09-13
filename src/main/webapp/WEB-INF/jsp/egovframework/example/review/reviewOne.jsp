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
 
<script type="text/javascript">


	/** OnLoad event **/ 
	$(function() {
		fn_btnEvent();  // 버튼 이벤트 등록
		
        $("input[name='review_title']").attr("readonly", true);       // 초기 화면에서 입력 필드의 readonly 활성화(true)
        $("textarea[name='review_content']").attr("readonly", true);  // 초기 화면에서 입력 필드의 readonly 활성화(true)
		
		fn_update();    // [수정] 버튼
		fn_delete();    // [삭제] 버튼
		
	});
	
	
	/** 버튼 이벤트 등록 */
	function fn_btnEvent() {
		$('a[name=btn]').click(function(e) {
			e.preventDefault();
	
			var btnId = $(this).attr('id');
	
			switch (btnId) {
				case 'btnUpdate' :
					fn_update();
					break;
				case 'btnDelete' :
					fn_delete();
					break;
				case 'btnTop' :
					fn_scrollToTop();
					break;
			}
		});
	}
	
	
	/** 글수정 **/
	function fn_update() {
	    $(document).on('click', '#btnUpdate', function(e) {
	        // 비밀번호 입력
	        var enteredPassword = prompt("비밀번호를 입력하세요:", "");

	        // 입력한 비밀번호를 확인
	        if (enteredPassword !== null) { // 사용자가 취소하지 않은 경우
	            // 비밀번호를 서버로 전송하여 확인
	            $.ajax({
	                type: "POST",
	                url: "../review/checkPassword.do", // 비밀번호 확인을 처리하는 서버의 URL로 수정
	                data: {
	                    review_no: ${vo.review_no},
	                    password: enteredPassword
	                },
	                success: function(response) {
	                    if (response === "true") { // 비밀번호가 일치하는 경우
	                        // console.log("비밀번호 일치 success 테스트  !!!!");
	                        $("input[name='review_title']").attr("readonly", false);       // 입력 필드의 readonly 비활성화(false)
	                        $("textarea[name='review_content']").attr("readonly", false);  // 입력 필드의 readonly 비활성화(false)
	                        
	                        var first = document.getElementById("display1");
	                		var second = document.getElementById("display2");
	                        
	                        first.style.display = 'none';   // [수정], [삭제] 버튼 숨김처리
	                        second.style.display = 'block';   // [저장] 버튼 보임처리
	                        
	                    } else {
	                        alert("비밀번호가 일치하지 않습니다.");
	                    }
	                },
	                error: function() {
	                    alert("비밀번호 확인 중 오류가 발생했습니다.");
	                }
	            });
	        }
	    });
	}
	
	
	/** 글수정 [저장] 버튼 **/
	$(document).on('click', '#btnSave', function(e) {
		
	   // 서버에 보낼 데이터
	   var review_no = ${vo.review_no};
	   var review_title = $("#review_title").val();
	   var review_content = $("#review_content").val();

       // 제목이 비어있는지 확인
       if (review_title.trim() === "") {
           alert("제목을 입력하세요.");
           e.preventDefault(); // 폼 제출 중단
       } else { // 수정된 데이터 [저장] 기능 실행
    	   
    	   // 데이터를 JSON 형식으로 준비
    	   var dataToSave = {
    	       review_no : review_no,
    	       review_title : review_title,
    	       review_content : review_content
    	   };

    	   // 서버로 데이터 전송
    	   $.ajax({
    	       type: "POST",
    	       url: "../review/reviewupdate.do",
    	       data: JSON.stringify(dataToSave), // 데이터를 JSON 문자열로 변환
    	       contentType: "application/json;charset=UTF-8",
    	       success: function(response) {
    	           if (response === "success") {
    	               alert("게시글이 수정되었습니다.");
    	               // 리디렉션
    	               window.location.href = "reviewIndex.do";
    	           } else {
    	               alert("게시글 수정에 실패했습니다.");
    	           }
    	       },
    	       error: function() {
    	           alert("게시글 수정 중 오류가 발생했습니다.");
    	       }
    	   });   
    	   
       }
	});


	/** 글삭제 **/
	function fn_delete() {		
		$(document).on('click', '#btnDelete', function(e) {
	        // 비밀번호 입력
	        var enteredPassword = prompt("비밀번호를 입력하세요:", "");
			
	        // 입력한 비밀번호를 확인
	        if (enteredPassword !== null) { // 사용자가 취소하지 않은 경우
	            // 비밀번호를 서버로 전송하여 확인
	            $.ajax({
	                type: "POST",
	                url: "../review/checkPassword.do", // 비밀번호 확인을 처리하는 서버의 URL로 수정
	                data: {
	                    review_no: ${vo.review_no},
	                    password: enteredPassword
	                },
	                success: function(response) {
	                    if (response === "true") { // 비밀번호가 일치하는 경우
	                    	
	                    	// 글삭제
	            	        var review_no = ${vo.review_no};
	            	        if (confirm("정말 삭제하시겠습니까 ?") == true) {
	            	            $("#update_form").attr("action", "reviewdelete.do?review_no="+review_no);
	            	            $("#update_form").submit();
	            	        } else {
	            	            return;
	            	        }
	            	        
	                    } else {
	                        alert("비밀번호가 일치하지 않습니다.");
	                    }
	                },
	                error: function() {
	                    alert("비밀번호 확인 중 오류가 발생했습니다.");
	                }
	            });
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
				<h1>약국 추천 게시판</h1>
				<hr>
			</div>
			<form id="update_form" action="reviewupdate.do" method="post" encType="multiplart/form-data">
				
				<input type="hidden" value="${vo.review_no}" name="review_no" class="form-control"  />			
				<table class="table mt-2 mb-4">
					<tbody>
						<colgroup>
							<col width="15%">
							<col width="75%">
						</colgroup>
		                <tr>
		                    <th>작성자</th>
		                    <td><span style="font-size:12px; background-color:#f6f6f6; padding:4px; border-radius:25%">${vo.review_writer}</span></td>
		                </tr>
						<tr>
	                        <th><span style="color:red;">*</span>제목</th>
	                        <td><input type="text" value="${vo.review_title}" id="review_title" name="review_title" class="form-control" /></td>
	                    </tr>
	                    <tr>
	                        <th>내용</th>
	                        <td>
	                        	<textarea id="review_content" name="review_content" class="form-control" style="height:25rem;" >${vo.review_content}</textarea>
	                        	<div class="text-end pt-2">
		                        	<span style="color:#7e7e7e; font-size:14px;">${vo.review_created_at} 작성됨</span>
	                        	</div>
                        	</td>
	                    </tr>
		             </tbody>
				</table>
			</form>
			
			<!-- 버튼 영역 -->
			<div class="d-flex justify-content-between">			
				<div>
					<a href="/review/reviewIndex.do" class="btn btn-outline-success rounded-pill">목록으로</a>
				</div>
				<div class="d-flex flex-row">
					<div id="display1">
						<button id="btnUpdate" type="button" class="btn btn-outline-success rounded-pill">수정</button>
						<button id="btnDelete" type="button" class="btn btn-outline-danger rounded-pill">삭제</button>
					</div>
					<div id="display2">
						<button id="btnSave" type="button" class="btn btn-outline-success rounded-pill">저장</button>
					</div>
				</div>
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